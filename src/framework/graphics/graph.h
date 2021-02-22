// Graph is a simple, thread-safe class to draw debug informations about FPS, CPU time per frame, Ping, etc.
// It's not optimized, so should be used only as debugging tool

#ifndef GRAPH_H
#define GRAPH_H

#include <framework/global.h>

enum GraphType {
    GRAPH_TOTAL_FRAME_TIME = 0,
    GRAPH_CPU_FRAME_TIME = 1,
    GRAPH_GPU_CALLS = 2,
    GRAPH_GPU_DRAWS = 3,
    GRAPH_PROCESSING_POLL = 4,
    GRAPH_GRAPHICS_POLL = 5,
    GRAPH_DISPATCHER_EVENTS = 6,
    GRAPH_GRAPHICS_EVENTS = 7,
    GRAPH_LATENCY = 8,
    GRAPH_LAST = GRAPH_LATENCY
};

class Graph 
{
    static constexpr int MAX_CAPACITY = 512;
public:
    Graph(const std::string& name, size_t capacity = 100);

    void draw(const Rect& dest);

    void clear();
    void addValue(int value, bool ignoreSmallValues = false);

private:
    std::string m_name;
    size_t m_capacity;
    size_t m_ignores = 0;
    std::deque<int> m_values;
    std::mutex m_mutex;
};

extern Graph g_graphs[GRAPH_LAST + 1];

#endif