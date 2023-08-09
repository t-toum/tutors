// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String? get id => throw _privateConstructorUsedError;
  String? get receiverID => throw _privateConstructorUsedError;
  String? get senderID => throw _privateConstructorUsedError;
  Users? get receiver => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {String? id, String? receiverID, String? senderID, Users? receiver});

  $UsersCopyWith<$Res>? get receiver;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? receiverID = freezed,
    Object? senderID = freezed,
    Object? receiver = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverID: freezed == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as String?,
      senderID: freezed == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as String?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Users?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get receiver {
    if (_value.receiver == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.receiver!, (value) {
      return _then(_value.copyWith(receiver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? receiverID, String? senderID, Users? receiver});

  @override
  $UsersCopyWith<$Res>? get receiver;
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res, _$_Chat>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? receiverID = freezed,
    Object? senderID = freezed,
    Object? receiver = freezed,
  }) {
    return _then(_$_Chat(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverID: freezed == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as String?,
      senderID: freezed == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as String?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Users?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  const _$_Chat({this.id, this.receiverID, this.senderID, this.receiver});

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

  @override
  final String? id;
  @override
  final String? receiverID;
  @override
  final String? senderID;
  @override
  final Users? receiver;

  @override
  String toString() {
    return 'Chat(id: $id, receiverID: $receiverID, senderID: $senderID, receiver: $receiver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiverID, receiverID) ||
                other.receiverID == receiverID) &&
            (identical(other.senderID, senderID) ||
                other.senderID == senderID) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, receiverID, senderID, receiver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {final String? id,
      final String? receiverID,
      final String? senderID,
      final Users? receiver}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String? get id;
  @override
  String? get receiverID;
  @override
  String? get senderID;
  @override
  Users? get receiver;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}
