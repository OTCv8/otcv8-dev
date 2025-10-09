---
doc_id: "cpp-api-579a05da2857"
source_path: "framework/util/rect.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: rect.h"
summary: "Dokumentacja API C++ dla framework/util/rect.h"
tags: ["cpp", "api", "otclient"]
---

# framework/util/rect.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu rect.

## Classes/Structs

### Klasa: `TPoint`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `isNull` |  | `bool isNull() const { return x2 == x1 - 1 && y2 == y1 - 1; }` |
| `isEmpty` |  | `bool isEmpty() const { return x1 > x2 \|\| y1 > y2; }` |
| `isValid` |  | `bool isValid() const { return x1 <= x2 && y1 <= y2; }` |
| `left` |  | `inline T left() const { return x1; }` |
| `top` |  | `inline T top() const { return y1; }` |
| `right` |  | `inline T right() const { return x2; }` |
| `bottom` |  | `inline T bottom() const { return y2; }` |
| `horizontalCenter` |  | `inline T horizontalCenter() const { return x1 + (x2 - x1)/2; }` |
| `verticalCenter` |  | `inline T verticalCenter() const { return y1 + (y2 - y1)/2; }` |
| `x` |  | `inline T x() const { return x1; }` |
| `y` |  | `inline T y() const { return y1; }` |
| `topLeft` |  | `TPoint<T> topLeft() const { return TPoint<T>(x1, y1); }` |
| `bottomRight` |  | `TPoint<T> bottomRight() const { return TPoint<T>(x2, y2); }` |
| `topRight` |  | `TPoint<T> topRight() const { return TPoint<T>(x2, y1); }` |
| `bottomLeft` |  | `TPoint<T> bottomLeft() const { return TPoint<T>(x1, y2); }` |
| `topCenter` |  | `TPoint<T> topCenter() const { return TPoint<T>((x1+x2)/2, y1); }` |
| `bottomCenter` |  | `TPoint<T> bottomCenter() const { return TPoint<T>((x1+x2)/2, y2); }` |
| `centerLeft` |  | `TPoint<T> centerLeft() const { return TPoint<T>(x1, (y1+y2)/2); }` |
| `centerRight` |  | `TPoint<T> centerRight() const { return TPoint<T>(x2, (y1+y2)/2); }` |
| `center` |  | `TPoint<T> center() const { return TPoint<T>((x1+x2)/2, (y1+y2)/2); }` |
| `width` |  | `T width() const { return  x2 - x1 + 1; }` |
| `height` |  | `T height() const { return  y2 - y1 + 1; }` |
| `size` |  | `TSize<T> size() const { return TSize<T>(width(), height()); }` |
| `reset` |  | `void reset() { x1 = y1 = 0; x2 = y2 = -1; }` |
| `clear` |  | `void clear() { x2 = x1 - 1; y2 = y1 - 1; }` |
| `setLeft` |  | `void setLeft(T pos) { x1 = pos; }` |
| `setTop` |  | `void setTop(T pos) { y1 = pos; }` |
| `setRight` |  | `void setRight(T pos) { x2 = pos; }` |
| `setBottom` |  | `void setBottom(T pos) { y2 = pos; }` |
| `setX` |  | `void setX(T x) { x1 = x; }` |
| `setY` |  | `void setY(T y) { y1 = y; }` |
| `setTopLeft` |  | `void setTopLeft(const TPoint<T> &p) { x1 = p.x; y1 = p.y; }` |
| `setBottomRight` |  | `void setBottomRight(const TPoint<T> &p) { x2 = p.x; y2 = p.y; }` |
| `setTopRight` |  | `void setTopRight(const TPoint<T> &p) { x2 = p.x; y1 = p.y; }` |
| `setBottomLeft` |  | `void setBottomLeft(const TPoint<T> &p) { x1 = p.x; y2 = p.y; }` |
| `setWidth` |  | `void setWidth(T width) { x2 = x1 + width - 1; }` |
| `setHeight` |  | `void setHeight(T height) { y2 = y1 + height- 1; }` |
| `setSize` |  | `void setSize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }` |
| `setRect` |  | `void setRect(T x, T y, T width, T height) { x1 = x; y1 = y; x2 = (x + width - 1); y2 = (y + height - 1); }` |
| `setCoords` |  | `void setCoords(int left, int top, int right, int bottom) { x1 = left; y1 = top; x2 = right; y2 = bottom; }` |
| `expandLeft` |  | `void expandLeft(T add) { x1 -= add; }` |
| `expandTop` |  | `void expandTop(T add) { y1 -= add; }` |
| `expandRight` |  | `void expandRight(T add) { x2 += add; }` |
| `expandBottom` |  | `void expandBottom(T add) { y2 += add; }` |
| `expand` |  | `void expand(T top, T right, T bottom, T left) { x1 -= left; y1 -= top; x2 += right; y2 += bottom; }` |
| `expand` |  | `void expand(T add) { x1 -= add; y1 -= add; x2 += add; y2 += add; }` |
| `translate` |  | `void translate(T x, T y) { x1 += x; y1 += y; x2 += x; y2 += y; }` |
| `translate` |  | `void translate(const TPoint<T> &p) { x1 += p.x; y1 += p.y; x2 += p.x; y2 += p.y; }` |
| `resize` |  | `void resize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }` |
| `resize` |  | `void resize(T width, T height) { x2 = x1 + width - 1; y2 = y1 + height - 1; }` |
| `move` |  | `void move(T x, T y) { x2 += x - x1; y2 += y - y1; x1 = x; y1 = y; }` |
| `move` |  | `void move(const TPoint<T> &p) { x2 += p.x - x1; y2 += p.y - y1; x1 = p.x; y1 = p.y; }` |
| `moveLeft` |  | `void moveLeft(T pos) { x2 += (pos - x1); x1 = pos; }` |
| `moveTop` |  | `void moveTop(T pos) { y2 += (pos - y1); y1 = pos; }` |
| `moveRight` |  | `void moveRight(T pos) { x1 += (pos - x2); x2 = pos; }` |
| `moveBottom` |  | `void moveBottom(T pos) { y1 += (pos - y2); y2 = pos; }` |
| `moveTopLeft` |  | `void moveTopLeft(const TPoint<T> &p) { moveLeft(p.x); moveTop(p.y); }` |
| `moveBottomRight` |  | `void moveBottomRight(const TPoint<T> &p) { moveRight(p.x); moveBottom(p.y); }` |
| `moveTopRight` |  | `void moveTopRight(const TPoint<T> &p) { moveRight(p.x); moveTop(p.y); }` |
| `moveBottomLeft` |  | `void moveBottomLeft(const TPoint<T> &p) { moveLeft(p.x); moveBottom(p.y); }` |
| `moveTopCenter` |  | `void moveTopCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveTop(p.y); }` |
| `moveBottomCenter` |  | `void moveBottomCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveBottom(p.y); }` |
| `moveCenterLeft` |  | `void moveCenterLeft(const TPoint<T> &p) { moveLeft(p.x); moveVerticalCenter(p.y); }` |
| `moveCenterRight` |  | `void moveCenterRight(const TPoint<T> &p) { moveRight(p.x); moveVerticalCenter(p.y); }` |
| `translated` |  | `TRect<T> translated(int x, int y) const { return TRect<T>(TPoint<T>(x1 + x, y1 + y), TPoint<T>(x2 + x, y2 + y)); }` |
| `translated` |  | `TRect<T> translated(const TPoint<T> &p) const { return TRect<T>(TPoint<T>(x1 + p.x, y1 + p.y), TPoint<T>(x2 + p.x, y2 + p.y)); }` |
| `expanded` |  | `TRect<T> expanded(T add) const { return TRect<T>(TPoint<T>(x1 - add, y1 - add), TPoint<T>(x2 + add, y2 + add)); }` |
| `moveCenter` |  | `void moveCenter(const TPoint<T> &p) {` |
| `w` |  | `T w = x2 - x1` |
| `h` |  | `T h = y2 - y1` |
| `moveHorizontalCenter` |  | `void moveHorizontalCenter(T x) {` |
| `w` |  | `T w = x2 - x1` |
| `moveVerticalCenter` |  | `void moveVerticalCenter(T y) {` |
| `h` |  | `T h = y2 - y1` |
| `contains` |  | `bool contains(const TPoint<T> &p, bool insideOnly = false) const {` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `true` |  | `return true` |
| `contains` |  | `bool contains(const TRect<T> &r, bool insideOnly = false) const {` |
| `true` |  | `return true` |
| `false` |  | `return false` |
| `intersects` |  | `bool intersects(const TRect<T> &r) const {` |
| `false` |  | `return false` |
| `l1` |  | `int l1 = x1` |
| `r1` |  | `int r1 = x1` |
| `l2` |  | `int l2 = r.x1` |
| `r2` |  | `int r2 = r.x1` |
| `false` |  | `return false` |
| `t1` |  | `int t1 = y1` |
| `b1` |  | `int b1 = y1` |
| `t2` |  | `int t2 = r.y1` |
| `b2` |  | `int b2 = r.y1` |
| `false` |  | `return false` |
| `true` |  | `return true` |
| `united` |  | `TRect<T> united(const TRect<T> &r) const {` |
| `tmp` |  | `TRect<T> tmp` |
| `tmp` |  | `return tmp` |
| `intersection` |  | `TRect<T> intersection(const TRect<T> &r) const {` |
| `r` |  | `return r` |
| `l1` |  | `int l1 = x1` |
| `r1` |  | `int r1 = x1` |
| `l2` |  | `int l2 = r.x1` |
| `r2` |  | `int r2 = r.x1` |
| `t1` |  | `int t1 = y1` |
| `b1` |  | `int b1 = y1` |
| `t2` |  | `int t2 = r.y1` |
| `b2` |  | `int b2 = r.y1` |
| `tmp` |  | `TRect<T> tmp` |
| `tmp` |  | `return tmp` |
| `bind` |  | `void bind(const TRect<T> &r) {` |
| `alignIn` |  | `void alignIn(const TRect<T> &r, Fw::AlignmentFlag align) {` |
| `if` |  | `else if(align == Fw::AlignTopRight)` |
| `if` |  | `else if(align == Fw::AlignTopCenter)` |
| `if` |  | `else if(align == Fw::AlignBottomLeft)` |
| `if` |  | `else if(align == Fw::AlignBottomRight)` |
| `if` |  | `else if(align == Fw::AlignBottomCenter)` |
| `if` |  | `else if(align == Fw::AlignLeftCenter)` |
| `if` |  | `else if(align == Fw::AlignCenter)` |
| `if` |  | `else if(align == Fw::AlignRightCenter)` |
| `operator` |  | `bool operator==(const TRect<T>& other) const { return (x1 == other.x1 && y1 == other.y1 && x2 == other.x2 && y2 == other.y2); }` |

