// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  DataStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<Chat>? get chatList => throw _privateConstructorUsedError;
  Users? get currentUser => throw _privateConstructorUsedError;
  Users? get reveiver => throw _privateConstructorUsedError;
  List<Message>? get lisMessage => throw _privateConstructorUsedError;
  String? get senderID => throw _privateConstructorUsedError;
  String? get receiverID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {DataStatus status,
      String? error,
      List<Chat>? chatList,
      Users? currentUser,
      Users? reveiver,
      List<Message>? lisMessage,
      String? senderID,
      String? receiverID});

  $UsersCopyWith<$Res>? get currentUser;
  $UsersCopyWith<$Res>? get reveiver;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? chatList = freezed,
    Object? currentUser = freezed,
    Object? reveiver = freezed,
    Object? lisMessage = freezed,
    Object? senderID = freezed,
    Object? receiverID = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      chatList: freezed == chatList
          ? _value.chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<Chat>?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Users?,
      reveiver: freezed == reveiver
          ? _value.reveiver
          : reveiver // ignore: cast_nullable_to_non_nullable
              as Users?,
      lisMessage: freezed == lisMessage
          ? _value.lisMessage
          : lisMessage // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      senderID: freezed == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverID: freezed == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get reveiver {
    if (_value.reveiver == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.reveiver!, (value) {
      return _then(_value.copyWith(reveiver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStatus status,
      String? error,
      List<Chat>? chatList,
      Users? currentUser,
      Users? reveiver,
      List<Message>? lisMessage,
      String? senderID,
      String? receiverID});

  @override
  $UsersCopyWith<$Res>? get currentUser;
  @override
  $UsersCopyWith<$Res>? get reveiver;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? chatList = freezed,
    Object? currentUser = freezed,
    Object? reveiver = freezed,
    Object? lisMessage = freezed,
    Object? senderID = freezed,
    Object? receiverID = freezed,
  }) {
    return _then(_$_Initial(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      chatList: freezed == chatList
          ? _value._chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<Chat>?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Users?,
      reveiver: freezed == reveiver
          ? _value.reveiver
          : reveiver // ignore: cast_nullable_to_non_nullable
              as Users?,
      lisMessage: freezed == lisMessage
          ? _value._lisMessage
          : lisMessage // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      senderID: freezed == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverID: freezed == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.status = DataStatus.initial,
      this.error,
      final List<Chat>? chatList,
      this.currentUser,
      this.reveiver,
      final List<Message>? lisMessage,
      this.senderID,
      this.receiverID})
      : _chatList = chatList,
        _lisMessage = lisMessage;

  @override
  @JsonKey()
  final DataStatus status;
  @override
  final String? error;
  final List<Chat>? _chatList;
  @override
  List<Chat>? get chatList {
    final value = _chatList;
    if (value == null) return null;
    if (_chatList is EqualUnmodifiableListView) return _chatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Users? currentUser;
  @override
  final Users? reveiver;
  final List<Message>? _lisMessage;
  @override
  List<Message>? get lisMessage {
    final value = _lisMessage;
    if (value == null) return null;
    if (_lisMessage is EqualUnmodifiableListView) return _lisMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? senderID;
  @override
  final String? receiverID;

  @override
  String toString() {
    return 'ChatState(status: $status, error: $error, chatList: $chatList, currentUser: $currentUser, reveiver: $reveiver, lisMessage: $lisMessage, senderID: $senderID, receiverID: $receiverID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._chatList, _chatList) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.reveiver, reveiver) ||
                other.reveiver == reveiver) &&
            const DeepCollectionEquality()
                .equals(other._lisMessage, _lisMessage) &&
            (identical(other.senderID, senderID) ||
                other.senderID == senderID) &&
            (identical(other.receiverID, receiverID) ||
                other.receiverID == receiverID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      const DeepCollectionEquality().hash(_chatList),
      currentUser,
      reveiver,
      const DeepCollectionEquality().hash(_lisMessage),
      senderID,
      receiverID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements ChatState {
  const factory _Initial(
      {final DataStatus status,
      final String? error,
      final List<Chat>? chatList,
      final Users? currentUser,
      final Users? reveiver,
      final List<Message>? lisMessage,
      final String? senderID,
      final String? receiverID}) = _$_Initial;

  @override
  DataStatus get status;
  @override
  String? get error;
  @override
  List<Chat>? get chatList;
  @override
  Users? get currentUser;
  @override
  Users? get reveiver;
  @override
  List<Message>? get lisMessage;
  @override
  String? get senderID;
  @override
  String? get receiverID;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
