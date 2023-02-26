#include <framework/global.h>
#include <framework/core/clock.h>

#include "packet_player.h"

PacketPlayer::~PacketPlayer()
{
    if (m_event)
        m_event->cancel();
}

PacketPlayer::PacketPlayer(const std::string& file)
{
    static uint32_t sessionId = 1;
#ifdef ANDROID
    std::ifstream f(std::string("records/") + file);
#else
    std::ifstream f(std::filesystem::path("records") / file);
#endif
    if (!f.is_open())
        return;
    std::string type, packetHex;
    ticks_t time;
    while (f >> type >> time >> packetHex) {
        std::string packetStr = boost::algorithm::unhex(packetHex);
        auto packet = std::make_shared<std::vector<uint8_t>>(packetStr.begin(), packetStr.end());
        if (type == "<") {
            m_input.push_back(std::make_pair(time, packet));
        } else if (type == ">") {
            m_output.push_back(std::make_pair(time, packet));
        }
    }
}

void PacketPlayer::start(std::function<void(std::shared_ptr<std::vector<uint8_t>>)> recvCallback,
                         std::function<void(boost::system::error_code)> disconnectCallback)
{
    m_start = g_clock.millis();
    m_recvCallback = recvCallback;
    m_disconnectCallback = disconnectCallback;
    m_event = g_dispatcher.scheduleEvent(std::bind(&PacketPlayer::process, this), 50);
}

void PacketPlayer::stop()
{
    if (m_event)
        m_event->cancel();
    m_event = nullptr;
}

void PacketPlayer::onOutputPacket(const OutputMessagePtr& packet)
{
    if (packet->getDataBuffer()[0] == 0x14) { // logout
        m_disconnectCallback(boost::asio::error::eof);
        stop();
    }
}


void PacketPlayer::process()
{
    ticks_t nextPacket = 1;
    while (!m_input.empty()) {
        auto& packet = m_input.front();
        nextPacket = (packet.first + m_start) - g_clock.millis();
        if (nextPacket > 1)
            break;
        m_recvCallback(packet.second);
        m_input.pop_front();
    }

    if (!m_input.empty() && nextPacket > 1) {
        m_event = g_dispatcher.scheduleEvent(std::bind(&PacketPlayer::process, this), nextPacket);
    } else {
        m_disconnectCallback(boost::asio::error::eof);
        stop();
    }
}