### Klasa: `TSize`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `isNull` |  | `bool isNull() const { return x2 == x1 - 1 && y2 == y1 - 1; }` |
| `isEmpty` |  | `bool isEmpty() const { return x1 > x2 \|\| y1 > y2; }` |
| `isValid` |  | `bool isValid() const { return x1 <= x2 && y1 <= y2; }` |
| `left` |  | `inline T left() const { return x1; }` |
| `top` |  | `inline T top() const { return y1; }` |
| `right` |  | `inline T right() const { return x2; }` |
| `bottom` |  | `inline T bottom() const { return y2; }` |
| `horizontalCenter` |  | `inline T horizontalCenter() const { return x1 + (x2 - x1)/2; }` |
| `verticalCenter` |  | `inline T verticalCenter() const { return y1 + (y2 - y1)/2; }` |
| `x` |  | `inline T x() const { return x1; }` |
| `y` |  | `inline T y() const { return y1; }` |
| `topLeft` |  | `TPoint<T> topLeft() const { return TPoint<T>(x1, y1); }` |
| `bottomRight` |  | `TPoint<T> bottomRight() const { return TPoint<T>(x2, y2); }` |
| `topRight` |  | `TPoint<T> topRight() const { return TPoint<T>(x2, y1); }` |
| `bottomLeft` |  | `TPoint<T> bottomLeft() const { return TPoint<T>(x1, y2); }` |
| `topCenter` |  | `TPoint<T> topCenter() const { return TPoint<T>((x1+x2)/2, y1); }` |
| `bottomCenter` |  | `TPoint<T> bottomCenter() const { return TPoint<T>((x1+x2)/2, y2); }` |
| `centerLeft` |  | `TPoint<T> centerLeft() const { return TPoint<T>(x1, (y1+y2)/2); }` |
| `centerRight` |  | `TPoint<T> centerRight() const { return TPoint<T>(x2, (y1+y2)/2); }` |
| `center` |  | `TPoint<T> center() const { return TPoint<T>((x1+x2)/2, (y1+y2)/2); }` |
| `width` |  | `T width() const { return  x2 - x1 + 1; }` |
| `height` |  | `T height() const { return  y2 - y1 + 1; }` |
| `size` |  | `TSize<T> size() const { return TSize<T>(width(), height()); }` |
| `reset` |  | `void reset() { x1 = y1 = 0; x2 = y2 = -1; }` |
| `clear` |  | `void clear() { x2 = x1 - 1; y2 = y1 - 1; }` |
| `setLeft` |  | `void setLeft(T pos) { x1 = pos; }` |
| `setTop` |  | `void setTop(T pos) { y1 = pos; }` |
| `setRight` |  | `void setRight(T pos) { x2 = pos; }` |
| `setBottom` |  | `void setBottom(T pos) { y2 = pos; }` |
| `setX` |  | `void setX(T x) { x1 = x; }` |
| `setY` |  | `void setY(T y) { y1 = y; }` |
| `setTopLeft` |  | `void setTopLeft(const TPoint<T> &p) { x1 = p.x; y1 = p.y; }` |
| `setBottomRight` |  | `void setBottomRight(const TPoint<T> &p) { x2 = p.x; y2 = p.y; }` |
| `setTopRight` |  | `void setTopRight(const TPoint<T> &p) { x2 = p.x; y1 = p.y; }` |
| `setBottomLeft` |  | `void setBottomLeft(const TPoint<T> &p) { x1 = p.x; y2 = p.y; }` |
| `setWidth` |  | `void setWidth(T width) { x2 = x1 + width - 1; }` |
| `setHeight` |  | `void setHeight(T height) { y2 = y1 + height- 1; }` |
| `setSize` |  | `void setSize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }` |
| `setRect` |  | `void setRect(T x, T y, T width, T height) { x1 = x; y1 = y; x2 = (x + width - 1); y2 = (y + height - 1); }` |
| `setCoords` |  | `void setCoords(int left, int top, int right, int bottom) { x1 = left; y1 = top; x2 = right; y2 = bottom; }` |
| `expandLeft` |  | `void expandLeft(T add) { x1 -= add; }` |
| `expandTop` |  | `void expandTop(T add) { y1 -= add; }` |
| `expandRight` |  | `void expandRight(T add) { x2 += add; }` |
| `expandBottom` |  | `void expandBottom(T add) { y2 += add; }` |
| `expand` |  | `void expand(T top, T right, T bottom, T left) { x1 -= left; y1 -= top; x2 += right; y2 += bottom; }` |
| `expand` |  | `void expand(T add) { x1 -= add; y1 -= add; x2 += add; y2 += add; }` |
| `translate` |  | `void translate(T x, T y) { x1 += x; y1 += y; x2 += x; y2 += y; }` |
| `translate` |  | `void translate(const TPoint<T> &p) { x1 += p.x; y1 += p.y; x2 += p.x; y2 += p.y; }` |
| `resize` |  | `void resize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }` |
| `resize` |  | `void resize(T width, T height) { x2 = x1 + width - 1; y2 = y1 + height - 1; }` |
| `move` |  | `void move(T x, T y) { x2 += x - x1; y2 += y - y1; x1 = x; y1 = y; }` |
| `move` |  | `void move(const TPoint<T> &p) { x2 += p.x - x1; y2 += p.y - y1; x1 = p.x; y1 = p.y; }` |
| `moveLeft` |  | `void moveLeft(T pos) { x2 += (pos - x1); x1 = pos; }` |
| `moveTop` |  | `void moveTop(T pos) { y2 += (pos - y1); y1 = pos; }` |
| `moveRight` |  | `void moveRight(T pos) { x1 += (pos - x2); x2 = pos; }` |
| `moveBottom` |  | `void moveBottom(T pos) { y1 += (pos - y2); y2 = pos; }` |
| `moveTopLeft` |  | `void moveTopLeft(const TPoint<T> &p) { moveLeft(p.x); moveTop(p.y); }` |
| `moveBottomRight` |  | `void moveBottomRight(const TPoint<T> &p) { moveRight(p.x); moveBottom(p.y); }` |
| `moveTopRight` |  | `void moveTopRight(const TPoint<T> &p) { moveRight(p.x); moveTop(p.y); }` |
| `moveBottomLeft` |  | `void moveBottomLeft(const TPoint<T> &p) { moveLeft(p.x); moveBottom(p.y); }` |
| `moveTopCenter` |  | `void moveTopCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveTop(p.y); }` |
| `moveBottomCenter` |  | `void moveBottomCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveBottom(p.y); }` |
| `moveCenterLeft` |  | `void moveCenterLeft(const TPoint<T> &p) { moveLeft(p.x); moveVerticalCenter(p.y); }` |
| `moveCenterRight` |  | `void moveCenterRight(const TPoint<T> &p) { moveRight(p.x); moveVerticalCenter(p.y); }` |
| `translated` |  | `TRect<T> translated(int x, int y) const { return TRect<T>(TPoint<T>(x1 + x, y1 + y), TPoint<T>(x2 + x, y2 + y)); }` |
| `translated` |  | `TRect<T> translated(const TPoint<T> &p) const { return TRect<T>(TPoint<T>(x1 + p.x, y1 + p.y), TPoint<T>(x2 + p.x, y2 + p.y)); }` |
| `expanded` |  | `TRect<T> expanded(T add) const { return TRect<T>(TPoint<T>(x1 - add, y1 - add), TPoint<T>(x2 + add, y2 + add)); }` |
| `moveCenter` |  | `void moveCenter(const TPoint<T> &p) {` |
| `w` |  | `T w = x2 - x1` |
| `h` |  | `T h = y2 - y1` |
| `moveHorizontalCenter` |  | `void moveHorizontalCenter(T x) {` |
| `w` |  | `T w = x2 - x1` |
| `moveVerticalCenter` |  | `void moveVerticalCenter(T y) {` |
| `h` |  | `T h = y2 - y1` |
| `contains` |  | `bool contains(const TPoint<T> &p, bool insideOnly = false) const {` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `true` |  | `return true` |
| `contains` |  | `bool contains(const TRect<T> &r, bool insideOnly = false) const {` |
| `true` |  | `return true` |
| `false` |  | `return false` |
| `intersects` |  | `bool intersects(const TRect<T> &r) const {` |
| `false` |  | `return false` |
| `l1` |  | `int l1 = x1` |
| `r1` |  | `int r1 = x1` |
| `l2` |  | `int l2 = r.x1` |
| `r2` |  | `int r2 = r.x1` |
| `false` |  | `return false` |
| `t1` |  | `int t1 = y1` |
| `b1` |  | `int b1 = y1` |
| `t2` |  | `int t2 = r.y1` |
| `b2` |  | `int b2 = r.y1` |
| `false` |  | `return false` |
| `true` |  | `return true` |
| `united` |  | `TRect<T> united(const TRect<T> &r) const {` |
| `tmp` |  | `TRect<T> tmp` |
| `tmp` |  | `return tmp` |
| `intersection` |  | `TRect<T> intersection(const TRect<T> &r) const {` |
| `r` |  | `return r` |
| `l1` |  | `int l1 = x1` |
| `r1` |  | `int r1 = x1` |
| `l2` |  | `int l2 = r.x1` |
| `r2` |  | `int r2 = r.x1` |
| `t1` |  | `int t1 = y1` |
| `b1` |  | `int b1 = y1` |
| `t2` |  | `int t2 = r.y1` |
| `b2` |  | `int b2 = r.y1` |
| `tmp` |  | `TRect<T> tmp` |
| `tmp` |  | `return tmp` |
| `bind` |  | `void bind(const TRect<T> &r) {` |
| `alignIn` |  | `void alignIn(const TRect<T> &r, Fw::AlignmentFlag align) {` |
| `if` |  | `else if(align == Fw::AlignTopRight)` |
| `if` |  | `else if(align == Fw::AlignTopCenter)` |
| `if` |  | `else if(align == Fw::AlignBottomLeft)` |
| `if` |  | `else if(align == Fw::AlignBottomRight)` |
| `if` |  | `else if(align == Fw::AlignBottomCenter)` |
| `if` |  | `else if(align == Fw::AlignLeftCenter)` |
| `if` |  | `else if(align == Fw::AlignCenter)` |
| `if` |  | `else if(align == Fw::AlignRightCenter)` |
| `operator` |  | `bool operator==(const TRect<T>& other) const { return (x1 == other.x1 && y1 == other.y1 && x2 == other.x2 && y2 == other.y2); }` |

