---
doc_id: "cpp-api-7f8aa15343f8"
source_path: "framework/ui/uiwidget.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: uiwidget.h"
summary: "Dokumentacja API C++ dla framework/ui/uiwidget.h"
tags: ["cpp", "api", "otclient"]
---

# framework/ui/uiwidget.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu uiwidget.

## Classes/Structs

### Struktura: `EdgeGroup`

**Szablon:** `template<typename T = int>`

### Klasa: `UIWidget`

| Member | Brief | Signature |
|--------|-------|-----------|
| `draw` |  | `virtual void draw(const Rect& visibleRect, Fw::DrawPane drawPane)` |
| `drawSelf` |  | `virtual void drawSelf(Fw::DrawPane drawPane)` |
| `drawChildren` |  | `virtual void drawChildren(const Rect& visibleRect, Fw::DrawPane drawPane)` |
| `m_id` |  | `std::string m_id` |
| `m_source` |  | `std::string m_source` |
| `m_rect` |  | `Rect m_rect` |
| `m_virtualOffset` |  | `Point m_virtualOffset` |
| `m_autoDraw` |  | `stdext::boolean<true> m_autoDraw` |
| `m_enabled` |  | `stdext::boolean<true> m_enabled` |
| `m_visible` |  | `stdext::boolean<true> m_visible` |
| `m_focusable` |  | `stdext::boolean<true> m_focusable` |
| `m_fixedSize` |  | `stdext::boolean<false> m_fixedSize` |
| `m_phantom` |  | `stdext::boolean<false> m_phantom` |
| `m_draggable` |  | `stdext::boolean<false> m_draggable` |
| `m_destroyed` |  | `stdext::boolean<false> m_destroyed` |
| `m_clipping` |  | `stdext::boolean<false> m_clipping` |
| `m_layout` |  | `UILayoutPtr m_layout` |
| `m_parent` |  | `UIWidgetPtr m_parent` |
| `m_parentId` |  | `std::string m_parentId` |
| `m_children` |  | `UIWidgetList m_children` |
| `m_lockedChildren` |  | `UIWidgetList m_lockedChildren` |
| `m_childrenShortcuts` |  | `std::map<UIWidgetPtr, std::string> m_childrenShortcuts` |
| `m_focusedChild` |  | `UIWidgetPtr m_focusedChild` |
| `m_style` |  | `OTMLNodePtr m_style` |
| `m_clickTimer` |  | `Timer m_clickTimer` |
| `m_lastFocusReason` |  | `Fw::FocusReason m_lastFocusReason` |
| `m_autoFocusPolicy` |  | `Fw::AutoFocusPolicy m_autoFocusPolicy` |
| `addChild` |  | `void addChild(const UIWidgetPtr& child)` |
| `onChildIdChange` |  | `void onChildIdChange(const UIWidgetPtr& child)` |
| `insertChild` |  | `void insertChild(int index, const UIWidgetPtr& child)` |
| `removeChild` |  | `void removeChild(UIWidgetPtr child)` |
| `focusChild` |  | `void focusChild(const UIWidgetPtr& child, Fw::FocusReason reason)` |
| `focusNextChild` |  | `void focusNextChild(Fw::FocusReason reason, bool rotate = false)` |
| `focusPreviousChild` |  | `void focusPreviousChild(Fw::FocusReason reason, bool rotate = false)` |
| `lowerChild` |  | `void lowerChild(UIWidgetPtr child)` |
| `raiseChild` |  | `void raiseChild(UIWidgetPtr child)` |
| `moveChildToIndex` |  | `void moveChildToIndex(const UIWidgetPtr& child, int index)` |
| `reorderChildren` |  | `void reorderChildren(const std::vector<UIWidgetPtr>& childrens)` |
| `lockChild` |  | `void lockChild(const UIWidgetPtr& child)` |
| `unlockChild` |  | `void unlockChild(const UIWidgetPtr& child)` |
| `mergeStyle` |  | `void mergeStyle(const OTMLNodePtr& styleNode)` |
| `applyStyle` |  | `void applyStyle(const OTMLNodePtr& styleNode)` |
| `addAnchor` |  | `void addAnchor(Fw::AnchorEdge anchoredEdge, const std::string& hookedWidgetId, Fw::AnchorEdge hookedEdge)` |
| `removeAnchor` |  | `void removeAnchor(Fw::AnchorEdge anchoredEdge)` |
| `fill` |  | `void fill(const std::string& hookedWidgetId)` |
| `centerIn` |  | `void centerIn(const std::string& hookedWidgetId)` |
| `breakAnchors` |  | `void breakAnchors()` |
| `updateParentLayout` |  | `void updateParentLayout()` |
| `updateLayout` |  | `void updateLayout()` |
| `lock` |  | `void lock()` |
| `unlock` |  | `void unlock()` |
| `focus` |  | `void focus()` |
| `recursiveFocus` |  | `void recursiveFocus(Fw::FocusReason reason)` |
| `lower` |  | `void lower()` |
| `raise` |  | `void raise()` |
| `grabMouse` |  | `void grabMouse()` |
| `ungrabMouse` |  | `void ungrabMouse()` |
| `grabKeyboard` |  | `void grabKeyboard()` |
| `ungrabKeyboard` |  | `void ungrabKeyboard()` |
| `bindRectToParent` |  | `void bindRectToParent()` |
| `destroy` |  | `void destroy()` |
| `destroyChildren` |  | `void destroyChildren()` |
| `setId` |  | `void setId(const std::string& id)` |
| `setParent` |  | `void setParent(const UIWidgetPtr& parent)` |
| `setLayout` |  | `void setLayout(const UILayoutPtr& layout)` |
| `setRect` |  | `bool setRect(const Rect& rect)` |
| `setStyle` |  | `void setStyle(const std::string& styleName)` |
| `setStyleFromNode` |  | `void setStyleFromNode(const OTMLNodePtr& styleNode)` |
| `setEnabled` |  | `void setEnabled(bool enabled)` |
| `setVisible` |  | `void setVisible(bool visible)` |
| `setAutoDraw` |  | `void setAutoDraw(bool value)` |
| `setOn` |  | `void setOn(bool on)` |
| `setChecked` |  | `void setChecked(bool checked)` |
| `setFocusable` |  | `void setFocusable(bool focusable)` |
| `setPhantom` |  | `void setPhantom(bool phantom)` |
| `setDraggable` |  | `void setDraggable(bool draggable)` |
| `setFixedSize` |  | `void setFixedSize(bool fixed)` |
| `setClipping` |  | `void setClipping(bool clipping) { m_clipping = clipping; }` |
| `setLastFocusReason` |  | `void setLastFocusReason(Fw::FocusReason reason)` |
| `setAutoFocusPolicy` |  | `void setAutoFocusPolicy(Fw::AutoFocusPolicy policy)` |
| `setAutoRepeatDelay` |  | `void setAutoRepeatDelay(int delay) { m_autoRepeatDelay = delay; }` |
| `setVirtualOffset` |  | `void setVirtualOffset(const Point& offset)` |
| `isAnchored` |  | `bool isAnchored()` |
| `isChildLocked` |  | `bool isChildLocked(const UIWidgetPtr& child)` |
| `hasChild` |  | `bool hasChild(const UIWidgetPtr& child)` |
| `getChildIndex` |  | `int getChildIndex(const UIWidgetPtr& child)` |
| `getPaddingRect` |  | `Rect getPaddingRect()` |
| `getMarginRect` |  | `Rect getMarginRect()` |
| `getChildrenRect` |  | `Rect getChildrenRect()` |
| `getAnchoredLayout` |  | `UIAnchorLayoutPtr getAnchoredLayout()` |
| `getRootParent` |  | `UIWidgetPtr getRootParent()` |
| `getChildAfter` |  | `UIWidgetPtr getChildAfter(const UIWidgetPtr& relativeChild)` |
| `getChildBefore` |  | `UIWidgetPtr getChildBefore(const UIWidgetPtr& relativeChild)` |
| `getChildById` |  | `UIWidgetPtr getChildById(const std::string& childId)` |
| `getChildByPos` |  | `UIWidgetPtr getChildByPos(const Point& childPos)` |
| `getChildByIndex` |  | `UIWidgetPtr getChildByIndex(int index)` |
| `recursiveGetChildById` |  | `UIWidgetPtr recursiveGetChildById(const std::string& id)` |
| `recursiveGetChildByPos` |  | `UIWidgetPtr recursiveGetChildByPos(const Point& childPos, bool wantsPhantom)` |
| `recursiveGetChildren` |  | `UIWidgetList recursiveGetChildren()` |
| `recursiveGetChildrenByPos` |  | `UIWidgetList recursiveGetChildrenByPos(const Point& childPos)` |
| `recursiveGetChildrenByMarginPos` |  | `UIWidgetList recursiveGetChildrenByMarginPos(const Point& childPos)` |
| `backwardsGetWidgetById` |  | `UIWidgetPtr backwardsGetWidgetById(const std::string& id)` |
| `setState` |  | `bool setState(Fw::WidgetState state, bool on)` |
| `hasState` |  | `bool hasState(Fw::WidgetState state)` |
| `onStyleApply` |  | `virtual void onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)` |
| `onGeometryChange` |  | `virtual void onGeometryChange(const Rect& oldRect, const Rect& newRect)` |
| `onLayoutUpdate` |  | `virtual void onLayoutUpdate()` |
| `onFocusChange` |  | `virtual void onFocusChange(bool focused, Fw::FocusReason reason)` |
| `onChildFocusChange` |  | `virtual void onChildFocusChange(const UIWidgetPtr& focusedChild, const UIWidgetPtr& unfocusedChild, Fw::FocusReason reason)` |
| `onHoverChange` |  | `virtual void onHoverChange(bool hovered)` |
| `onVisibilityChange` |  | `virtual void onVisibilityChange(bool visible)` |
| `onDragEnter` |  | `virtual bool onDragEnter(const Point& mousePos)` |
| `onDragLeave` |  | `virtual bool onDragLeave(UIWidgetPtr droppedWidget, const Point& mousePos)` |
| `onDragMove` |  | `virtual bool onDragMove(const Point& mousePos, const Point& mouseMoved)` |
| `onDrop` |  | `virtual bool onDrop(UIWidgetPtr draggedWidget, const Point& mousePos)` |
| `onKeyText` |  | `virtual bool onKeyText(const std::string& keyText)` |
| `onKeyDown` |  | `virtual bool onKeyDown(uchar keyCode, int keyboardModifiers)` |
| `onKeyPress` |  | `virtual bool onKeyPress(uchar keyCode, int keyboardModifiers, int autoRepeatTicks)` |
| `onKeyUp` |  | `virtual bool onKeyUp(uchar keyCode, int keyboardModifiers)` |
| `onMousePress` |  | `virtual bool onMousePress(const Point& mousePos, Fw::MouseButton button)` |
| `onMouseRelease` |  | `virtual bool onMouseRelease(const Point& mousePos, Fw::MouseButton button)` |
| `onMouseMove` |  | `virtual bool onMouseMove(const Point& mousePos, const Point& mouseMoved)` |
| `onMouseWheel` |  | `virtual bool onMouseWheel(const Point& mousePos, Fw::MouseWheelDirection direction)` |
| `onClick` |  | `virtual bool onClick(const Point& mousePos)` |
| `onDoubleClick` |  | `virtual bool onDoubleClick(const Point& mousePos)` |
| `propagateOnKeyText` |  | `bool propagateOnKeyText(const std::string& keyText)` |
| `propagateOnKeyDown` |  | `bool propagateOnKeyDown(uchar keyCode, int keyboardModifiers)` |
| `propagateOnKeyPress` |  | `bool propagateOnKeyPress(uchar keyCode, int keyboardModifiers, int autoRepeatTicks)` |
| `propagateOnKeyUp` |  | `bool propagateOnKeyUp(uchar keyCode, int keyboardModifiers)` |
| `propagateOnMouseEvent` |  | `bool propagateOnMouseEvent(const Point& mousePos, UIWidgetList& widgetList)` |
| `propagateOnMouseMove` |  | `bool propagateOnMouseMove(const Point& mousePos, const Point& mouseMoved, UIWidgetList& widgetList)` |
| `resize` |  | `void resize(int width, int height) { setRect(Rect(getPosition(), Size(width, height))); }` |
| `move` |  | `void move(int x, int y) { setRect(Rect(x, y, getSize())); }` |
| `rotate` |  | `void rotate(float degrees) { setRotation(degrees); }` |
| `hide` |  | `void hide() { setVisible(false); }` |
| `show` |  | `void show() { setVisible(true); }` |
| `disable` |  | `void disable() { setEnabled(false); }` |
| `enable` |  | `void enable() { setEnabled(true); }` |
| `isActive` |  | `bool isActive() { return hasState(Fw::ActiveState); }` |
| `isEnabled` |  | `bool isEnabled() { return !hasState(Fw::DisabledState); }` |
| `isDisabled` |  | `bool isDisabled() { return hasState(Fw::DisabledState); }` |
| `isFocused` |  | `bool isFocused() { return hasState(Fw::FocusState); }` |
| `isHovered` |  | `bool isHovered() { return hasState(Fw::HoverState); }` |
| `isPressed` |  | `bool isPressed() { return hasState(Fw::PressedState); }` |
| `isFirst` |  | `bool isFirst() { return hasState(Fw::FirstState); }` |
| `isMiddle` |  | `bool isMiddle() { return hasState(Fw::MiddleState); }` |
| `isLast` |  | `bool isLast() { return hasState(Fw::LastState); }` |
| `isAlternate` |  | `bool isAlternate() { return hasState(Fw::AlternateState); }` |
| `isChecked` |  | `bool isChecked() { return hasState(Fw::CheckedState); }` |
| `isOn` |  | `bool isOn() { return hasState(Fw::OnState); }` |
| `isDragging` |  | `bool isDragging() { return hasState(Fw::DraggingState); }` |
| `isVisible` |  | `bool isVisible() { return !hasState(Fw::HiddenState); }` |
| `isHidden` |  | `bool isHidden() { return hasState(Fw::HiddenState); }` |
| `isExplicitlyEnabled` |  | `bool isExplicitlyEnabled() { return m_enabled; }` |
| `isExplicitlyVisible` |  | `bool isExplicitlyVisible() { return m_visible; }` |
| `isAutoDraw` |  | `bool isAutoDraw() { return m_autoDraw; }` |
| `isFocusable` |  | `bool isFocusable() { return m_focusable; }` |
| `isPhantom` |  | `bool isPhantom() { return m_phantom; }` |
| `isDraggable` |  | `bool isDraggable() { return m_draggable; }` |
| `isFixedSize` |  | `bool isFixedSize() { return m_fixedSize; }` |
| `isClipping` |  | `bool isClipping() { return m_clipping; }` |
| `isDestroyed` |  | `bool isDestroyed() { return m_destroyed; }` |
| `hasChildren` |  | `bool hasChildren() { return m_children.size() > 0; }` |
| `containsMarginPoint` |  | `bool containsMarginPoint(const Point& point) { return getMarginRect().contains(point); }` |
| `containsPaddingPoint` |  | `bool containsPaddingPoint(const Point& point) { return getPaddingRect().contains(point); }` |
| `containsPoint` |  | `bool containsPoint(const Point& point) { return m_rect.contains(point); }` |
| `getId` |  | `std::string getId() { return m_id; }` |
| `getSource` |  | `std::string getSource() { return m_source; }` |
| `getParent` |  | `UIWidgetPtr getParent() { return m_parent; }` |
| `getParentId` |  | `std::string getParentId() { return m_parentId; }` |
| `getFocusedChild` |  | `UIWidgetPtr getFocusedChild() { return m_focusedChild; }` |
| `getChildren` |  | `UIWidgetList getChildren() { return m_children; }` |
| `getFirstChild` |  | `UIWidgetPtr getFirstChild() { return getChildByIndex(1); }` |
| `getLastChild` |  | `UIWidgetPtr getLastChild() { return getChildByIndex(-1); }` |
| `getLayout` |  | `UILayoutPtr getLayout() { return m_layout; }` |
| `getStyle` |  | `OTMLNodePtr getStyle() { return m_style; }` |
| `getChildCount` |  | `int getChildCount() { return m_children.size(); }` |
| `getLastFocusReason` |  | `Fw::FocusReason getLastFocusReason() { return m_lastFocusReason; }` |
| `getAutoFocusPolicy` |  | `Fw::AutoFocusPolicy getAutoFocusPolicy() { return m_autoFocusPolicy; }` |
| `getAutoRepeatDelay` |  | `int getAutoRepeatDelay() { return m_autoRepeatDelay; }` |
| `getVirtualOffset` |  | `Point getVirtualOffset() { return m_virtualOffset; }` |
| `getStyleName` |  | `std::string getStyleName() { return m_style->tag(); }` |
| `getLastClickPosition` |  | `Point getLastClickPosition() { return m_lastClickPosition; }` |
| `isRootChild` |  | `bool isRootChild()` |
| `m_isRootChild` |  | `return m_isRootChild` |
| `setRootChild` |  | `void setRootChild(bool v)` |
| `drawBackground` |  | `void drawBackground(const Rect& screenCoords)` |
| `drawBorder` |  | `void drawBorder(const Rect& screenCoords)` |
| `drawIcon` |  | `void drawIcon(const Rect& screenCoords)` |
| `m_color` |  | `Color m_color` |
| `m_backgroundColor` |  | `Color m_backgroundColor` |
| `m_backgroundRect` |  | `Rect m_backgroundRect` |
| `m_icon` |  | `TexturePtr m_icon` |
| `m_iconColor` |  | `Color m_iconColor` |
| `m_iconRect` |  | `Rect m_iconRect` |
| `m_iconClipRect` |  | `Rect m_iconClipRect` |
| `m_iconPath` |  | `std::string m_iconPath` |
| `m_iconAlign` |  | `Fw::AlignmentFlag m_iconAlign` |
| `m_borderColor` |  | `EdgeGroup<Color> m_borderColor` |
| `m_borderWidth` |  | `EdgeGroup<int> m_borderWidth` |
| `m_margin` |  | `EdgeGroup<int> m_margin` |
| `m_padding` |  | `EdgeGroup<int> m_padding` |
| `m_opacity` |  | `float m_opacity` |
| `m_rotation` |  | `float m_rotation` |
| `m_autoRepeatDelay` |  | `int m_autoRepeatDelay` |
| `m_lastClickPosition` |  | `Point m_lastClickPosition` |
| `m_isRootChild` |  | `bool m_isRootChild = false; // for stats` |
| `setX` |  | `void setX(int x) { move(x, getY()); }` |
| `setY` |  | `void setY(int y) { move(getX(), y); }` |
| `setWidth` |  | `void setWidth(int width) { resize(width, getHeight()); }` |
| `setHeight` |  | `void setHeight(int height) { resize(getWidth(), height); }` |
| `setSize` |  | `void setSize(const Size& size) { resize(size.width(), size.height()); }` |
| `setPosition` |  | `void setPosition(const Point& pos) { move(pos.x, pos.y); }` |
| `setColor` |  | `void setColor(const Color& color) { m_color = color; }` |
| `setBackgroundColor` |  | `void setBackgroundColor(const Color& color) { m_backgroundColor = color; }` |
| `setBackgroundOffsetX` |  | `void setBackgroundOffsetX(int x) { m_backgroundRect.setX(x); }` |
| `setBackgroundOffsetY` |  | `void setBackgroundOffsetY(int y) { m_backgroundRect.setX(y); }` |
| `setBackgroundOffset` |  | `void setBackgroundOffset(const Point& pos) { m_backgroundRect.move(pos); }` |
| `setBackgroundWidth` |  | `void setBackgroundWidth(int width) { m_backgroundRect.setWidth(width); }` |
| `setBackgroundHeight` |  | `void setBackgroundHeight(int height) { m_backgroundRect.setHeight(height); }` |
| `setBackgroundSize` |  | `void setBackgroundSize(const Size& size) { m_backgroundRect.resize(size); }` |
| `setBackgroundRect` |  | `void setBackgroundRect(const Rect& rect) { m_backgroundRect = rect; }` |
| `setIcon` |  | `void setIcon(const std::string& iconFile)` |
| `setIconColor` |  | `void setIconColor(const Color& color) { m_iconColor = color; }` |
| `setIconOffsetX` |  | `void setIconOffsetX(int x) { m_iconOffset.x = x; }` |
| `setIconOffsetY` |  | `void setIconOffsetY(int y) { m_iconOffset.y = y; }` |
| `setIconOffset` |  | `void setIconOffset(const Point& pos) { m_iconOffset = pos; }` |
| `setIconWidth` |  | `void setIconWidth(int width) { m_iconRect.setWidth(width); }` |
| `setIconHeight` |  | `void setIconHeight(int height) { m_iconRect.setHeight(height); }` |
| `setIconSize` |  | `void setIconSize(const Size& size) { m_iconRect.resize(size); }` |
| `setIconRect` |  | `void setIconRect(const Rect& rect) { m_iconRect = rect; }` |
| `setIconClip` |  | `void setIconClip(const Rect& rect) { m_iconClipRect = rect; }` |
| `setIconAlign` |  | `void setIconAlign(Fw::AlignmentFlag align) { m_iconAlign = align; }` |
| `setBorderWidth` |  | `void setBorderWidth(int width) { m_borderWidth.set(width); updateLayout(); }` |
| `setBorderWidthTop` |  | `void setBorderWidthTop(int width) { m_borderWidth.top = width; }` |
| `setBorderWidthRight` |  | `void setBorderWidthRight(int width) { m_borderWidth.right = width; }` |
| `setBorderWidthBottom` |  | `void setBorderWidthBottom(int width) { m_borderWidth.bottom = width; }` |
| `setBorderWidthLeft` |  | `void setBorderWidthLeft(int width) { m_borderWidth.left = width; }` |
| `setBorderColor` |  | `void setBorderColor(const Color& color) { m_borderColor.set(color); updateLayout(); }` |
| `setBorderColorTop` |  | `void setBorderColorTop(const Color& color) { m_borderColor.top = color; }` |
| `setBorderColorRight` |  | `void setBorderColorRight(const Color& color) { m_borderColor.right = color; }` |
| `setBorderColorBottom` |  | `void setBorderColorBottom(const Color& color) { m_borderColor.bottom = color; }` |
| `setBorderColorLeft` |  | `void setBorderColorLeft(const Color& color) { m_borderColor.left = color; }` |
| `setMargin` |  | `void setMargin(int margin) { m_margin.set(margin); updateParentLayout(); }` |
| `setMarginHorizontal` |  | `void setMarginHorizontal(int margin) { m_margin.right = m_margin.left = margin; updateParentLayout(); }` |
| `setMarginVertical` |  | `void setMarginVertical(int margin) { m_margin.bottom = m_margin.top = margin; updateParentLayout(); }` |
| `setMarginTop` |  | `void setMarginTop(int margin) { m_margin.top = margin; updateParentLayout(); }` |
| `setMarginRight` |  | `void setMarginRight(int margin) { m_margin.right = margin; updateParentLayout(); }` |
| `setMarginBottom` |  | `void setMarginBottom(int margin) { m_margin.bottom = margin; updateParentLayout(); }` |
| `setMarginLeft` |  | `void setMarginLeft(int margin) { m_margin.left = margin; updateParentLayout(); }` |
| `setPadding` |  | `void setPadding(int padding) { m_padding.top = m_padding.right = m_padding.bottom = m_padding.left = padding; updateLayout(); }` |
| `setPaddingHorizontal` |  | `void setPaddingHorizontal(int padding) { m_padding.right = m_padding.left = padding; updateLayout(); }` |
| `setPaddingVertical` |  | `void setPaddingVertical(int padding) { m_padding.bottom = m_padding.top = padding; updateLayout(); }` |
| `setPaddingTop` |  | `void setPaddingTop(int padding) { m_padding.top = padding; updateLayout(); }` |
| `setPaddingRight` |  | `void setPaddingRight(int padding) { m_padding.right = padding; updateLayout(); }` |
| `setPaddingBottom` |  | `void setPaddingBottom(int padding) { m_padding.bottom = padding; updateLayout(); }` |
| `setPaddingLeft` |  | `void setPaddingLeft(int padding) { m_padding.left = padding; updateLayout(); }` |
| `setOpacity` |  | `void setOpacity(float opacity) { m_opacity = stdext::clamp<float>(opacity, 0.0f, 1.0f); }` |
| `setRotation` |  | `void setRotation(float degrees) { m_rotation = degrees; }` |
| `setChangeCursorImage` |  | `void setChangeCursorImage(bool enable) { m_changeCursorImage = enable; }` |
| `setCursor` |  | `void setCursor(const std::string& cursor)` |
| `getX` |  | `int getX() { return m_rect.x(); }` |
| `getY` |  | `int getY() { return m_rect.y(); }` |
| `getPosition` |  | `Point getPosition() { return m_rect.topLeft(); }` |
| `getWidth` |  | `int getWidth() { return m_rect.width(); }` |
| `getHeight` |  | `int getHeight() { return m_rect.height(); }` |
| `getSize` |  | `Size getSize() { return m_rect.size(); }` |
| `getRect` |  | `Rect getRect() { return m_rect; }` |
| `getColor` |  | `Color getColor() { return m_color; }` |
| `getBackgroundColor` |  | `Color getBackgroundColor() { return m_backgroundColor; }` |
| `getBackgroundOffsetX` |  | `int getBackgroundOffsetX() { return m_backgroundRect.x(); }` |
| `getBackgroundOffsetY` |  | `int getBackgroundOffsetY() { return m_backgroundRect.y(); }` |
| `getBackgroundOffset` |  | `Point getBackgroundOffset() { return m_backgroundRect.topLeft(); }` |
| `getBackgroundWidth` |  | `int getBackgroundWidth() { return m_backgroundRect.width(); }` |
| `getBackgroundHeight` |  | `int getBackgroundHeight() { return m_backgroundRect.height(); }` |
| `getBackgroundSize` |  | `Size getBackgroundSize() { return m_backgroundRect.size(); }` |
| `getBackgroundRect` |  | `Rect getBackgroundRect() { return m_backgroundRect; }` |
| `getIconColor` |  | `Color getIconColor() { return m_iconColor; }` |
| `getIconOffsetX` |  | `int getIconOffsetX() { return m_iconOffset.x; }` |
| `getIconOffsetY` |  | `int getIconOffsetY() { return m_iconOffset.y; }` |
| `getIconOffset` |  | `Point getIconOffset() { return m_iconOffset; }` |
| `getIconWidth` |  | `int getIconWidth() { return m_iconRect.width(); }` |
| `getIconHeight` |  | `int getIconHeight() { return m_iconRect.height(); }` |
| `getIconSize` |  | `Size getIconSize() { return m_iconRect.size(); }` |
| `getIconRect` |  | `Rect getIconRect() { return m_iconRect; }` |
| `getIconClip` |  | `Rect getIconClip() { return m_iconClipRect; }` |
| `getIconPath` |  | `std::string getIconPath() { return m_iconPath; }` |
| `getIconAlign` |  | `Fw::AlignmentFlag getIconAlign() { return m_iconAlign; }` |
| `getBorderTopColor` |  | `Color getBorderTopColor() { return m_borderColor.top; }` |
| `getBorderRightColor` |  | `Color getBorderRightColor() { return m_borderColor.right; }` |
| `getBorderBottomColor` |  | `Color getBorderBottomColor() { return m_borderColor.bottom; }` |
| `getBorderLeftColor` |  | `Color getBorderLeftColor() { return m_borderColor.left; }` |
| `getBorderTopWidth` |  | `int getBorderTopWidth() { return m_borderWidth.top; }` |
| `getBorderRightWidth` |  | `int getBorderRightWidth() { return m_borderWidth.right; }` |
| `getBorderBottomWidth` |  | `int getBorderBottomWidth() { return m_borderWidth.bottom; }` |
| `getBorderLeftWidth` |  | `int getBorderLeftWidth() { return m_borderWidth.left; }` |
| `getMarginTop` |  | `int getMarginTop() { return m_margin.top; }` |
| `getMarginRight` |  | `int getMarginRight() { return m_margin.right; }` |
| `getMarginBottom` |  | `int getMarginBottom() { return m_margin.bottom; }` |
| `getMarginLeft` |  | `int getMarginLeft() { return m_margin.left; }` |
| `getPaddingTop` |  | `int getPaddingTop() { return m_padding.top; }` |
| `getPaddingRight` |  | `int getPaddingRight() { return m_padding.right; }` |
| `getPaddingBottom` |  | `int getPaddingBottom() { return m_padding.bottom; }` |
| `getPaddingLeft` |  | `int getPaddingLeft() { return m_padding.left; }` |
| `getOpacity` |  | `float getOpacity() { return m_opacity; }` |
| `getRotation` |  | `float getRotation() { return m_rotation; }` |
| `isChangingCursorImage` |  | `bool isChangingCursorImage() { return m_changeCursorImage; }` |
| `drawImage` |  | `void drawImage(const Rect& screenCoords)` |
| `m_imageTexture` |  | `TexturePtr m_imageTexture` |
| `m_imageClipRect` |  | `Rect m_imageClipRect` |
| `m_imageRect` |  | `Rect m_imageRect` |
| `m_imageColor` |  | `Color m_imageColor` |
| `m_iconOffset` |  | `Point m_iconOffset` |
| `m_imageFixedRatio` |  | `stdext::boolean<false> m_imageFixedRatio` |
| `m_imageRepeated` |  | `stdext::boolean<false> m_imageRepeated` |
| `m_imageSmooth` |  | `stdext::boolean<true> m_imageSmooth` |
| `m_imageAutoResize` |  | `stdext::boolean<false> m_imageAutoResize` |
| `m_imageBorder` |  | `EdgeGroup<int> m_imageBorder` |
| `m_shader` |  | `std::string m_shader` |
| `setQRCode` |  | `void setQRCode(const std::string& code, int border)` |
| `setImageSource` |  | `void setImageSource(const std::string& source)` |
| `setImageSourceBase64` |  | `void setImageSourceBase64(const std::string & data)` |
| `setImageClip` |  | `void setImageClip(const Rect& clipRect) { m_imageClipRect = clipRect; updateImageCache(); }` |
| `setImageOffsetX` |  | `void setImageOffsetX(int x) { m_imageRect.setX(x); updateImageCache(); }` |
| `setImageOffsetY` |  | `void setImageOffsetY(int y) { m_imageRect.setY(y); updateImageCache(); }` |
| `setImageOffset` |  | `void setImageOffset(const Point& pos) { m_imageRect.move(pos); updateImageCache(); }` |
| `setImageWidth` |  | `void setImageWidth(int width) { m_imageRect.setWidth(width); updateImageCache(); }` |
| `setImageHeight` |  | `void setImageHeight(int height) { m_imageRect.setHeight(height); updateImageCache(); }` |
| `setImageSize` |  | `void setImageSize(const Size& size) { m_imageRect.resize(size); updateImageCache(); }` |
| `setImageRect` |  | `void setImageRect(const Rect& rect) { m_imageRect = rect; updateImageCache(); }` |
| `setImageColor` |  | `void setImageColor(const Color& color) { m_imageColor = color; updateImageCache(); }` |
| `setImageFixedRatio` |  | `void setImageFixedRatio(bool fixedRatio) { m_imageFixedRatio = fixedRatio; updateImageCache(); }` |
| `setImageRepeated` |  | `void setImageRepeated(bool repeated) { m_imageRepeated = repeated; updateImageCache(); }` |
| `setImageSmooth` |  | `void setImageSmooth(bool smooth) { m_imageSmooth = smooth; }` |
| `setImageAutoResize` |  | `void setImageAutoResize(bool autoResize) { m_imageAutoResize = autoResize; }` |
| `setImageBorderTop` |  | `void setImageBorderTop(int border) { m_imageBorder.top = border; configureBorderImage(); }` |
| `setImageBorderRight` |  | `void setImageBorderRight(int border) { m_imageBorder.right = border; configureBorderImage(); }` |
| `setImageBorderBottom` |  | `void setImageBorderBottom(int border) { m_imageBorder.bottom = border; configureBorderImage(); }` |
| `setImageBorderLeft` |  | `void setImageBorderLeft(int border) { m_imageBorder.left = border; configureBorderImage(); }` |
| `setImageBorder` |  | `void setImageBorder(int border) { m_imageBorder.set(border); configureBorderImage(); }` |
| `setImageShader` |  | `void setImageShader(const std::string& str) { m_shader = str; }` |
| `getImageClip` |  | `Rect getImageClip() { return m_imageClipRect; }` |
| `getImageOffsetX` |  | `int getImageOffsetX() { return m_imageRect.x(); }` |
| `getImageOffsetY` |  | `int getImageOffsetY() { return m_imageRect.y(); }` |
| `getImageOffset` |  | `Point getImageOffset() { return m_imageRect.topLeft(); }` |
| `getImageWidth` |  | `int getImageWidth() { return m_imageRect.width(); }` |
| `getImageHeight` |  | `int getImageHeight() { return m_imageRect.height(); }` |
| `getImageSize` |  | `Size getImageSize() { return m_imageRect.size(); }` |
| `getImageRect` |  | `Rect getImageRect() { return m_imageRect; }` |
| `getImageColor` |  | `Color getImageColor() { return m_imageColor; }` |
| `isImageFixedRatio` |  | `bool isImageFixedRatio() { return m_imageFixedRatio; }` |
| `isImageSmooth` |  | `bool isImageSmooth() { return m_imageSmooth; }` |
| `isImageAutoResize` |  | `bool isImageAutoResize() { return m_imageAutoResize; }` |
| `getImageBorderTop` |  | `int getImageBorderTop() { return m_imageBorder.top; }` |
| `getImageBorderRight` |  | `int getImageBorderRight() { return m_imageBorder.right; }` |
| `getImageBorderBottom` |  | `int getImageBorderBottom() { return m_imageBorder.bottom; }` |
| `getImageBorderLeft` |  | `int getImageBorderLeft() { return m_imageBorder.left; }` |
| `getImageTextureWidth` |  | `int getImageTextureWidth() { return m_imageTexture ? m_imageTexture->getWidth() : 0; }` |
| `getImageTextureHeight` |  | `int getImageTextureHeight() { return m_imageTexture ? m_imageTexture->getHeight() : 0; }` |
| `getImageShader` |  | `std::string getImageShader() { return m_shader; }` |
| `updateText` |  | `virtual void updateText()` |
| `drawText` |  | `void drawText(const Rect& screenCoords)` |
| `onTextChange` |  | `virtual void onTextChange(const std::string& text, const std::string& oldText)` |
| `onFontChange` |  | `virtual void onFontChange(const std::string& font)` |
| `m_text` |  | `std::string m_text` |
| `m_drawText` |  | `std::string m_drawText` |
| `m_textAlign` |  | `Fw::AlignmentFlag m_textAlign` |
| `m_textOffset` |  | `Point m_textOffset` |
| `m_textWrap` |  | `stdext::boolean<false> m_textWrap` |
| `m_textVerticalAutoResize` |  | `stdext::boolean<false> m_textVerticalAutoResize` |
| `m_textHorizontalAutoResize` |  | `stdext::boolean<false> m_textHorizontalAutoResize` |
| `m_textOnlyUpperCase` |  | `stdext::boolean<false> m_textOnlyUpperCase` |
| `m_font` |  | `BitmapFontPtr m_font` |
| `m_shadow` |  | `stdext::boolean<false> m_shadow` |
| `resizeToText` |  | `void resizeToText() { setSize(getTextSize()); }` |
| `clearText` |  | `void clearText() { setText(""); }` |
| `setText` |  | `void setText(std::string text, bool dontFireLuaCall = false)` |
| `setColoredText` |  | `void setColoredText(const std::vector<std::string>& texts, bool dontFireLuaCall = false)` |
| `setTextAlign` |  | `void setTextAlign(Fw::AlignmentFlag align) { m_textAlign = align; updateText(); }` |
| `setTextOffset` |  | `void setTextOffset(const Point& offset) { m_textOffset = offset; updateText(); }` |
| `setTextWrap` |  | `void setTextWrap(bool textWrap) { m_textWrap = textWrap; updateText(); }` |
| `setTextAutoResize` |  | `void setTextAutoResize(bool textAutoResize) { m_textHorizontalAutoResize = textAutoResize; m_textVerticalAutoResize = textAutoResize; updateText(); }` |
| `setTextHorizontalAutoResize` |  | `void setTextHorizontalAutoResize(bool textAutoResize) { m_textHorizontalAutoResize = textAutoResize; updateText(); }` |
| `setTextVerticalAutoResize` |  | `void setTextVerticalAutoResize(bool textAutoResize) { m_textVerticalAutoResize = textAutoResize; updateText(); }` |
| `setTextOnlyUpperCase` |  | `void setTextOnlyUpperCase(bool textOnlyUpperCase) { m_textOnlyUpperCase = textOnlyUpperCase; setText(m_text); }` |
| `setFont` |  | `void setFont(const std::string& fontName)` |
| `setShadow` |  | `void setShadow(bool shadow) { m_shadow = shadow; }` |
| `getText` |  | `std::string getText() { return m_text; }` |
| `getDrawText` |  | `std::string getDrawText() { return m_drawText; }` |
| `getTextAlign` |  | `Fw::AlignmentFlag getTextAlign() { return m_textAlign; }` |
| `getTextOffset` |  | `Point getTextOffset() { return m_textOffset; }` |
| `getTextWrap` |  | `bool getTextWrap() { return m_textWrap; }` |
| `getFont` |  | `std::string getFont() { return m_font->getName(); }` |
| `getTextSize` |  | `Size getTextSize() { return m_font->calculateTextRectSize(m_drawText); }` |

