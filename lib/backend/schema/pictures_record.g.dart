// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pictures_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PicturesRecord> _$picturesRecordSerializer =
    new _$PicturesRecordSerializer();

class _$PicturesRecordSerializer
    implements StructuredSerializer<PicturesRecord> {
  @override
  final Iterable<Type> types = const [PicturesRecord, _$PicturesRecord];
  @override
  final String wireName = 'PicturesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PicturesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.path;
    if (value != null) {
      result
        ..add('path')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PicturesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PicturesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'path':
          result.path.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PicturesRecord extends PicturesRecord {
  @override
  final BuiltList<String>? path;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PicturesRecord([void Function(PicturesRecordBuilder)? updates]) =>
      (new PicturesRecordBuilder()..update(updates))._build();

  _$PicturesRecord._({this.path, this.ffRef}) : super._();

  @override
  PicturesRecord rebuild(void Function(PicturesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PicturesRecordBuilder toBuilder() =>
      new PicturesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PicturesRecord &&
        path == other.path &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, path.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PicturesRecord')
          ..add('path', path)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PicturesRecordBuilder
    implements Builder<PicturesRecord, PicturesRecordBuilder> {
  _$PicturesRecord? _$v;

  ListBuilder<String>? _path;
  ListBuilder<String> get path => _$this._path ??= new ListBuilder<String>();
  set path(ListBuilder<String>? path) => _$this._path = path;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PicturesRecordBuilder() {
    PicturesRecord._initializeBuilder(this);
  }

  PicturesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PicturesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PicturesRecord;
  }

  @override
  void update(void Function(PicturesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PicturesRecord build() => _build();

  _$PicturesRecord _build() {
    _$PicturesRecord _$result;
    try {
      _$result =
          _$v ?? new _$PicturesRecord._(path: _path?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'path';
        _path?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PicturesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
