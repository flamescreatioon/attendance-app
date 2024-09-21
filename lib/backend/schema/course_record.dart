import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseRecord extends FirestoreRecord {
  CourseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "course_id" field.
  String? _courseId;
  String get courseId => _courseId ?? '';
  bool hasCourseId() => _courseId != null;

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "course_code" field.
  String? _courseCode;
  String get courseCode => _courseCode ?? '';
  bool hasCourseCode() => _courseCode != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "enrolled_students" field.
  List<String>? _enrolledStudents;
  List<String> get enrolledStudents => _enrolledStudents ?? const [];
  bool hasEnrolledStudents() => _enrolledStudents != null;

  // "schedule" field.
  List<String>? _schedule;
  List<String> get schedule => _schedule ?? const [];
  bool hasSchedule() => _schedule != null;

  // "lecturer_name" field.
  String? _lecturerName;
  String get lecturerName => _lecturerName ?? '';
  bool hasLecturerName() => _lecturerName != null;

  void _initializeFields() {
    _courseId = snapshotData['course_id'] as String?;
    _courseName = snapshotData['course_name'] as String?;
    _courseCode = snapshotData['course_code'] as String?;
    _image = snapshotData['image'] as String?;
    _enrolledStudents = getDataList(snapshotData['enrolled_students']);
    _schedule = getDataList(snapshotData['schedule']);
    _lecturerName = snapshotData['lecturer_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('course');

  static Stream<CourseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseRecord.fromSnapshot(s));

  static Future<CourseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseRecord.fromSnapshot(s));

  static CourseRecord fromSnapshot(DocumentSnapshot snapshot) => CourseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseRecordData({
  String? courseId,
  String? courseName,
  String? courseCode,
  String? image,
  String? lecturerName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_id': courseId,
      'course_name': courseName,
      'course_code': courseCode,
      'image': image,
      'lecturer_name': lecturerName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseRecordDocumentEquality implements Equality<CourseRecord> {
  const CourseRecordDocumentEquality();

  @override
  bool equals(CourseRecord? e1, CourseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.courseId == e2?.courseId &&
        e1?.courseName == e2?.courseName &&
        e1?.courseCode == e2?.courseCode &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.enrolledStudents, e2?.enrolledStudents) &&
        listEquality.equals(e1?.schedule, e2?.schedule) &&
        e1?.lecturerName == e2?.lecturerName;
  }

  @override
  int hash(CourseRecord? e) => const ListEquality().hash([
        e?.courseId,
        e?.courseName,
        e?.courseCode,
        e?.image,
        e?.enrolledStudents,
        e?.schedule,
        e?.lecturerName
      ]);

  @override
  bool isValidKey(Object? o) => o is CourseRecord;
}