## Functions

### `set`

**Sygnatura:** `void set(T value) { top = right = bottom = left = value; }`

### `addChild`

**Sygnatura:** `void addChild(const UIWidgetPtr& child)`

### `onChildIdChange`

**Sygnatura:** `void onChildIdChange(const UIWidgetPtr& child)`

### `insertChild`

**Sygnatura:** `void insertChild(int index, const UIWidgetPtr& child)`

### `removeChild`

**Sygnatura:** `void removeChild(UIWidgetPtr child)`

### `focusChild`

**Sygnatura:** `void focusChild(const UIWidgetPtr& child, Fw::FocusReason reason)`

### `focusNextChild`

**Sygnatura:** `void focusNextChild(Fw::FocusReason reason, bool rotate = false)`

### `focusPreviousChild`

**Sygnatura:** `void focusPreviousChild(Fw::FocusReason reason, bool rotate = false)`

### `lowerChild`

**Sygnatura:** `void lowerChild(UIWidgetPtr child)`

### `raiseChild`

**Sygnatura:** `void raiseChild(UIWidgetPtr child)`

### `moveChildToIndex`

**Sygnatura:** `void moveChildToIndex(const UIWidgetPtr& child, int index)`

### `reorderChildren`

**Sygnatura:** `void reorderChildren(const std::vector<UIWidgetPtr>& childrens)`