### Klasa: `TRect`

**Szablon:** `template<class T>`

| Member | Brief | Signature |
|--------|-------|-----------|
| `isNull` |  | `bool isNull() const { return x2 == x1 - 1 && y2 == y1 - 1; }` |
| `isEmpty` |  | `bool isEmpty() const { return x1 > x2 \|\| y1 > y2; }` |
| `isValid` |  | `bool isValid() const { return x1 <= x2 && y1 <= y2; }` |
| `left` |  | `inline T left() const { return x1; }` |
| `top` |  | `inline T top() const { return y1; }` |
| `right` |  | `inline T right() const { return x2; }` |
| `bottom` |  | `inline T bottom() const { return y2; }` |
| `horizontalCenter` |  | `inline T horizontalCenter() const { return x1 + (x2 - x1)/2; }` |
| `verticalCenter` |  | `inline T verticalCenter() const { return y1 + (y2 - y1)/2; }` |
| `x` |  | `inline T x() const { return x1; }` |
| `y` |  | `inline T y() const { return y1; }` |
| `topLeft` |  | `TPoint<T> topLeft() const { return TPoint<T>(x1, y1); }` |
| `bottomRight` |  | `TPoint<T> bottomRight() const { return TPoint<T>(x2, y2); }` |
| `topRight` |  | `TPoint<T> topRight() const { return TPoint<T>(x2, y1); }` |
| `bottomLeft` |  | `TPoint<T> bottomLeft() const { return TPoint<T>(x1, y2); }` |
| `topCenter` |  | `TPoint<T> topCenter() const { return TPoint<T>((x1+x2)/2, y1); }` |
| `bottomCenter` |  | `TPoint<T> bottomCenter() const { return TPoint<T>((x1+x2)/2, y2); }` |
| `centerLeft` |  | `TPoint<T> centerLeft() const { return TPoint<T>(x1, (y1+y2)/2); }` |
| `centerRight` |  | `TPoint<T> centerRight() const { return TPoint<T>(x2, (y1+y2)/2); }` |
| `center` |  | `TPoint<T> center() const { return TPoint<T>((x1+x2)/2, (y1+y2)/2); }` |
| `width` |  | `T width() const { return  x2 - x1 + 1; }` |
| `height` |  | `T height() const { return  y2 - y1 + 1; }` |
| `size` |  | `TSize<T> size() const { return TSize<T>(width(), height()); }` |
| `reset` |  | `void reset() { x1 = y1 = 0; x2 = y2 = -1; }` |
| `clear` |  | `void clear() { x2 = x1 - 1; y2 = y1 - 1; }` |
| `setLeft` |  | `void setLeft(T pos) { x1 = pos; }` |
| `setTop` |  | `void setTop(T pos) { y1 = pos; }` |
| `setRight` |  | `void setRight(T pos) { x2 = pos; }` |
| `setBottom` |  | `void setBottom(T pos) { y2 = pos; }` |
| `setX` |  | `void setX(T x) { x1 = x; }` |
| `setY` |  | `void setY(T y) { y1 = y; }` |
| `setTopLeft` |  | `void setTopLeft(const TPoint<T> &p) { x1 = p.x; y1 = p.y; }` |
| `setBottomRight` |  | `void setBottomRight(const TPoint<T> &p) { x2 = p.x; y2 = p.y; }` |
| `setTopRight` |  | `void setTopRight(const TPoint<T> &p) { x2 = p.x; y1 = p.y; }` |
| `setBottomLeft` |  | `void setBottomLeft(const TPoint<T> &p) { x1 = p.x; y2 = p.y; }` |
| `setWidth` |  | `void setWidth(T width) { x2 = x1 + width - 1; }` |
| `setHeight` |  | `void setHeight(T height) { y2 = y1 + height- 1; }` |
| `setSize` |  | `void setSize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }` |
| `setRect` |  | `void setRect(T x, T y, T width, T height) { x1 = x; y1 = y; x2 = (x + width - 1); y2 = (y + height - 1); }` |
| `setCoords` |  | `void setCoords(int left, int top, int right, int bottom) { x1 = left; y1 = top; x2 = right; y2 = bottom; }` |
| `expandLeft` |  | `void expandLeft(T add) { x1 -= add; }` |
| `expandTop` |  | `void expandTop(T add) { y1 -= add; }` |
| `expandRight` |  | `void expandRight(T add) { x2 += add; }` |
| `expandBottom` |  | `void expandBottom(T add) { y2 += add; }` |
| `expand` |  | `void expand(T top, T right, T bottom, T left) { x1 -= left; y1 -= top; x2 += right; y2 += bottom; }` |
| `expand` |  | `void expand(T add) { x1 -= add; y1 -= add; x2 += add; y2 += add; }` |
| `translate` |  | `void translate(T x, T y) { x1 += x; y1 += y; x2 += x; y2 += y; }` |
| `translate` |  | `void translate(const TPoint<T> &p) { x1 += p.x; y1 += p.y; x2 += p.x; y2 += p.y; }` |
| `resize` |  | `void resize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }` |
| `resize` |  | `void resize(T width, T height) { x2 = x1 + width - 1; y2 = y1 + height - 1; }` |
| `move` |  | `void move(T x, T y) { x2 += x - x1; y2 += y - y1; x1 = x; y1 = y; }` |
| `move` |  | `void move(const TPoint<T> &p) { x2 += p.x - x1; y2 += p.y - y1; x1 = p.x; y1 = p.y; }` |
| `moveLeft` |  | `void moveLeft(T pos) { x2 += (pos - x1); x1 = pos; }` |
| `moveTop` |  | `void moveTop(T pos) { y2 += (pos - y1); y1 = pos; }` |
| `moveRight` |  | `void moveRight(T pos) { x1 += (pos - x2); x2 = pos; }` |
| `moveBottom` |  | `void moveBottom(T pos) { y1 += (pos - y2); y2 = pos; }` |
| `moveTopLeft` |  | `void moveTopLeft(const TPoint<T> &p) { moveLeft(p.x); moveTop(p.y); }` |
| `moveBottomRight` |  | `void moveBottomRight(const TPoint<T> &p) { moveRight(p.x); moveBottom(p.y); }` |
| `moveTopRight` |  | `void moveTopRight(const TPoint<T> &p) { moveRight(p.x); moveTop(p.y); }` |
| `moveBottomLeft` |  | `void moveBottomLeft(const TPoint<T> &p) { moveLeft(p.x); moveBottom(p.y); }` |
| `moveTopCenter` |  | `void moveTopCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveTop(p.y); }` |
| `moveBottomCenter` |  | `void moveBottomCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveBottom(p.y); }` |
| `moveCenterLeft` |  | `void moveCenterLeft(const TPoint<T> &p) { moveLeft(p.x); moveVerticalCenter(p.y); }` |
| `moveCenterRight` |  | `void moveCenterRight(const TPoint<T> &p) { moveRight(p.x); moveVerticalCenter(p.y); }` |
| `translated` |  | `TRect<T> translated(int x, int y) const { return TRect<T>(TPoint<T>(x1 + x, y1 + y), TPoint<T>(x2 + x, y2 + y)); }` |
| `translated` |  | `TRect<T> translated(const TPoint<T> &p) const { return TRect<T>(TPoint<T>(x1 + p.x, y1 + p.y), TPoint<T>(x2 + p.x, y2 + p.y)); }` |
| `expanded` |  | `TRect<T> expanded(T add) const { return TRect<T>(TPoint<T>(x1 - add, y1 - add), TPoint<T>(x2 + add, y2 + add)); }` |
| `moveCenter` |  | `void moveCenter(const TPoint<T> &p) {` |
| `w` |  | `T w = x2 - x1` |
| `h` |  | `T h = y2 - y1` |
| `moveHorizontalCenter` |  | `void moveHorizontalCenter(T x) {` |
| `w` |  | `T w = x2 - x1` |
| `moveVerticalCenter` |  | `void moveVerticalCenter(T y) {` |
| `h` |  | `T h = y2 - y1` |
| `contains` |  | `bool contains(const TPoint<T> &p, bool insideOnly = false) const {` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `false` |  | `return false` |
| `true` |  | `return true` |
| `contains` |  | `bool contains(const TRect<T> &r, bool insideOnly = false) const {` |
| `true` |  | `return true` |
| `false` |  | `return false` |
| `intersects` |  | `bool intersects(const TRect<T> &r) const {` |
| `false` |  | `return false` |
| `l1` |  | `int l1 = x1` |
| `r1` |  | `int r1 = x1` |
| `l2` |  | `int l2 = r.x1` |
| `r2` |  | `int r2 = r.x1` |
| `false` |  | `return false` |
| `t1` |  | `int t1 = y1` |
| `b1` |  | `int b1 = y1` |
| `t2` |  | `int t2 = r.y1` |
| `b2` |  | `int b2 = r.y1` |
| `false` |  | `return false` |
| `true` |  | `return true` |
| `united` |  | `TRect<T> united(const TRect<T> &r) const {` |
| `tmp` |  | `TRect<T> tmp` |
| `tmp` |  | `return tmp` |
| `intersection` |  | `TRect<T> intersection(const TRect<T> &r) const {` |
| `r` |  | `return r` |
| `l1` |  | `int l1 = x1` |
| `r1` |  | `int r1 = x1` |
| `l2` |  | `int l2 = r.x1` |
| `r2` |  | `int r2 = r.x1` |
| `t1` |  | `int t1 = y1` |
| `b1` |  | `int b1 = y1` |
| `t2` |  | `int t2 = r.y1` |
| `b2` |  | `int b2 = r.y1` |
| `tmp` |  | `TRect<T> tmp` |
| `tmp` |  | `return tmp` |
| `bind` |  | `void bind(const TRect<T> &r) {` |
| `alignIn` |  | `void alignIn(const TRect<T> &r, Fw::AlignmentFlag align) {` |
| `if` |  | `else if(align == Fw::AlignTopRight)` |
| `if` |  | `else if(align == Fw::AlignTopCenter)` |
| `if` |  | `else if(align == Fw::AlignBottomLeft)` |
| `if` |  | `else if(align == Fw::AlignBottomRight)` |
| `if` |  | `else if(align == Fw::AlignBottomCenter)` |
| `if` |  | `else if(align == Fw::AlignLeftCenter)` |
| `if` |  | `else if(align == Fw::AlignCenter)` |
| `if` |  | `else if(align == Fw::AlignRightCenter)` |
| `operator` |  | `bool operator==(const TRect<T>& other) const { return (x1 == other.x1 && y1 == other.y1 && x2 == other.x2 && y2 == other.y2); }` |

