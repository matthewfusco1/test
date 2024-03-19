import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SketchesRecord extends FirestoreRecord {
  SketchesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sketch" field.
  String? _sketch;
  String get sketch => _sketch ?? '';
  bool hasSketch() => _sketch != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "replicatePrompt" field.
  String? _replicatePrompt;
  String get replicatePrompt => _replicatePrompt ?? '';
  bool hasReplicatePrompt() => _replicatePrompt != null;

  // "replicateOutput" field.
  String? _replicateOutput;
  String get replicateOutput => _replicateOutput ?? '';
  bool hasReplicateOutput() => _replicateOutput != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sketch = snapshotData['sketch'] as String?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
    _replicatePrompt = snapshotData['replicatePrompt'] as String?;
    _replicateOutput = snapshotData['replicateOutput'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sketches')
          : FirebaseFirestore.instance.collectionGroup('sketches');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sketches').doc(id);

  static Stream<SketchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SketchesRecord.fromSnapshot(s));

  static Future<SketchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SketchesRecord.fromSnapshot(s));

  static SketchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SketchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SketchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SketchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SketchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SketchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSketchesRecordData({
  String? sketch,
  DateTime? timeCreated,
  String? replicatePrompt,
  String? replicateOutput,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sketch': sketch,
      'timeCreated': timeCreated,
      'replicatePrompt': replicatePrompt,
      'replicateOutput': replicateOutput,
    }.withoutNulls,
  );

  return firestoreData;
}

class SketchesRecordDocumentEquality implements Equality<SketchesRecord> {
  const SketchesRecordDocumentEquality();

  @override
  bool equals(SketchesRecord? e1, SketchesRecord? e2) {
    return e1?.sketch == e2?.sketch &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.replicatePrompt == e2?.replicatePrompt &&
        e1?.replicateOutput == e2?.replicateOutput;
  }

  @override
  int hash(SketchesRecord? e) => const ListEquality().hash(
      [e?.sketch, e?.timeCreated, e?.replicatePrompt, e?.replicateOutput]);

  @override
  bool isValidKey(Object? o) => o is SketchesRecord;
}
