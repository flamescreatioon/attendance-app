import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepartmentsRecord extends FirestoreRecord {
  DepartmentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "department_id" field.
  String? _departmentId;
  String get departmentId => _departmentId ?? '';
  bool hasDepartmentId() => _departmentId != null;

  // "department_name" field.
  String? _departmentName;
  String get departmentName => _departmentName ?? '';
  bool hasDepartmentName() => _departmentName != null;

  // "course_id" field.
  List<String>? _courseId;
  List<String> get courseId => _courseId ?? const [];
  bool hasCourseId() => _courseId != null;

  // "course_offered" field.
  List<String>? _courseOffered;
  List<String> get courseOffered => _courseOffered ?? const [];
  bool hasCourseOffered() => _courseOffered != null;

  void _initializeFields() {
    _departmentId = snapshotData['department_id'] as String?;
    _departmentName = snapshotData['department_name'] as String?;
    _courseId = getDataList(snapshotData['course_id']);
    _courseOffered = getDataList(snapshotData['course_offered']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('departments');

  static Stream<DepartmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepartmentsRecord.fromSnapshot(s));

  static Future<DepartmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepartmentsRecord.fromSnapshot(s));

  static DepartmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DepartmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepartmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepartmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepartmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepartmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepartmentsRecordData({
  String? departmentId,
  String? departmentName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'department_id': departmentId,
      'department_name': departmentName,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepartmentsRecordDocumentEquality implements Equality<DepartmentsRecord> {
  const DepartmentsRecordDocumentEquality();

  @override
  bool equals(DepartmentsRecord? e1, DepartmentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.departmentId == e2?.departmentId &&
        e1?.departmentName == e2?.departmentName &&
        listEquality.equals(e1?.courseId, e2?.courseId) &&
        listEquality.equals(e1?.courseOffered, e2?.courseOffered);
  }

  @override
  int hash(DepartmentsRecord? e) => const ListEquality().hash(
      [e?.departmentId, e?.departmentName, e?.courseId, e?.courseOffered]);

  @override
  bool isValidKey(Object? o) => o is DepartmentsRecord;
}
