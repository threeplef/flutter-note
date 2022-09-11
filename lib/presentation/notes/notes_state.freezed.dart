// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotesState _$NotesStateFromJson(Map<String, dynamic> json) {
  return _NotesState.fromJson(json);
}

/// @nodoc
mixin _$NotesState {
  List<Note> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesStateCopyWith<NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res>;
  $Res call({List<Note> notes});
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res> implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  final NotesState _value;
  // ignore: unused_field
  final $Res Function(NotesState) _then;

  @override
  $Res call({
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc
abstract class _$$_NotesStateCopyWith<$Res>
    implements $NotesStateCopyWith<$Res> {
  factory _$$_NotesStateCopyWith(
          _$_NotesState value, $Res Function(_$_NotesState) then) =
      __$$_NotesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Note> notes});
}

/// @nodoc
class __$$_NotesStateCopyWithImpl<$Res> extends _$NotesStateCopyWithImpl<$Res>
    implements _$$_NotesStateCopyWith<$Res> {
  __$$_NotesStateCopyWithImpl(
      _$_NotesState _value, $Res Function(_$_NotesState) _then)
      : super(_value, (v) => _then(v as _$_NotesState));

  @override
  _$_NotesState get _value => super._value as _$_NotesState;

  @override
  $Res call({
    Object? notes = freezed,
  }) {
    return _then(_$_NotesState(
      notes: notes == freezed
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotesState implements _NotesState {
  const _$_NotesState({required final List<Note> notes}) : _notes = notes;

  factory _$_NotesState.fromJson(Map<String, dynamic> json) =>
      _$$_NotesStateFromJson(json);

  final List<Note> _notes;
  @override
  List<Note> get notes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NotesState(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotesState &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  _$$_NotesStateCopyWith<_$_NotesState> get copyWith =>
      __$$_NotesStateCopyWithImpl<_$_NotesState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotesStateToJson(
      this,
    );
  }
}

abstract class _NotesState implements NotesState {
  const factory _NotesState({required final List<Note> notes}) = _$_NotesState;

  factory _NotesState.fromJson(Map<String, dynamic> json) =
      _$_NotesState.fromJson;

  @override
  List<Note> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_NotesStateCopyWith<_$_NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}