## Functions

### `isNull`

**Sygnatura:** `bool isNull() const { return x2 == x1 - 1 && y2 == y1 - 1; }`

### `isEmpty`

**Sygnatura:** `bool isEmpty() const { return x1 > x2 || y1 > y2; }`

### `isValid`

**Sygnatura:** `bool isValid() const { return x1 <= x2 && y1 <= y2; }`

### `left`

**Sygnatura:** `inline T left() const { return x1; }`

### `top`

**Sygnatura:** `inline T top() const { return y1; }`

### `right`

**Sygnatura:** `inline T right() const { return x2; }`

### `bottom`

**Sygnatura:** `inline T bottom() const { return y2; }`

### `horizontalCenter`

**Sygnatura:** `inline T horizontalCenter() const { return x1 + (x2 - x1)/2; }`

### `verticalCenter`

**Sygnatura:** `inline T verticalCenter() const { return y1 + (y2 - y1)/2; }`

### `x`

**Sygnatura:** `inline T x() const { return x1; }`

### `y`

**Sygnatura:** `inline T y() const { return y1; }`

### `topLeft`

**Sygnatura:** `TPoint<T> topLeft() const { return TPoint<T>(x1, y1); }`

### `bottomRight`

**Sygnatura:** `TPoint<T> bottomRight() const { return TPoint<T>(x2, y2); }`

