// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: shared.proto

#ifndef GOOGLE_PROTOBUF_INCLUDED_shared_2eproto
#define GOOGLE_PROTOBUF_INCLUDED_shared_2eproto

#include <limits>
#include <string>

#include <google/protobuf/port_def.inc>
#if PROTOBUF_VERSION < 3021000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers. Please update
#error your headers.
#endif
#if 3021005 < PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers. Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/port_undef.inc>
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/arena.h>
#include <google/protobuf/arenastring.h>
#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/metadata_lite.h>
#include <google/protobuf/generated_message_reflection.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>  // IWYU pragma: export
#include <google/protobuf/extension_set.h>  // IWYU pragma: export
#include <google/protobuf/generated_enum_reflection.h>
#include <google/protobuf/unknown_field_set.h>
// @@protoc_insertion_point(includes)
#include <google/protobuf/port_def.inc>
#define PROTOBUF_INTERNAL_EXPORT_shared_2eproto
PROTOBUF_NAMESPACE_OPEN
namespace internal {
class AnyMetadata;
}  // namespace internal
PROTOBUF_NAMESPACE_CLOSE

// Internal implementation detail -- do not use these members.
struct TableStruct_shared_2eproto {
  static const uint32_t offsets[];
};
extern const ::PROTOBUF_NAMESPACE_ID::internal::DescriptorTable descriptor_table_shared_2eproto;
namespace tibia {
namespace protobuf {
namespace shared {
class Coordinate;
struct CoordinateDefaultTypeInternal;
extern CoordinateDefaultTypeInternal _Coordinate_default_instance_;
}  // namespace shared
}  // namespace protobuf
}  // namespace tibia
PROTOBUF_NAMESPACE_OPEN
template<> ::tibia::protobuf::shared::Coordinate* Arena::CreateMaybeMessage<::tibia::protobuf::shared::Coordinate>(Arena*);
PROTOBUF_NAMESPACE_CLOSE
namespace tibia {
namespace protobuf {
namespace shared {

enum PLAYER_ACTION : int {
  PLAYER_ACTION_NONE = 0,
  PLAYER_ACTION_LOOK = 1,
  PLAYER_ACTION_USE = 2,
  PLAYER_ACTION_OPEN = 3,
  PLAYER_ACTION_AUTOWALK_HIGHLIGHT = 4
};
bool PLAYER_ACTION_IsValid(int value);
constexpr PLAYER_ACTION PLAYER_ACTION_MIN = PLAYER_ACTION_NONE;
constexpr PLAYER_ACTION PLAYER_ACTION_MAX = PLAYER_ACTION_AUTOWALK_HIGHLIGHT;
constexpr int PLAYER_ACTION_ARRAYSIZE = PLAYER_ACTION_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* PLAYER_ACTION_descriptor();
template<typename T>
inline const std::string& PLAYER_ACTION_Name(T enum_t_value) {
  static_assert(::std::is_same<T, PLAYER_ACTION>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function PLAYER_ACTION_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    PLAYER_ACTION_descriptor(), enum_t_value);
}
inline bool PLAYER_ACTION_Parse(
    ::PROTOBUF_NAMESPACE_ID::ConstStringParam name, PLAYER_ACTION* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<PLAYER_ACTION>(
    PLAYER_ACTION_descriptor(), name, value);
}
enum ITEM_CATEGORY : int {
  ITEM_CATEGORY_ARMORS = 1,
  ITEM_CATEGORY_AMULETS = 2,
  ITEM_CATEGORY_BOOTS = 3,
  ITEM_CATEGORY_CONTAINERS = 4,
  ITEM_CATEGORY_DECORATION = 5,
  ITEM_CATEGORY_FOOD = 6,
  ITEM_CATEGORY_HELMETS_HATS = 7,
  ITEM_CATEGORY_LEGS = 8,
  ITEM_CATEGORY_OTHERS = 9,
  ITEM_CATEGORY_POTIONS = 10,
  ITEM_CATEGORY_RINGS = 11,
  ITEM_CATEGORY_RUNES = 12,
  ITEM_CATEGORY_SHIELDS = 13,
  ITEM_CATEGORY_TOOLS = 14,
  ITEM_CATEGORY_VALUABLES = 15,
  ITEM_CATEGORY_AMMUNITION = 16,
  ITEM_CATEGORY_AXES = 17,
  ITEM_CATEGORY_CLUBS = 18,
  ITEM_CATEGORY_DISTANCE_WEAPONS = 19,
  ITEM_CATEGORY_SWORDS = 20,
  ITEM_CATEGORY_WANDS_RODS = 21,
  ITEM_CATEGORY_PREMIUM_SCROLLS = 22,
  ITEM_CATEGORY_TIBIA_COINS = 23,
  ITEM_CATEGORY_CREATURE_PRODUCTS = 24,
  ITEM_CATEGORY_QUIVER = 25
};
bool ITEM_CATEGORY_IsValid(int value);
constexpr ITEM_CATEGORY ITEM_CATEGORY_MIN = ITEM_CATEGORY_ARMORS;
constexpr ITEM_CATEGORY ITEM_CATEGORY_MAX = ITEM_CATEGORY_QUIVER;
constexpr int ITEM_CATEGORY_ARRAYSIZE = ITEM_CATEGORY_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* ITEM_CATEGORY_descriptor();
template<typename T>
inline const std::string& ITEM_CATEGORY_Name(T enum_t_value) {
  static_assert(::std::is_same<T, ITEM_CATEGORY>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function ITEM_CATEGORY_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    ITEM_CATEGORY_descriptor(), enum_t_value);
}
inline bool ITEM_CATEGORY_Parse(
    ::PROTOBUF_NAMESPACE_ID::ConstStringParam name, ITEM_CATEGORY* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<ITEM_CATEGORY>(
    ITEM_CATEGORY_descriptor(), name, value);
}
enum VOCATION : int {
  VOCATION_ANY = -1,
  VOCATION_NONE = 0,
  VOCATION_KNIGHT = 1,
  VOCATION_PALADIN = 2,
  VOCATION_SORCERER = 3,
  VOCATION_DRUID = 4,
  VOCATION_PROMOTED = 10
};
bool VOCATION_IsValid(int value);
constexpr VOCATION VOCATION_MIN = VOCATION_ANY;
constexpr VOCATION VOCATION_MAX = VOCATION_PROMOTED;
constexpr int VOCATION_ARRAYSIZE = VOCATION_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* VOCATION_descriptor();
template<typename T>
inline const std::string& VOCATION_Name(T enum_t_value) {
  static_assert(::std::is_same<T, VOCATION>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function VOCATION_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    VOCATION_descriptor(), enum_t_value);
}
inline bool VOCATION_Parse(
    ::PROTOBUF_NAMESPACE_ID::ConstStringParam name, VOCATION* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<VOCATION>(
    VOCATION_descriptor(), name, value);
}
enum ANIMATION_LOOP_TYPE : int {
  ANIMATION_LOOP_TYPE_PINGPONG = -1,
  ANIMATION_LOOP_TYPE_INFINITE = 0,
  ANIMATION_LOOP_TYPE_COUNTED = 1
};
bool ANIMATION_LOOP_TYPE_IsValid(int value);
constexpr ANIMATION_LOOP_TYPE ANIMATION_LOOP_TYPE_MIN = ANIMATION_LOOP_TYPE_PINGPONG;
constexpr ANIMATION_LOOP_TYPE ANIMATION_LOOP_TYPE_MAX = ANIMATION_LOOP_TYPE_COUNTED;
constexpr int ANIMATION_LOOP_TYPE_ARRAYSIZE = ANIMATION_LOOP_TYPE_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* ANIMATION_LOOP_TYPE_descriptor();
template<typename T>
inline const std::string& ANIMATION_LOOP_TYPE_Name(T enum_t_value) {
  static_assert(::std::is_same<T, ANIMATION_LOOP_TYPE>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function ANIMATION_LOOP_TYPE_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    ANIMATION_LOOP_TYPE_descriptor(), enum_t_value);
}
inline bool ANIMATION_LOOP_TYPE_Parse(
    ::PROTOBUF_NAMESPACE_ID::ConstStringParam name, ANIMATION_LOOP_TYPE* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<ANIMATION_LOOP_TYPE>(
    ANIMATION_LOOP_TYPE_descriptor(), name, value);
}
enum HOOK_TYPE : int {
  HOOK_TYPE_SOUTH = 1,
  HOOK_TYPE_EAST = 2
};
bool HOOK_TYPE_IsValid(int value);
constexpr HOOK_TYPE HOOK_TYPE_MIN = HOOK_TYPE_SOUTH;
constexpr HOOK_TYPE HOOK_TYPE_MAX = HOOK_TYPE_EAST;
constexpr int HOOK_TYPE_ARRAYSIZE = HOOK_TYPE_MAX + 1;

const ::PROTOBUF_NAMESPACE_ID::EnumDescriptor* HOOK_TYPE_descriptor();
template<typename T>
inline const std::string& HOOK_TYPE_Name(T enum_t_value) {
  static_assert(::std::is_same<T, HOOK_TYPE>::value ||
    ::std::is_integral<T>::value,
    "Incorrect type passed to function HOOK_TYPE_Name.");
  return ::PROTOBUF_NAMESPACE_ID::internal::NameOfEnum(
    HOOK_TYPE_descriptor(), enum_t_value);
}
inline bool HOOK_TYPE_Parse(
    ::PROTOBUF_NAMESPACE_ID::ConstStringParam name, HOOK_TYPE* value) {
  return ::PROTOBUF_NAMESPACE_ID::internal::ParseNamedEnum<HOOK_TYPE>(
    HOOK_TYPE_descriptor(), name, value);
}
// ===================================================================

class Coordinate final :
    public ::PROTOBUF_NAMESPACE_ID::Message /* @@protoc_insertion_point(class_definition:tibia.protobuf.shared.Coordinate) */ {
 public:
  inline Coordinate() : Coordinate(nullptr) {}
  ~Coordinate() override;
  explicit PROTOBUF_CONSTEXPR Coordinate(::PROTOBUF_NAMESPACE_ID::internal::ConstantInitialized);

  Coordinate(const Coordinate& from);
  Coordinate(Coordinate&& from) noexcept
    : Coordinate() {
    *this = ::std::move(from);
  }

  inline Coordinate& operator=(const Coordinate& from) {
    CopyFrom(from);
    return *this;
  }
  inline Coordinate& operator=(Coordinate&& from) noexcept {
    if (this == &from) return *this;
    if (GetOwningArena() == from.GetOwningArena()
  #ifdef PROTOBUF_FORCE_COPY_IN_MOVE
        && GetOwningArena() != nullptr
  #endif  // !PROTOBUF_FORCE_COPY_IN_MOVE
    ) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  inline const ::PROTOBUF_NAMESPACE_ID::UnknownFieldSet& unknown_fields() const {
    return _internal_metadata_.unknown_fields<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>(::PROTOBUF_NAMESPACE_ID::UnknownFieldSet::default_instance);
  }
  inline ::PROTOBUF_NAMESPACE_ID::UnknownFieldSet* mutable_unknown_fields() {
    return _internal_metadata_.mutable_unknown_fields<::PROTOBUF_NAMESPACE_ID::UnknownFieldSet>();
  }

  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::PROTOBUF_NAMESPACE_ID::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::PROTOBUF_NAMESPACE_ID::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const Coordinate& default_instance() {
    return *internal_default_instance();
  }
  static inline const Coordinate* internal_default_instance() {
    return reinterpret_cast<const Coordinate*>(
               &_Coordinate_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(Coordinate& a, Coordinate& b) {
    a.Swap(&b);
  }
  inline void Swap(Coordinate* other) {
    if (other == this) return;
  #ifdef PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() != nullptr &&
        GetOwningArena() == other->GetOwningArena()) {
   #else  // PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetOwningArena() == other->GetOwningArena()) {
  #endif  // !PROTOBUF_FORCE_COPY_IN_SWAP
      InternalSwap(other);
    } else {
      ::PROTOBUF_NAMESPACE_ID::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(Coordinate* other) {
    if (other == this) return;
    GOOGLE_DCHECK(GetOwningArena() == other->GetOwningArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  Coordinate* New(::PROTOBUF_NAMESPACE_ID::Arena* arena = nullptr) const final {
    return CreateMaybeMessage<Coordinate>(arena);
  }
  using ::PROTOBUF_NAMESPACE_ID::Message::CopyFrom;
  void CopyFrom(const Coordinate& from);
  using ::PROTOBUF_NAMESPACE_ID::Message::MergeFrom;
  void MergeFrom( const Coordinate& from) {
    Coordinate::MergeImpl(*this, from);
  }
  private:
  static void MergeImpl(::PROTOBUF_NAMESPACE_ID::Message& to_msg, const ::PROTOBUF_NAMESPACE_ID::Message& from_msg);
  public:
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::PROTOBUF_NAMESPACE_ID::internal::ParseContext* ctx) final;
  uint8_t* _InternalSerialize(
      uint8_t* target, ::PROTOBUF_NAMESPACE_ID::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const final { return _impl_._cached_size_.Get(); }

  private:
  void SharedCtor(::PROTOBUF_NAMESPACE_ID::Arena* arena, bool is_message_owned);
  void SharedDtor();
  void SetCachedSize(int size) const final;
  void InternalSwap(Coordinate* other);

  private:
  friend class ::PROTOBUF_NAMESPACE_ID::internal::AnyMetadata;
  static ::PROTOBUF_NAMESPACE_ID::StringPiece FullMessageName() {
    return "tibia.protobuf.shared.Coordinate";
  }
  protected:
  explicit Coordinate(::PROTOBUF_NAMESPACE_ID::Arena* arena,
                       bool is_message_owned = false);
  public:

  static const ClassData _class_data_;
  const ::PROTOBUF_NAMESPACE_ID::Message::ClassData*GetClassData() const final;

  ::PROTOBUF_NAMESPACE_ID::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kXFieldNumber = 1,
    kYFieldNumber = 2,
    kZFieldNumber = 3,
  };
  // optional uint32 x = 1;
  bool has_x() const;
  private:
  bool _internal_has_x() const;
  public:
  void clear_x();
  uint32_t x() const;
  void set_x(uint32_t value);
  private:
  uint32_t _internal_x() const;
  void _internal_set_x(uint32_t value);
  public:

  // optional uint32 y = 2;
  bool has_y() const;
  private:
  bool _internal_has_y() const;
  public:
  void clear_y();
  uint32_t y() const;
  void set_y(uint32_t value);
  private:
  uint32_t _internal_y() const;
  void _internal_set_y(uint32_t value);
  public:

  // optional uint32 z = 3;
  bool has_z() const;
  private:
  bool _internal_has_z() const;
  public:
  void clear_z();
  uint32_t z() const;
  void set_z(uint32_t value);
  private:
  uint32_t _internal_z() const;
  void _internal_set_z(uint32_t value);
  public:

  // @@protoc_insertion_point(class_scope:tibia.protobuf.shared.Coordinate)
 private:
  class _Internal;

  template <typename T> friend class ::PROTOBUF_NAMESPACE_ID::Arena::InternalHelper;
  typedef void InternalArenaConstructable_;
  typedef void DestructorSkippable_;
  struct Impl_ {
    ::PROTOBUF_NAMESPACE_ID::internal::HasBits<1> _has_bits_;
    mutable ::PROTOBUF_NAMESPACE_ID::internal::CachedSize _cached_size_;
    uint32_t x_;
    uint32_t y_;
    uint32_t z_;
  };
  union { Impl_ _impl_; };
  friend struct ::TableStruct_shared_2eproto;
};
// ===================================================================


// ===================================================================

#ifdef __GNUC__
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// Coordinate

// optional uint32 x = 1;
inline bool Coordinate::_internal_has_x() const {
  bool value = (_impl_._has_bits_[0] & 0x00000001u) != 0;
  return value;
}
inline bool Coordinate::has_x() const {
  return _internal_has_x();
}
inline void Coordinate::clear_x() {
  _impl_.x_ = 0u;
  _impl_._has_bits_[0] &= ~0x00000001u;
}
inline uint32_t Coordinate::_internal_x() const {
  return _impl_.x_;
}
inline uint32_t Coordinate::x() const {
  // @@protoc_insertion_point(field_get:tibia.protobuf.shared.Coordinate.x)
  return _internal_x();
}
inline void Coordinate::_internal_set_x(uint32_t value) {
  _impl_._has_bits_[0] |= 0x00000001u;
  _impl_.x_ = value;
}
inline void Coordinate::set_x(uint32_t value) {
  _internal_set_x(value);
  // @@protoc_insertion_point(field_set:tibia.protobuf.shared.Coordinate.x)
}

// optional uint32 y = 2;
inline bool Coordinate::_internal_has_y() const {
  bool value = (_impl_._has_bits_[0] & 0x00000002u) != 0;
  return value;
}
inline bool Coordinate::has_y() const {
  return _internal_has_y();
}
inline void Coordinate::clear_y() {
  _impl_.y_ = 0u;
  _impl_._has_bits_[0] &= ~0x00000002u;
}
inline uint32_t Coordinate::_internal_y() const {
  return _impl_.y_;
}
inline uint32_t Coordinate::y() const {
  // @@protoc_insertion_point(field_get:tibia.protobuf.shared.Coordinate.y)
  return _internal_y();
}
inline void Coordinate::_internal_set_y(uint32_t value) {
  _impl_._has_bits_[0] |= 0x00000002u;
  _impl_.y_ = value;
}
inline void Coordinate::set_y(uint32_t value) {
  _internal_set_y(value);
  // @@protoc_insertion_point(field_set:tibia.protobuf.shared.Coordinate.y)
}

// optional uint32 z = 3;
inline bool Coordinate::_internal_has_z() const {
  bool value = (_impl_._has_bits_[0] & 0x00000004u) != 0;
  return value;
}
inline bool Coordinate::has_z() const {
  return _internal_has_z();
}
inline void Coordinate::clear_z() {
  _impl_.z_ = 0u;
  _impl_._has_bits_[0] &= ~0x00000004u;
}
inline uint32_t Coordinate::_internal_z() const {
  return _impl_.z_;
}
inline uint32_t Coordinate::z() const {
  // @@protoc_insertion_point(field_get:tibia.protobuf.shared.Coordinate.z)
  return _internal_z();
}
inline void Coordinate::_internal_set_z(uint32_t value) {
  _impl_._has_bits_[0] |= 0x00000004u;
  _impl_.z_ = value;
}
inline void Coordinate::set_z(uint32_t value) {
  _internal_set_z(value);
  // @@protoc_insertion_point(field_set:tibia.protobuf.shared.Coordinate.z)
}

#ifdef __GNUC__
  #pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)

}  // namespace shared
}  // namespace protobuf
}  // namespace tibia

PROTOBUF_NAMESPACE_OPEN

template <> struct is_proto_enum< ::tibia::protobuf::shared::PLAYER_ACTION> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::tibia::protobuf::shared::PLAYER_ACTION>() {
  return ::tibia::protobuf::shared::PLAYER_ACTION_descriptor();
}
template <> struct is_proto_enum< ::tibia::protobuf::shared::ITEM_CATEGORY> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::tibia::protobuf::shared::ITEM_CATEGORY>() {
  return ::tibia::protobuf::shared::ITEM_CATEGORY_descriptor();
}
template <> struct is_proto_enum< ::tibia::protobuf::shared::VOCATION> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::tibia::protobuf::shared::VOCATION>() {
  return ::tibia::protobuf::shared::VOCATION_descriptor();
}
template <> struct is_proto_enum< ::tibia::protobuf::shared::ANIMATION_LOOP_TYPE> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::tibia::protobuf::shared::ANIMATION_LOOP_TYPE>() {
  return ::tibia::protobuf::shared::ANIMATION_LOOP_TYPE_descriptor();
}
template <> struct is_proto_enum< ::tibia::protobuf::shared::HOOK_TYPE> : ::std::true_type {};
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::tibia::protobuf::shared::HOOK_TYPE>() {
  return ::tibia::protobuf::shared::HOOK_TYPE_descriptor();
}

PROTOBUF_NAMESPACE_CLOSE

// @@protoc_insertion_point(global_scope)

#include <google/protobuf/port_undef.inc>
#endif  // GOOGLE_PROTOBUF_INCLUDED_GOOGLE_PROTOBUF_INCLUDED_shared_2eproto
