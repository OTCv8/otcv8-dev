#pragma once

#include <framework/net/inputmessage.h>
#include <framework/net/outputmessage.h>

class PacketRecorder : public LuaObject {
public:
    PacketRecorder(const std::string& file);
    virtual ~PacketRecorder();

    void addInputPacket(const InputMessagePtr& packet);
    void addOutputPacket(const OutputMessagePtr& packet);

private:
    ticks_t m_start;
    std::ofstream m_stream;
    bool m_firstOutput = true;
};
