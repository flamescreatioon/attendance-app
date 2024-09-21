import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "course_id" field.
  List<String>? _courseId;
  List<String> get courseId => _courseId ?? const [];
  bool hasCourseId() => _courseId != null;

  // "student_name" field.
  List<String>? _studentName;
  List<String> get studentName => _studentName ?? const [];
  bool hasStudentName() => _studentName != null;

  // "proof_media" field.
  List<String>? _proofMedia;
  List<String> get proofMedia => _proofMedia ?? const [];
  bool hasProofMedia() => _proofMedia != null;

  // "media" field.
  String? _media;
  String get media => _media ?? '';
  bool hasMedia() => _media != null;

  // "reg_no" field.
  String? _regNo;
  String get regNo => _regNo ?? '';
  bool hasRegNo() => _regNo != null;

  void _initializeFields() {
    _courseId = getDataList(snapshotData['course_id']);
    _studentName = getDataList(snapshotData['student_name']);
    _proofMedia = getDataList(snapshotData['proof_media']);
    _media = snapshotData['media'] as String?;
    _regNo = snapshotData['reg_no'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  String? media,
  String? regNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'media': media,
      'reg_no': regNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.courseId, e2?.courseId) &&
        listEquality.equals(e1?.studentName, e2?.studentName) &&
        listEquality.equals(e1?.proofMedia, e2?.proofMedia) &&
        e1?.media == e2?.media &&
        e1?.regNo == e2?.regNo;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality()
      .hash([e?.courseId, e?.studentName, e?.proofMedia, e?.media, e?.regNo]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
