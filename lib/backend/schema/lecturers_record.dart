import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LecturersRecord extends FirestoreRecord {
  LecturersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "lecturer_id" field.
  String? _lecturerId;
  String get lecturerId => _lecturerId ?? '';
  bool hasLecturerId() => _lecturerId != null;

  // "lecturer_name" field.
  String? _lecturerName;
  String get lecturerName => _lecturerName ?? '';
  bool hasLecturerName() => _lecturerName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "course_taught" field.
  List<String>? _courseTaught;
  List<String> get courseTaught => _courseTaught ?? const [];
  bool hasCourseTaught() => _courseTaught != null;

  void _initializeFields() {
    _lecturerId = snapshotData['lecturer_id'] as String?;
    _lecturerName = snapshotData['lecturer_name'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _department = snapshotData['department'] as String?;
    _courseTaught = getDataList(snapshotData['course_taught']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lecturers');

  static Stream<LecturersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LecturersRecord.fromSnapshot(s));

  static Future<LecturersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LecturersRecord.fromSnapshot(s));

  static LecturersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LecturersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LecturersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LecturersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LecturersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LecturersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLecturersRecordData({
  String? lecturerId,
  String? lecturerName,
  String? email,
  String? phoneNumber,
  String? department,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lecturer_id': lecturerId,
      'lecturer_name': lecturerName,
      'email': email,
      'phone_number': phoneNumber,
      'department': department,
    }.withoutNulls,
  );

  return firestoreData;
}

class LecturersRecordDocumentEquality implements Equality<LecturersRecord> {
  const LecturersRecordDocumentEquality();

  @override
  bool equals(LecturersRecord? e1, LecturersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lecturerId == e2?.lecturerId &&
        e1?.lecturerName == e2?.lecturerName &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.department == e2?.department &&
        listEquality.equals(e1?.courseTaught, e2?.courseTaught);
  }

  @override
  int hash(LecturersRecord? e) => const ListEquality().hash([
        e?.lecturerId,
        e?.lecturerName,
        e?.email,
        e?.phoneNumber,
        e?.department,
        e?.courseTaught
      ]);

  @override
  bool isValidKey(Object? o) => o is LecturersRecord;
}