### `topRight`

**Sygnatura:** `TPoint<T> topRight() const { return TPoint<T>(x2, y1); }`

### `bottomLeft`

**Sygnatura:** `TPoint<T> bottomLeft() const { return TPoint<T>(x1, y2); }`

### `topCenter`

**Sygnatura:** `TPoint<T> topCenter() const { return TPoint<T>((x1+x2)/2, y1); }`

### `bottomCenter`

**Sygnatura:** `TPoint<T> bottomCenter() const { return TPoint<T>((x1+x2)/2, y2); }`

### `centerLeft`

**Sygnatura:** `TPoint<T> centerLeft() const { return TPoint<T>(x1, (y1+y2)/2); }`

### `centerRight`

**Sygnatura:** `TPoint<T> centerRight() const { return TPoint<T>(x2, (y1+y2)/2); }`

### `center`

**Sygnatura:** `TPoint<T> center() const { return TPoint<T>((x1+x2)/2, (y1+y2)/2); }`

### `width`

**Sygnatura:** `T width() const { return  x2 - x1 + 1; }`

### `height`

**Sygnatura:** `T height() const { return  y2 - y1 + 1; }`

### `size`

**Sygnatura:** `TSize<T> size() const { return TSize<T>(width(), height()); }`

### `reset`

**Sygnatura:** `void reset() { x1 = y1 = 0; x2 = y2 = -1; }`

