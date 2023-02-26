/*
 * Copyright (c) 2010-2017 OTClient <https://github.com/edubart/otclient>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "otmlnode.h"
#include "otmlemitter.h"
#include "otmldocument.h"

#include <framework/util/extras.h>

OTMLNodePtr OTMLNode::create(std::string tag, bool unique)
{
    OTMLNodePtr node(new OTMLNode);
    node->setTag(tag);
    node->setUnique(unique);
    return node;
}

OTMLNodePtr OTMLNode::create(std::string tag, std::string value)
{
    OTMLNodePtr node(new OTMLNode);
    node->setTag(tag);
    node->setValue(value);
    node->setUnique(true);
    return node;
}

bool OTMLNode::hasChildren()
{
    for (auto& [tag, children] : m_children) {
        for (auto& child : children) {
            if (!child->isNull())
                return true;
        }
    }
    return false;
}

OTMLNodePtr OTMLNode::get(const std::string& childTag)
{
    if (childTag.size() > 0 && childTag[0] == '!')
        g_logger.fatal(stdext::format("Invalid childTag %s", childTag));

    auto it = m_children.find(childTag);
    if (it == m_children.end())
        return nullptr;

    for (auto& child : it->second) {
        if (!child->isNull())
            return child;
    }

    return nullptr;
}

OTMLNodePtr OTMLNode::at(const std::string& childTag)
{
    OTMLNodePtr res = get(childTag);
    if(!res)
        throw OTMLException(asOTMLNode(), stdext::format("child node with tag '%s' not found", childTag));
    return res;
}

void OTMLNode::addChild(const OTMLNodePtr& newChild)
{
    // replace is needed when the tag is marked as unique
    if(newChild->hasTag()) {
        auto it = m_children.find(newChild->tag());
        if (it != m_children.end()) {
            for (auto& node : it->second) {
                if (!node->isUnique() && !newChild->isUnique())
                    continue;
                newChild->setUnique(true);

                if (node->hasChildren() && newChild->hasChildren()) {
                    OTMLNodePtr tmpNode = node->clone();
                    tmpNode->merge(newChild);
                    newChild->copy(tmpNode);
                }

                it->second.clear();
                break;
            }
        }
    }

    static size_t index = 0;
    if(newChild->getIndex() == 0)
        newChild->setIndex(++index);
    m_children[newChild->tag()].push_back(newChild);
    newChild->lockTag();
}

bool OTMLNode::removeChild(const OTMLNodePtr& oldChild)
{
    auto it = m_children.find(oldChild->tag());
    if (it == m_children.end())
        return false;

    auto it2 = std::find(it->second.begin(), it->second.end(), oldChild);
    if(it2 != it->second.end()) {
        it->second.erase(it2);
        return true;
    }
    return false;
}

void OTMLNode::copy(const OTMLNodePtr& node)
{
    setTag(node->tag());
    setValue(node->rawValue());
    setUnique(node->isUnique());
    setNull(node->isNull());
    setSource(node->source());
    setIndex(node->getIndex());
    clear();
    for (auto& [tag, children] : node->m_children) {
        for (auto& child : children) {
            addChild(child->clone());
        }
    }
}

void OTMLNode::merge(const OTMLNodePtr& node)
{
    for (auto& [tag, children] : node->m_children) {
        for (auto& child : children) {
            addChild(child->clone());
        }
    }
    setTag(node->tag());
    setSource(node->source());
}

void OTMLNode::clear()
{
    m_children.clear();
}

OTMLNodeList OTMLNode::children()
{
    OTMLNodeList ret;
    for (auto& [tag, children] : m_children) {
        for (auto& child : children) {
            if (!child->isNull())
                ret.push_back(child);
        }
    }
    std::sort(ret.begin(), ret.end(), [](auto& n1, auto& n2) {
        return n1->getIndex() < n2->getIndex();
    });
    return ret;
}

OTMLNodePtr OTMLNode::clone()
{
    OTMLNodePtr myClone(new OTMLNode);
    myClone->setTag(m_tag);
    myClone->setValue(m_value);
    myClone->setUnique(m_unique);
    myClone->setNull(m_null);
    myClone->setSource(m_source);
    myClone->setIndex(m_index);
    for (auto& [tag, children] : m_children) {
        for (auto& child : children) {
            myClone->addChild(child->clone());
        }
    }
    return myClone;
}

std::string OTMLNode::emit()
{
    return OTMLEmitter::emitNode(asOTMLNode(), 0);
}

void OTMLNode::setTag(const std::string& tag) { 
    if (m_tagLocked && tag != m_tag) {
        std::string correct_tag = m_tag;
        if (correct_tag.size() > 0 && m_tag[0] == '!')
            correct_tag = correct_tag.substr(1);
        if(correct_tag != tag)
            g_logger.fatal(stdext::format("Trying to setTag for locked QTMLNode %s to %s", m_tag, tag));
    }
    m_tag = tag; 
}
