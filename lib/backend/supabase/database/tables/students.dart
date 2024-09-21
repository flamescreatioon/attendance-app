import '../database.dart';

class StudentsTable extends SupabaseTable<StudentsRow> {
  @override
  String get tableName => 'students';

  @override
  StudentsRow createRow(Map<String, dynamic> data) => StudentsRow(data);
}

class StudentsRow extends SupabaseDataRow {
  StudentsRow(super.data);

  @override
  SupabaseTable get table => StudentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get department => getField<String>('department');
  set department(String? value) => setField<String>('department', value);

  int? get yearOfStudy => getField<int>('year of study');
  set yearOfStudy(int? value) => setField<int>('year of study', value);

  DateTime? get enrollmentDate => getField<DateTime>('enrollment date');
  set enrollmentDate(DateTime? value) =>
      setField<DateTime>('enrollment date', value);
}
