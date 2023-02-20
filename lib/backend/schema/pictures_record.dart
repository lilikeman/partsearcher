import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pictures_record.g.dart';

abstract class PicturesRecord
    implements Built<PicturesRecord, PicturesRecordBuilder> {
  static Serializer<PicturesRecord> get serializer =>
      _$picturesRecordSerializer;

  BuiltList<String>? get path;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PicturesRecordBuilder builder) =>
      builder..path = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pictures');

  static Stream<PicturesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PicturesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PicturesRecord._();
  factory PicturesRecord([void Function(PicturesRecordBuilder) updates]) =
      _$PicturesRecord;

  static PicturesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPicturesRecordData() {
  final firestoreData = serializers.toFirestore(
    PicturesRecord.serializer,
    PicturesRecord(
      (p) => p..path = null,
    ),
  );

  return firestoreData;
}