### `lockChild`

**Sygnatura:** `void lockChild(const UIWidgetPtr& child)`

### `unlockChild`

**Sygnatura:** `void unlockChild(const UIWidgetPtr& child)`

### `mergeStyle`

**Sygnatura:** `void mergeStyle(const OTMLNodePtr& styleNode)`

### `applyStyle`

**Sygnatura:** `void applyStyle(const OTMLNodePtr& styleNode)`

### `addAnchor`

**Sygnatura:** `void addAnchor(Fw::AnchorEdge anchoredEdge, const std::string& hookedWidgetId, Fw::AnchorEdge hookedEdge)`

### `removeAnchor`

**Sygnatura:** `void removeAnchor(Fw::AnchorEdge anchoredEdge)`

### `fill`

**Sygnatura:** `void fill(const std::string& hookedWidgetId)`

### `centerIn`

**Sygnatura:** `void centerIn(const std::string& hookedWidgetId)`

### `breakAnchors`

**Sygnatura:** `void breakAnchors()`

### `updateParentLayout`

**Sygnatura:** `void updateParentLayout()`

### `updateLayout`

**Sygnatura:** `void updateLayout()`

### `lock`

**Sygnatura:** `void lock()`

### `unlock`

**Sygnatura:** `void unlock()`

### `focus`