### `clear`

**Sygnatura:** `void clear() { x2 = x1 - 1; y2 = y1 - 1; }`

### `setLeft`

**Sygnatura:** `void setLeft(T pos) { x1 = pos; }`

### `setTop`

**Sygnatura:** `void setTop(T pos) { y1 = pos; }`

### `setRight`

**Sygnatura:** `void setRight(T pos) { x2 = pos; }`

### `setBottom`

**Sygnatura:** `void setBottom(T pos) { y2 = pos; }`

### `setX`

**Sygnatura:** `void setX(T x) { x1 = x; }`

### `setY`

**Sygnatura:** `void setY(T y) { y1 = y; }`

### `setTopLeft`

**Sygnatura:** `void setTopLeft(const TPoint<T> &p) { x1 = p.x; y1 = p.y; }`

### `setBottomRight`

**Sygnatura:** `void setBottomRight(const TPoint<T> &p) { x2 = p.x; y2 = p.y; }`

### `setTopRight`

**Sygnatura:** `void setTopRight(const TPoint<T> &p) { x2 = p.x; y1 = p.y; }`

### `setBottomLeft`

**Sygnatura:** `void setBottomLeft(const TPoint<T> &p) { x1 = p.x; y2 = p.y; }`

### `setWidth`

**Sygnatura:** `void setWidth(T width) { x2 = x1 + width - 1; }`

