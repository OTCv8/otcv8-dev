#include "graph.h"
#include "painter.h"
#include "textrender.h"
#include "fontmanager.h"
#include <framework/core/eventdispatcher.h>

Graph g_graphs[GRAPH_LAST + 1] = {
    {"Total frame time"},
    {"CPU render time"},
    {"GPU calls"},
    {"GPU draws"},
    {"Processing poll time"},
    {"Graphics poll time"},
    {"Dispatcher events"},
    {"Graphics events"},
    {"Latency"}
};

Graph::Graph(const std::string& name, size_t capacity) : m_name(name), m_capacity(capacity)
{
    if (capacity > MAX_CAPACITY)
        g_logger.fatal(stdext::format("Max Graph capacity is %i, tried to create graph with capacity: %i", MAX_CAPACITY, capacity));
}

void Graph::draw(const Rect& dest)
{
    VALIDATE_GRAPHICS_THREAD();
    static std::vector<float> vertices(MAX_CAPACITY * 2, 0); // max 512 lines
    if (dest.width() < 50) return;
    float offsetX = dest.left() + 2;
    float offsetY = dest.top() + 17;
    size_t elements = std::min<size_t>(m_values.size(), dest.width() / 2 - 2);

    vertices[0] = dest.left();
    vertices[1] = offsetY;
    vertices[2] = dest.right();
    vertices[3] = offsetY;
    vertices[4] = dest.right();
    vertices[5] = dest.bottom();
    vertices[6] = dest.left();
    vertices[7] = dest.bottom();
    vertices[8] = dest.left();
    vertices[9] = offsetY;

    g_painter->drawLine(vertices, 5);
    g_text.drawText(dest, m_name, g_fonts.getDefaultFont());

    m_mutex.lock();
    size_t start = m_values.size() - elements;
    int minVal = 0xFFFFFF, maxVal = -0xFFFFFF;
    for (size_t i = start; i < m_values.size(); ++i) {
        if (minVal > m_values[i])
            minVal = m_values[i];
        if (maxVal < m_values[i])
            maxVal = m_values[i];
    }
    // round
    maxVal = (1 + maxVal / 10) * 10;
    minVal = (minVal / 10) * 10; 
    float step = (float)(dest.height() - 21) / std::max<float>(1, (maxVal - minVal));
    for (size_t i = start, j = 0; i < m_values.size(); ++i) {
        vertices[j] = offsetX + j;
        vertices[j + 1] = offsetY + 1 + (maxVal - m_values[i]) * step;
        j += 2;
    }
    m_mutex.unlock();

    if (elements > 0) {
        g_text.drawText(dest, std::to_string(m_values.back()), g_fonts.getDefaultFont(), Color::white, Fw::AlignTopRight);
        g_text.drawText(Rect(dest.left() + 1, offsetY, 50, 15), std::to_string(maxVal), g_fonts.getDefaultFont());
        g_text.drawText(Rect(dest.left() + 1, dest.bottom() - 14, 50, 15), std::to_string(minVal), g_fonts.getDefaultFont());
    }
    g_painter->setColor(Color::white);
    g_painter->drawLine(vertices, elements);
}

void Graph::clear()
{
    std::lock_guard<std::mutex> lock(m_mutex);
    m_values.clear();
}

void Graph::addValue(int value, bool ignoreSmallValues)
{
    std::lock_guard<std::mutex> lock(m_mutex);
    if (ignoreSmallValues) {
        if (!m_values.empty() && m_values.back() <= 2 && value <= 2 && ++m_ignores <= 10)
            return;
        m_ignores = 0;
    }
    m_values.push_back(value);
    if (m_values.size() > m_capacity)
        m_values.pop_front();
}