**Sygnatura:** `void focus()`

### `recursiveFocus`

**Sygnatura:** `void recursiveFocus(Fw::FocusReason reason)`

### `lower`

**Sygnatura:** `void lower()`

### `raise`

**Sygnatura:** `void raise()`

### `grabMouse`

**Sygnatura:** `void grabMouse()`

### `ungrabMouse`

**Sygnatura:** `void ungrabMouse()`

### `grabKeyboard`

**Sygnatura:** `void grabKeyboard()`

### `ungrabKeyboard`

**Sygnatura:** `void ungrabKeyboard()`

### `bindRectToParent`

**Sygnatura:** `void bindRectToParent()`

### `destroy`

**Sygnatura:** `void destroy()`

### `destroyChildren`

**Sygnatura:** `void destroyChildren()`

### `setId`

**Sygnatura:** `void setId(const std::string& id)`

### `setParent`

**Sygnatura:** `void setParent(const UIWidgetPtr& parent)`

### `setLayout`

**Sygnatura:** `void setLayout(const UILayoutPtr& layout)`

### `setRect`

**Sygnatura:** `bool setRect(const Rect& rect)`

### `setStyle`

**Sygnatura:** `void setStyle(const std::string& styleName)`

### `setStyleFromNode`

**Sygnatura:** `void setStyleFromNode(const OTMLNodePtr& styleNode)`