### `setHeight`

**Sygnatura:** `void setHeight(T height) { y2 = y1 + height- 1; }`

### `setSize`

**Sygnatura:** `void setSize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }`

### `setRect`

**Sygnatura:** `void setRect(T x, T y, T width, T height) { x1 = x; y1 = y; x2 = (x + width - 1); y2 = (y + height - 1); }`

### `setCoords`

**Sygnatura:** `void setCoords(int left, int top, int right, int bottom) { x1 = left; y1 = top; x2 = right; y2 = bottom; }`

### `expandLeft`

**Sygnatura:** `void expandLeft(T add) { x1 -= add; }`

### `expandTop`

**Sygnatura:** `void expandTop(T add) { y1 -= add; }`

### `expandRight`

**Sygnatura:** `void expandRight(T add) { x2 += add; }`

### `expandBottom`

**Sygnatura:** `void expandBottom(T add) { y2 += add; }`

### `expand`

**Sygnatura:** `void expand(T top, T right, T bottom, T left) { x1 -= left; y1 -= top; x2 += right; y2 += bottom; }`

### `expand`

**Sygnatura:** `void expand(T add) { x1 -= add; y1 -= add; x2 += add; y2 += add; }`

### `translate`

**Sygnatura:** `void translate(T x, T y) { x1 += x; y1 += y; x2 += x; y2 += y; }`

