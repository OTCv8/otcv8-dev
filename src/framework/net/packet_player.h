#pragma once

#include <deque>
#include <framework/core/eventdispatcher.h>
#include <framework/net/outputmessage.h>

class PacketPlayer : public LuaObject {
public:
    PacketPlayer(const std::string& file);
    virtual ~PacketPlayer();

    void start(std::function<void(std::shared_ptr<std::vector<uint8_t>>)> recvCallback, std::function<void(boost::system::error_code)> disconnectCallback);
    void stop();

    void onOutputPacket(const OutputMessagePtr& packet);

private:
    void process();

    ticks_t m_start;
    ScheduledEventPtr m_event;
    std::deque<std::pair<ticks_t, std::shared_ptr<std::vector<uint8_t>>>> m_input;
    std::deque<std::pair<ticks_t, std::shared_ptr<std::vector<uint8_t>>>> m_output;
    std::function<void(std::shared_ptr<std::vector<uint8_t>>)> m_recvCallback;
    std::function<void(boost::system::error_code)> m_disconnectCallback;
};