### `setEnabled`

**Sygnatura:** `void setEnabled(bool enabled)`

### `setVisible`

**Sygnatura:** `void setVisible(bool visible)`

### `setAutoDraw`

**Sygnatura:** `void setAutoDraw(bool value)`

### `setOn`

**Sygnatura:** `void setOn(bool on)`

### `setChecked`

**Sygnatura:** `void setChecked(bool checked)`

### `setFocusable`

**Sygnatura:** `void setFocusable(bool focusable)`

### `setPhantom`

**Sygnatura:** `void setPhantom(bool phantom)`

### `setDraggable`

**Sygnatura:** `void setDraggable(bool draggable)`

### `setFixedSize`

**Sygnatura:** `void setFixedSize(bool fixed)`

### `setClipping`

**Sygnatura:** `void setClipping(bool clipping) { m_clipping = clipping; }`

### `setLastFocusReason`

**Sygnatura:** `void setLastFocusReason(Fw::FocusReason reason)`

### `setAutoFocusPolicy`

**Sygnatura:** `void setAutoFocusPolicy(Fw::AutoFocusPolicy policy)`

### `setAutoRepeatDelay`

**Sygnatura:** `void setAutoRepeatDelay(int delay) { m_autoRepeatDelay = delay; }`

### `setVirtualOffset`

**Sygnatura:** `void setVirtualOffset(const Point& offset)`

### `isAnchored`

**Sygnatura:** `bool isAnchored()`

### `isChildLocked`

**Sygnatura:** `bool isChildLocked(const UIWidgetPtr& child)`

### `hasChild`

**Sygnatura:** `bool hasChild(const UIWidgetPtr& child)`

### `getChildIndex`

**Sygnatura:** `int getChildIndex(const UIWidgetPtr& child)`

### `getPaddingRect`

**Sygnatura:** `Rect getPaddingRect()`

### `getMarginRect`

**Sygnatura:** `Rect getMarginRect()`

### `getChildrenRect`

**Sygnatura:** `Rect getChildrenRect()`

### `getAnchoredLayout`

**Sygnatura:** `UIAnchorLayoutPtr getAnchoredLayout()`

### `getRootParent`

**Sygnatura:** `UIWidgetPtr getRootParent()`

### `getChildAfter`

**Sygnatura:** `UIWidgetPtr getChildAfter(const UIWidgetPtr& relativeChild)`

### `getChildBefore`

**Sygnatura:** `UIWidgetPtr getChildBefore(const UIWidgetPtr& relativeChild)`

### `getChildById`

**Sygnatura:** `UIWidgetPtr getChildById(const std::string& childId)`

### `getChildByPos`

**Sygnatura:** `UIWidgetPtr getChildByPos(const Point& childPos)`

### `getChildByIndex`

**Sygnatura:** `UIWidgetPtr getChildByIndex(int index)`

### `recursiveGetChildById`

**Sygnatura:** `UIWidgetPtr recursiveGetChildById(const std::string& id)`

### `recursiveGetChildByPos`

**Sygnatura:** `UIWidgetPtr recursiveGetChildByPos(const Point& childPos, bool wantsPhantom)`

### `recursiveGetChildren`

**Sygnatura:** `UIWidgetList recursiveGetChildren()`

### `recursiveGetChildrenByPos`

**Sygnatura:** `UIWidgetList recursiveGetChildrenByPos(const Point& childPos)`

### `recursiveGetChildrenByMarginPos`

**Sygnatura:** `UIWidgetList recursiveGetChildrenByMarginPos(const Point& childPos)`

### `backwardsGetWidgetById`

**Sygnatura:** `UIWidgetPtr backwardsGetWidgetById(const std::string& id)`

### `setState`

**Sygnatura:** `bool setState(Fw::WidgetState state, bool on)`

### `hasState`

**Sygnatura:** `bool hasState(Fw::WidgetState state)`

### `internalDestroy`

**Sygnatura:** `void internalDestroy()`

### `updateState`

**Sygnatura:** `void updateState(Fw::WidgetState state)`

### `updateStates`

**Sygnatura:** `void updateStates()`

### `updateChildrenIndexStates`

**Sygnatura:** `void updateChildrenIndexStates()`

### `updateStyle`

**Sygnatura:** `void updateStyle()`

### `propagateOnKeyText`

