import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentsRecord extends FirestoreRecord {
  StudentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "student_id" field.
  String? _studentId;
  String get studentId => _studentId ?? '';
  bool hasStudentId() => _studentId != null;

  // "student_name" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  bool hasStudentName() => _studentName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "course_enrolled" field.
  List<String>? _courseEnrolled;
  List<String> get courseEnrolled => _courseEnrolled ?? const [];
  bool hasCourseEnrolled() => _courseEnrolled != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _studentId = snapshotData['student_id'] as String?;
    _studentName = snapshotData['student_name'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _courseEnrolled = getDataList(snapshotData['course_enrolled']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('students');

  static Stream<StudentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentsRecord.fromSnapshot(s));

  static Future<StudentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentsRecord.fromSnapshot(s));

  static StudentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentsRecordData({
  String? studentId,
  String? studentName,
  String? email,
  String? phoneNumber,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student_id': studentId,
      'student_name': studentName,
      'email': email,
      'phone_number': phoneNumber,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentsRecordDocumentEquality implements Equality<StudentsRecord> {
  const StudentsRecordDocumentEquality();

  @override
  bool equals(StudentsRecord? e1, StudentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.studentId == e2?.studentId &&
        e1?.studentName == e2?.studentName &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.courseEnrolled, e2?.courseEnrolled) &&
        e1?.image == e2?.image;
  }

  @override
  int hash(StudentsRecord? e) => const ListEquality().hash([
        e?.studentId,
        e?.studentName,
        e?.email,
        e?.phoneNumber,
        e?.courseEnrolled,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is StudentsRecord;
}
