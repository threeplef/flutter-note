// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_edit_note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEditNoteState<T> {
  Note? get note => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddEditNoteStateCopyWith<T, AddEditNoteState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditNoteStateCopyWith<T, $Res> {
  factory $AddEditNoteStateCopyWith(
          AddEditNoteState<T> value, $Res Function(AddEditNoteState<T>) then) =
      _$AddEditNoteStateCopyWithImpl<T, $Res>;
  $Res call({Note? note, int color});

  $NoteCopyWith<$Res>? get note;
}

/// @nodoc
class _$AddEditNoteStateCopyWithImpl<T, $Res>
    implements $AddEditNoteStateCopyWith<T, $Res> {
  _$AddEditNoteStateCopyWithImpl(this._value, this._then);

  final AddEditNoteState<T> _value;
  // ignore: unused_field
  final $Res Function(AddEditNoteState<T>) _then;

  @override
  $Res call({
    Object? note = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $NoteCopyWith<$Res>? get note {
    if (_value.note == null) {
      return null;
    }

    return $NoteCopyWith<$Res>(_value.note!, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc
abstract class _$$_AddEditNoteStateCopyWith<T, $Res>
    implements $AddEditNoteStateCopyWith<T, $Res> {
  factory _$$_AddEditNoteStateCopyWith(_$_AddEditNoteState<T> value,
          $Res Function(_$_AddEditNoteState<T>) then) =
      __$$_AddEditNoteStateCopyWithImpl<T, $Res>;
  @override
  $Res call({Note? note, int color});

  @override
  $NoteCopyWith<$Res>? get note;
}

/// @nodoc
class __$$_AddEditNoteStateCopyWithImpl<T, $Res>
    extends _$AddEditNoteStateCopyWithImpl<T, $Res>
    implements _$$_AddEditNoteStateCopyWith<T, $Res> {
  __$$_AddEditNoteStateCopyWithImpl(_$_AddEditNoteState<T> _value,
      $Res Function(_$_AddEditNoteState<T>) _then)
      : super(_value, (v) => _then(v as _$_AddEditNoteState<T>));

  @override
  _$_AddEditNoteState<T> get _value => super._value as _$_AddEditNoteState<T>;

  @override
  $Res call({
    Object? note = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_AddEditNoteState<T>(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AddEditNoteState<T> implements _AddEditNoteState<T> {
  const _$_AddEditNoteState({this.note, required this.color});

  @override
  final Note? note;
  @override
  final int color;

  @override
  String toString() {
    return 'AddEditNoteState<$T>(note: $note, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddEditNoteState<T> &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$_AddEditNoteStateCopyWith<T, _$_AddEditNoteState<T>> get copyWith =>
      __$$_AddEditNoteStateCopyWithImpl<T, _$_AddEditNoteState<T>>(
          this, _$identity);
}

abstract class _AddEditNoteState<T> implements AddEditNoteState<T> {
  const factory _AddEditNoteState(
      {final Note? note, required final int color}) = _$_AddEditNoteState<T>;

  @override
  Note? get note;
  @override
  int get color;
  @override
  @JsonKey(ignore: true)
  _$$_AddEditNoteStateCopyWith<T, _$_AddEditNoteState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