### `translate`

**Sygnatura:** `void translate(const TPoint<T> &p) { x1 += p.x; y1 += p.y; x2 += p.x; y2 += p.y; }`

### `resize`

**Sygnatura:** `void resize(const TSize<T>& size) { x2 = x1 + size.width() - 1; y2 = y1 + size.height() - 1; }`

### `resize`

**Sygnatura:** `void resize(T width, T height) { x2 = x1 + width - 1; y2 = y1 + height - 1; }`

### `move`

**Sygnatura:** `void move(T x, T y) { x2 += x - x1; y2 += y - y1; x1 = x; y1 = y; }`

### `move`

**Sygnatura:** `void move(const TPoint<T> &p) { x2 += p.x - x1; y2 += p.y - y1; x1 = p.x; y1 = p.y; }`

### `moveLeft`

**Sygnatura:** `void moveLeft(T pos) { x2 += (pos - x1); x1 = pos; }`

### `moveTop`

**Sygnatura:** `void moveTop(T pos) { y2 += (pos - y1); y1 = pos; }`

### `moveRight`

**Sygnatura:** `void moveRight(T pos) { x1 += (pos - x2); x2 = pos; }`

### `moveBottom`

**Sygnatura:** `void moveBottom(T pos) { y1 += (pos - y2); y2 = pos; }`

### `moveTopLeft`

**Sygnatura:** `void moveTopLeft(const TPoint<T> &p) { moveLeft(p.x); moveTop(p.y); }`

### `moveBottomRight`

**Sygnatura:** `void moveBottomRight(const TPoint<T> &p) { moveRight(p.x); moveBottom(p.y); }`

### `moveTopRight`

**Sygnatura:** `void moveTopRight(const TPoint<T> &p) { moveRight(p.x); moveTop(p.y); }`

### `moveBottomLeft`

**Sygnatura:** `void moveBottomLeft(const TPoint<T> &p) { moveLeft(p.x); moveBottom(p.y); }`

### `moveTopCenter`

**Sygnatura:** `void moveTopCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveTop(p.y); }`

### `moveBottomCenter`

**Sygnatura:** `void moveBottomCenter(const TPoint<T> &p) { moveHorizontalCenter(p.x); moveBottom(p.y); }`

### `moveCenterLeft`

**Sygnatura:** `void moveCenterLeft(const TPoint<T> &p) { moveLeft(p.x); moveVerticalCenter(p.y); }`

### `moveCenterRight`

**Sygnatura:** `void moveCenterRight(const TPoint<T> &p) { moveRight(p.x); moveVerticalCenter(p.y); }`

### `translated`

**Sygnatura:** `TRect<T> translated(int x, int y) const { return TRect<T>(TPoint<T>(x1 + x, y1 + y), TPoint<T>(x2 + x, y2 + y)); }`

### `translated`

**Sygnatura:** `TRect<T> translated(const TPoint<T> &p) const { return TRect<T>(TPoint<T>(x1 + p.x, y1 + p.y), TPoint<T>(x2 + p.x, y2 + p.y)); }`

### `expanded`

**Sygnatura:** `TRect<T> expanded(T add) const { return TRect<T>(TPoint<T>(x1 - add, y1 - add), TPoint<T>(x2 + add, y2 + add)); }`

### `moveCenter`

**Sygnatura:** `void moveCenter(const TPoint<T> &p) {`

### `moveHorizontalCenter`

**Sygnatura:** `void moveHorizontalCenter(T x) {`

### `moveVerticalCenter`

**Sygnatura:** `void moveVerticalCenter(T y) {`

### `contains`

**Sygnatura:** `bool contains(const TPoint<T> &p, bool insideOnly = false) const {`

### `contains`

**Sygnatura:** `bool contains(const TRect<T> &r, bool insideOnly = false) const {`

### `intersects`

**Sygnatura:** `bool intersects(const TRect<T> &r) const {`

### `united`

**Sygnatura:** `TRect<T> united(const TRect<T> &r) const {`

### `intersection`

**Sygnatura:** `TRect<T> intersection(const TRect<T> &r) const {`

### `bind`

**Sygnatura:** `void bind(const TRect<T> &r) {`

### `alignIn`

**Sygnatura:** `void alignIn(const TRect<T> &r, Fw::AlignmentFlag align) {`

### `if`

**Sygnatura:** `else if(align == Fw::AlignTopRight)`

### `if`

**Sygnatura:** `else if(align == Fw::AlignTopCenter)`

### `if`

**Sygnatura:** `else if(align == Fw::AlignBottomLeft)`

### `if`

**Sygnatura:** `else if(align == Fw::AlignBottomRight)`

### `if`

**Sygnatura:** `else if(align == Fw::AlignBottomCenter)`

### `if`

**Sygnatura:** `else if(align == Fw::AlignLeftCenter)`

### `if`

**Sygnatura:** `else if(align == Fw::AlignCenter)`

### `if`

**Sygnatura:** `else if(align == Fw::AlignRightCenter)`

## Types/Aliases

### `Rect`

**Typedef:** `TRect<int>`

### `RectF`

**Typedef:** `TRect<float>`

## Class Diagram

Zobacz: [../diagrams/rect.mmd](../diagrams/rect.mmd)