**Sygnatura:** `bool propagateOnKeyText(const std::string& keyText)`

### `propagateOnKeyDown`

**Sygnatura:** `bool propagateOnKeyDown(uchar keyCode, int keyboardModifiers)`

### `propagateOnKeyPress`

**Sygnatura:** `bool propagateOnKeyPress(uchar keyCode, int keyboardModifiers, int autoRepeatTicks)`

### `propagateOnKeyUp`

**Sygnatura:** `bool propagateOnKeyUp(uchar keyCode, int keyboardModifiers)`

### `propagateOnMouseEvent`

**Sygnatura:** `bool propagateOnMouseEvent(const Point& mousePos, UIWidgetList& widgetList)`

### `propagateOnMouseMove`

**Sygnatura:** `bool propagateOnMouseMove(const Point& mousePos, const Point& mouseMoved, UIWidgetList& widgetList)`

### `resize`

**Sygnatura:** `void resize(int width, int height) { setRect(Rect(getPosition(), Size(width, height))); }`

### `move`

**Sygnatura:** `void move(int x, int y) { setRect(Rect(x, y, getSize())); }`

### `rotate`

**Sygnatura:** `void rotate(float degrees) { setRotation(degrees); }`

### `hide`

**Sygnatura:** `void hide() { setVisible(false); }`

### `show`

**Sygnatura:** `void show() { setVisible(true); }`

### `disable`

**Sygnatura:** `void disable() { setEnabled(false); }`

### `enable`

**Sygnatura:** `void enable() { setEnabled(true); }`

### `isActive`

**Sygnatura:** `bool isActive() { return hasState(Fw::ActiveState); }`

### `isEnabled`

**Sygnatura:** `bool isEnabled() { return !hasState(Fw::DisabledState); }`

### `isDisabled`

**Sygnatura:** `bool isDisabled() { return hasState(Fw::DisabledState); }`

### `isFocused`

**Sygnatura:** `bool isFocused() { return hasState(Fw::FocusState); }`

### `isHovered`

**Sygnatura:** `bool isHovered() { return hasState(Fw::HoverState); }`

### `isPressed`

**Sygnatura:** `bool isPressed() { return hasState(Fw::PressedState); }`

### `isFirst`

**Sygnatura:** `bool isFirst() { return hasState(Fw::FirstState); }`

### `isMiddle`

**Sygnatura:** `bool isMiddle() { return hasState(Fw::MiddleState); }`

### `isLast`

**Sygnatura:** `bool isLast() { return hasState(Fw::LastState); }`

### `isAlternate`

**Sygnatura:** `bool isAlternate() { return hasState(Fw::AlternateState); }`

### `isChecked`

**Sygnatura:** `bool isChecked() { return hasState(Fw::CheckedState); }`

### `isOn`

**Sygnatura:** `bool isOn() { return hasState(Fw::OnState); }`

### `isDragging`

**Sygnatura:** `bool isDragging() { return hasState(Fw::DraggingState); }`

### `isVisible`

**Sygnatura:** `bool isVisible() { return !hasState(Fw::HiddenState); }`

### `isHidden`

**Sygnatura:** `bool isHidden() { return hasState(Fw::HiddenState); }`

### `isExplicitlyEnabled`

**Sygnatura:** `bool isExplicitlyEnabled() { return m_enabled; }`

### `isExplicitlyVisible`

**Sygnatura:** `bool isExplicitlyVisible() { return m_visible; }`

### `isAutoDraw`

**Sygnatura:** `bool isAutoDraw() { return m_autoDraw; }`

### `isFocusable`

**Sygnatura:** `bool isFocusable() { return m_focusable; }`

### `isPhantom`

**Sygnatura:** `bool isPhantom() { return m_phantom; }`

### `isDraggable`

**Sygnatura:** `bool isDraggable() { return m_draggable; }`

### `isFixedSize`

**Sygnatura:** `bool isFixedSize() { return m_fixedSize; }`

### `isClipping`

**Sygnatura:** `bool isClipping() { return m_clipping; }`

### `isDestroyed`

**Sygnatura:** `bool isDestroyed() { return m_destroyed; }`

### `hasChildren`

**Sygnatura:** `bool hasChildren() { return m_children.size() > 0; }`

### `containsMarginPoint`

**Sygnatura:** `bool containsMarginPoint(const Point& point) { return getMarginRect().contains(point); }`

### `containsPaddingPoint`

**Sygnatura:** `bool containsPaddingPoint(const Point& point) { return getPaddingRect().contains(point); }`

### `containsPoint`

**Sygnatura:** `bool containsPoint(const Point& point) { return m_rect.contains(point); }`

### `getId`

**Sygnatura:** `std::string getId() { return m_id; }`

### `getSource`

**Sygnatura:** `std::string getSource() { return m_source; }`

### `getParent`

**Sygnatura:** `UIWidgetPtr getParent() { return m_parent; }`

### `getParentId`

**Sygnatura:** `std::string getParentId() { return m_parentId; }`

### `getFocusedChild`

**Sygnatura:** `UIWidgetPtr getFocusedChild() { return m_focusedChild; }`

### `getChildren`

**Sygnatura:** `UIWidgetList getChildren() { return m_children; }`

### `getFirstChild`

**Sygnatura:** `UIWidgetPtr getFirstChild() { return getChildByIndex(1); }`

### `getLastChild`

**Sygnatura:** `UIWidgetPtr getLastChild() { return getChildByIndex(-1); }`

### `getLayout`

**Sygnatura:** `UILayoutPtr getLayout() { return m_layout; }`

### `getStyle`

**Sygnatura:** `OTMLNodePtr getStyle() { return m_style; }`

### `getChildCount`

**Sygnatura:** `int getChildCount() { return m_children.size(); }`

### `getLastFocusReason`

**Sygnatura:** `Fw::FocusReason getLastFocusReason() { return m_lastFocusReason; }`

### `getAutoFocusPolicy`

**Sygnatura:** `Fw::AutoFocusPolicy getAutoFocusPolicy() { return m_autoFocusPolicy; }`

### `getAutoRepeatDelay`

**Sygnatura:** `int getAutoRepeatDelay() { return m_autoRepeatDelay; }`

### `getVirtualOffset`

**Sygnatura:** `Point getVirtualOffset() { return m_virtualOffset; }`

### `getStyleName`

**Sygnatura:** `std::string getStyleName() { return m_style->tag(); }`

### `getLastClickPosition`

**Sygnatura:** `Point getLastClickPosition() { return m_lastClickPosition; }`

### `isRootChild`

**Sygnatura:** `bool isRootChild()`

### `setRootChild`

**Sygnatura:** `void setRootChild(bool v)`

### `initBaseStyle`

**Sygnatura:** `void initBaseStyle()`

### `parseBaseStyle`

**Sygnatura:** `void parseBaseStyle(const OTMLNodePtr& styleNode)`

### `drawBackground`

**Sygnatura:** `void drawBackground(const Rect& screenCoords)`

### `drawBorder`

**Sygnatura:** `void drawBorder(const Rect& screenCoords)`

### `drawIcon`

**Sygnatura:** `void drawIcon(const Rect& screenCoords)`

### `setX`

**Sygnatura:** `void setX(int x) { move(x, getY()); }`

### `setY`

**Sygnatura:** `void setY(int y) { move(getX(), y); }`

### `setWidth`

**Sygnatura:** `void setWidth(int width) { resize(width, getHeight()); }`

### `setHeight`

**Sygnatura:** `void setHeight(int height) { resize(getWidth(), height); }`

### `setSize`

**Sygnatura:** `void setSize(const Size& size) { resize(size.width(), size.height()); }`

### `setPosition`

**Sygnatura:** `void setPosition(const Point& pos) { move(pos.x, pos.y); }`

### `setColor`

**Sygnatura:** `void setColor(const Color& color) { m_color = color; }`

### `setBackgroundColor`

**Sygnatura:** `void setBackgroundColor(const Color& color) { m_backgroundColor = color; }`

### `setBackgroundOffsetX`

**Sygnatura:** `void setBackgroundOffsetX(int x) { m_backgroundRect.setX(x); }`

### `setBackgroundOffsetY`

**Sygnatura:** `void setBackgroundOffsetY(int y) { m_backgroundRect.setX(y); }`

### `setBackgroundOffset`

**Sygnatura:** `void setBackgroundOffset(const Point& pos) { m_backgroundRect.move(pos); }`

### `setBackgroundWidth`

**Sygnatura:** `void setBackgroundWidth(int width) { m_backgroundRect.setWidth(width); }`

### `setBackgroundHeight`

**Sygnatura:** `void setBackgroundHeight(int height) { m_backgroundRect.setHeight(height); }`

### `setBackgroundSize`

**Sygnatura:** `void setBackgroundSize(const Size& size) { m_backgroundRect.resize(size); }`

### `setBackgroundRect`

**Sygnatura:** `void setBackgroundRect(const Rect& rect) { m_backgroundRect = rect; }`

### `setIcon`

**Sygnatura:** `void setIcon(const std::string& iconFile)`

### `setIconColor`

**Sygnatura:** `void setIconColor(const Color& color) { m_iconColor = color; }`

### `setIconOffsetX`

**Sygnatura:** `void setIconOffsetX(int x) { m_iconOffset.x = x; }`

### `setIconOffsetY`

**Sygnatura:** `void setIconOffsetY(int y) { m_iconOffset.y = y; }`

### `setIconOffset`

**Sygnatura:** `void setIconOffset(const Point& pos) { m_iconOffset = pos; }`

### `setIconWidth`

**Sygnatura:** `void setIconWidth(int width) { m_iconRect.setWidth(width); }`

### `setIconHeight`

**Sygnatura:** `void setIconHeight(int height) { m_iconRect.setHeight(height); }`

### `setIconSize`

**Sygnatura:** `void setIconSize(const Size& size) { m_iconRect.resize(size); }`

### `setIconRect`

**Sygnatura:** `void setIconRect(const Rect& rect) { m_iconRect = rect; }`

### `setIconClip`

**Sygnatura:** `void setIconClip(const Rect& rect) { m_iconClipRect = rect; }`

### `setIconAlign`

**Sygnatura:** `void setIconAlign(Fw::AlignmentFlag align) { m_iconAlign = align; }`

### `setBorderWidth`

**Sygnatura:** `void setBorderWidth(int width) { m_borderWidth.set(width); updateLayout(); }`

### `setBorderWidthTop`

**Sygnatura:** `void setBorderWidthTop(int width) { m_borderWidth.top = width; }`

### `setBorderWidthRight`

**Sygnatura:** `void setBorderWidthRight(int width) { m_borderWidth.right = width; }`

### `setBorderWidthBottom`

**Sygnatura:** `void setBorderWidthBottom(int width) { m_borderWidth.bottom = width; }`

### `setBorderWidthLeft`

**Sygnatura:** `void setBorderWidthLeft(int width) { m_borderWidth.left = width; }`

### `setBorderColor`

**Sygnatura:** `void setBorderColor(const Color& color) { m_borderColor.set(color); updateLayout(); }`

### `setBorderColorTop`

**Sygnatura:** `void setBorderColorTop(const Color& color) { m_borderColor.top = color; }`

### `setBorderColorRight`

**Sygnatura:** `void setBorderColorRight(const Color& color) { m_borderColor.right = color; }`

### `setBorderColorBottom`

**Sygnatura:** `void setBorderColorBottom(const Color& color) { m_borderColor.bottom = color; }`

### `setBorderColorLeft`

**Sygnatura:** `void setBorderColorLeft(const Color& color) { m_borderColor.left = color; }`

### `setMargin`

**Sygnatura:** `void setMargin(int margin) { m_margin.set(margin); updateParentLayout(); }`

### `setMarginHorizontal`

**Sygnatura:** `void setMarginHorizontal(int margin) { m_margin.right = m_margin.left = margin; updateParentLayout(); }`

### `setMarginVertical`

**Sygnatura:** `void setMarginVertical(int margin) { m_margin.bottom = m_margin.top = margin; updateParentLayout(); }`

### `setMarginTop`

**Sygnatura:** `void setMarginTop(int margin) { m_margin.top = margin; updateParentLayout(); }`

### `setMarginRight`

**Sygnatura:** `void setMarginRight(int margin) { m_margin.right = margin; updateParentLayout(); }`

### `setMarginBottom`

**Sygnatura:** `void setMarginBottom(int margin) { m_margin.bottom = margin; updateParentLayout(); }`

### `setMarginLeft`

**Sygnatura:** `void setMarginLeft(int margin) { m_margin.left = margin; updateParentLayout(); }`

### `setPadding`

**Sygnatura:** `void setPadding(int padding) { m_padding.top = m_padding.right = m_padding.bottom = m_padding.left = padding; updateLayout(); }`

### `setPaddingHorizontal`

**Sygnatura:** `void setPaddingHorizontal(int padding) { m_padding.right = m_padding.left = padding; updateLayout(); }`

### `setPaddingVertical`

**Sygnatura:** `void setPaddingVertical(int padding) { m_padding.bottom = m_padding.top = padding; updateLayout(); }`

### `setPaddingTop`

**Sygnatura:** `void setPaddingTop(int padding) { m_padding.top = padding; updateLayout(); }`

### `setPaddingRight`

**Sygnatura:** `void setPaddingRight(int padding) { m_padding.right = padding; updateLayout(); }`

### `setPaddingBottom`

**Sygnatura:** `void setPaddingBottom(int padding) { m_padding.bottom = padding; updateLayout(); }`

### `setPaddingLeft`

**Sygnatura:** `void setPaddingLeft(int padding) { m_padding.left = padding; updateLayout(); }`

### `setOpacity`

**Sygnatura:** `void setOpacity(float opacity) { m_opacity = stdext::clamp<float>(opacity, 0.0f, 1.0f); }`

### `setRotation`

**Sygnatura:** `void setRotation(float degrees) { m_rotation = degrees; }`

### `setChangeCursorImage`

**Sygnatura:** `void setChangeCursorImage(bool enable) { m_changeCursorImage = enable; }`

### `setCursor`

**Sygnatura:** `void setCursor(const std::string& cursor)`

### `getX`

**Sygnatura:** `int getX() { return m_rect.x(); }`

### `getY`

**Sygnatura:** `int getY() { return m_rect.y(); }`

### `getPosition`

**Sygnatura:** `Point getPosition() { return m_rect.topLeft(); }`

### `getWidth`

**Sygnatura:** `int getWidth() { return m_rect.width(); }`

### `getHeight`

**Sygnatura:** `int getHeight() { return m_rect.height(); }`

### `getSize`

**Sygnatura:** `Size getSize() { return m_rect.size(); }`

### `getRect`

**Sygnatura:** `Rect getRect() { return m_rect; }`

### `getColor`

**Sygnatura:** `Color getColor() { return m_color; }`

### `getBackgroundColor`

**Sygnatura:** `Color getBackgroundColor() { return m_backgroundColor; }`

### `getBackgroundOffsetX`

**Sygnatura:** `int getBackgroundOffsetX() { return m_backgroundRect.x(); }`

### `getBackgroundOffsetY`

**Sygnatura:** `int getBackgroundOffsetY() { return m_backgroundRect.y(); }`

### `getBackgroundOffset`

**Sygnatura:** `Point getBackgroundOffset() { return m_backgroundRect.topLeft(); }`

### `getBackgroundWidth`

**Sygnatura:** `int getBackgroundWidth() { return m_backgroundRect.width(); }`

### `getBackgroundHeight`

**Sygnatura:** `int getBackgroundHeight() { return m_backgroundRect.height(); }`

### `getBackgroundSize`

**Sygnatura:** `Size getBackgroundSize() { return m_backgroundRect.size(); }`

### `getBackgroundRect`

**Sygnatura:** `Rect getBackgroundRect() { return m_backgroundRect; }`

### `getIconColor`

**Sygnatura:** `Color getIconColor() { return m_iconColor; }`

### `getIconOffsetX`

**Sygnatura:** `int getIconOffsetX() { return m_iconOffset.x; }`

### `getIconOffsetY`

**Sygnatura:** `int getIconOffsetY() { return m_iconOffset.y; }`

### `getIconOffset`

**Sygnatura:** `Point getIconOffset() { return m_iconOffset; }`

### `getIconWidth`

**Sygnatura:** `int getIconWidth() { return m_iconRect.width(); }`

### `getIconHeight`

**Sygnatura:** `int getIconHeight() { return m_iconRect.height(); }`

### `getIconSize`

**Sygnatura:** `Size getIconSize() { return m_iconRect.size(); }`

### `getIconRect`

**Sygnatura:** `Rect getIconRect() { return m_iconRect; }`

### `getIconClip`

**Sygnatura:** `Rect getIconClip() { return m_iconClipRect; }`

### `getIconPath`

**Sygnatura:** `std::string getIconPath() { return m_iconPath; }`

### `getIconAlign`

**Sygnatura:** `Fw::AlignmentFlag getIconAlign() { return m_iconAlign; }`

### `getBorderTopColor`

**Sygnatura:** `Color getBorderTopColor() { return m_borderColor.top; }`

### `getBorderRightColor`

**Sygnatura:** `Color getBorderRightColor() { return m_borderColor.right; }`

### `getBorderBottomColor`

**Sygnatura:** `Color getBorderBottomColor() { return m_borderColor.bottom; }`

### `getBorderLeftColor`

**Sygnatura:** `Color getBorderLeftColor() { return m_borderColor.left; }`

### `getBorderTopWidth`

**Sygnatura:** `int getBorderTopWidth() { return m_borderWidth.top; }`

### `getBorderRightWidth`

**Sygnatura:** `int getBorderRightWidth() { return m_borderWidth.right; }`

### `getBorderBottomWidth`

**Sygnatura:** `int getBorderBottomWidth() { return m_borderWidth.bottom; }`

### `getBorderLeftWidth`

**Sygnatura:** `int getBorderLeftWidth() { return m_borderWidth.left; }`

### `getMarginTop`

**Sygnatura:** `int getMarginTop() { return m_margin.top; }`

### `getMarginRight`

**Sygnatura:** `int getMarginRight() { return m_margin.right; }`

### `getMarginBottom`

**Sygnatura:** `int getMarginBottom() { return m_margin.bottom; }`

### `getMarginLeft`

**Sygnatura:** `int getMarginLeft() { return m_margin.left; }`

### `getPaddingTop`

**Sygnatura:** `int getPaddingTop() { return m_padding.top; }`

### `getPaddingRight`

**Sygnatura:** `int getPaddingRight() { return m_padding.right; }`

### `getPaddingBottom`

**Sygnatura:** `int getPaddingBottom() { return m_padding.bottom; }`

### `getPaddingLeft`

**Sygnatura:** `int getPaddingLeft() { return m_padding.left; }`

### `getOpacity`

**Sygnatura:** `float getOpacity() { return m_opacity; }`

### `getRotation`

**Sygnatura:** `float getRotation() { return m_rotation; }`

### `isChangingCursorImage`

**Sygnatura:** `bool isChangingCursorImage() { return m_changeCursorImage; }`

### `initImage`

**Sygnatura:** `void initImage()`

### `parseImageStyle`

**Sygnatura:** `void parseImageStyle(const OTMLNodePtr& styleNode)`

### `updateImageCache`

**Sygnatura:** `void updateImageCache() { m_imageMustRecache = true; }`

### `configureBorderImage`

**Sygnatura:** `void configureBorderImage() { m_imageBordered = true; updateImageCache(); }`

### `drawImage`

**Sygnatura:** `void drawImage(const Rect& screenCoords)`

### `setQRCode`

**Sygnatura:** `void setQRCode(const std::string& code, int border)`

### `setImageSource`

**Sygnatura:** `void setImageSource(const std::string& source)`

### `setImageSourceBase64`

**Sygnatura:** `void setImageSourceBase64(const std::string & data)`

### `setImageClip`

**Sygnatura:** `void setImageClip(const Rect& clipRect) { m_imageClipRect = clipRect; updateImageCache(); }`

### `setImageOffsetX`

**Sygnatura:** `void setImageOffsetX(int x) { m_imageRect.setX(x); updateImageCache(); }`

### `setImageOffsetY`

**Sygnatura:** `void setImageOffsetY(int y) { m_imageRect.setY(y); updateImageCache(); }`

### `setImageOffset`

**Sygnatura:** `void setImageOffset(const Point& pos) { m_imageRect.move(pos); updateImageCache(); }`

### `setImageWidth`

**Sygnatura:** `void setImageWidth(int width) { m_imageRect.setWidth(width); updateImageCache(); }`

### `setImageHeight`

**Sygnatura:** `void setImageHeight(int height) { m_imageRect.setHeight(height); updateImageCache(); }`

### `setImageSize`

**Sygnatura:** `void setImageSize(const Size& size) { m_imageRect.resize(size); updateImageCache(); }`

### `setImageRect`

**Sygnatura:** `void setImageRect(const Rect& rect) { m_imageRect = rect; updateImageCache(); }`

### `setImageColor`

**Sygnatura:** `void setImageColor(const Color& color) { m_imageColor = color; updateImageCache(); }`

### `setImageFixedRatio`

**Sygnatura:** `void setImageFixedRatio(bool fixedRatio) { m_imageFixedRatio = fixedRatio; updateImageCache(); }`

### `setImageRepeated`

**Sygnatura:** `void setImageRepeated(bool repeated) { m_imageRepeated = repeated; updateImageCache(); }`

### `setImageSmooth`

**Sygnatura:** `void setImageSmooth(bool smooth) { m_imageSmooth = smooth; }`

### `setImageAutoResize`

**Sygnatura:** `void setImageAutoResize(bool autoResize) { m_imageAutoResize = autoResize; }`

### `setImageBorderTop`

**Sygnatura:** `void setImageBorderTop(int border) { m_imageBorder.top = border; configureBorderImage(); }`

### `setImageBorderRight`

**Sygnatura:** `void setImageBorderRight(int border) { m_imageBorder.right = border; configureBorderImage(); }`

### `setImageBorderBottom`

**Sygnatura:** `void setImageBorderBottom(int border) { m_imageBorder.bottom = border; configureBorderImage(); }`

### `setImageBorderLeft`

**Sygnatura:** `void setImageBorderLeft(int border) { m_imageBorder.left = border; configureBorderImage(); }`

### `setImageBorder`

**Sygnatura:** `void setImageBorder(int border) { m_imageBorder.set(border); configureBorderImage(); }`

### `setImageShader`

**Sygnatura:** `void setImageShader(const std::string& str) { m_shader = str; }`

### `getImageClip`

**Sygnatura:** `Rect getImageClip() { return m_imageClipRect; }`

### `getImageOffsetX`

**Sygnatura:** `int getImageOffsetX() { return m_imageRect.x(); }`

### `getImageOffsetY`

**Sygnatura:** `int getImageOffsetY() { return m_imageRect.y(); }`

### `getImageOffset`

**Sygnatura:** `Point getImageOffset() { return m_imageRect.topLeft(); }`

### `getImageWidth`

**Sygnatura:** `int getImageWidth() { return m_imageRect.width(); }`

### `getImageHeight`

**Sygnatura:** `int getImageHeight() { return m_imageRect.height(); }`

### `getImageSize`

**Sygnatura:** `Size getImageSize() { return m_imageRect.size(); }`

### `getImageRect`

**Sygnatura:** `Rect getImageRect() { return m_imageRect; }`

### `getImageColor`

**Sygnatura:** `Color getImageColor() { return m_imageColor; }`

### `isImageFixedRatio`

**Sygnatura:** `bool isImageFixedRatio() { return m_imageFixedRatio; }`

### `isImageSmooth`

**Sygnatura:** `bool isImageSmooth() { return m_imageSmooth; }`

### `isImageAutoResize`

**Sygnatura:** `bool isImageAutoResize() { return m_imageAutoResize; }`

### `getImageBorderTop`

**Sygnatura:** `int getImageBorderTop() { return m_imageBorder.top; }`

### `getImageBorderRight`

**Sygnatura:** `int getImageBorderRight() { return m_imageBorder.right; }`

### `getImageBorderBottom`

**Sygnatura:** `int getImageBorderBottom() { return m_imageBorder.bottom; }`

### `getImageBorderLeft`

**Sygnatura:** `int getImageBorderLeft() { return m_imageBorder.left; }`

### `getImageTextureWidth`

**Sygnatura:** `int getImageTextureWidth() { return m_imageTexture ? m_imageTexture->getWidth() : 0; }`

### `getImageTextureHeight`

**Sygnatura:** `int getImageTextureHeight() { return m_imageTexture ? m_imageTexture->getHeight() : 0; }`

### `getImageShader`

**Sygnatura:** `std::string getImageShader() { return m_shader; }`

### `initText`

**Sygnatura:** `void initText()`

### `parseTextStyle`

**Sygnatura:** `void parseTextStyle(const OTMLNodePtr& styleNode)`

### `drawText`

**Sygnatura:** `void drawText(const Rect& screenCoords)`

### `resizeToText`

**Sygnatura:** `void resizeToText() { setSize(getTextSize()); }`

### `clearText`

**Sygnatura:** `void clearText() { setText(""); }`

### `setText`

**Sygnatura:** `void setText(std::string text, bool dontFireLuaCall = false)`

### `setColoredText`

**Sygnatura:** `void setColoredText(const std::vector<std::string>& texts, bool dontFireLuaCall = false)`

### `setTextAlign`

**Sygnatura:** `void setTextAlign(Fw::AlignmentFlag align) { m_textAlign = align; updateText(); }`

### `setTextOffset`

**Sygnatura:** `void setTextOffset(const Point& offset) { m_textOffset = offset; updateText(); }`

### `setTextWrap`

**Sygnatura:** `void setTextWrap(bool textWrap) { m_textWrap = textWrap; updateText(); }`

### `setTextAutoResize`

**Sygnatura:** `void setTextAutoResize(bool textAutoResize) { m_textHorizontalAutoResize = textAutoResize; m_textVerticalAutoResize = textAutoResize; updateText(); }`

### `setTextHorizontalAutoResize`

**Sygnatura:** `void setTextHorizontalAutoResize(bool textAutoResize) { m_textHorizontalAutoResize = textAutoResize; updateText(); }`

### `setTextVerticalAutoResize`

**Sygnatura:** `void setTextVerticalAutoResize(bool textAutoResize) { m_textVerticalAutoResize = textAutoResize; updateText(); }`

### `setTextOnlyUpperCase`

**Sygnatura:** `void setTextOnlyUpperCase(bool textOnlyUpperCase) { m_textOnlyUpperCase = textOnlyUpperCase; setText(m_text); }`

### `setFont`

**Sygnatura:** `void setFont(const std::string& fontName)`

### `setShadow`

**Sygnatura:** `void setShadow(bool shadow) { m_shadow = shadow; }`

### `getText`

**Sygnatura:** `std::string getText() { return m_text; }`

### `getDrawText`

**Sygnatura:** `std::string getDrawText() { return m_drawText; }`

### `getTextAlign`

**Sygnatura:** `Fw::AlignmentFlag getTextAlign() { return m_textAlign; }`

### `getTextOffset`

**Sygnatura:** `Point getTextOffset() { return m_textOffset; }`

### `getTextWrap`

**Sygnatura:** `bool getTextWrap() { return m_textWrap; }`

### `getFont`

**Sygnatura:** `std::string getFont() { return m_font->getName(); }`

### `getTextSize`

**Sygnatura:** `Size getTextSize() { return m_font->calculateTextRectSize(m_drawText); }`

## Class Diagram

Zobacz: [../diagrams/uiwidget.mmd](../diagrams/uiwidget.mmd)
