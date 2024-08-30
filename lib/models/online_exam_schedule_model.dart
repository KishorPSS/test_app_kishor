class ExamScheduleModel {
  String examName;
  String examDescription;
  String startDateTime;
  String endDateTime;
  String examTime;
  String createdAt;
  dynamic updatedAt;
  String addedBy;
  String? updatedBy;
  String classId;
  String divisionId;
  String examInstructions;
  String noOfQuestions;
  String staffId;

  ExamScheduleModel(
    this.examName,
    this.examDescription,
    this.startDateTime,
    this.endDateTime,
    this.examTime,
    this.createdAt,
    this.updatedAt,
    this.addedBy,
    this.updatedBy,
    this.classId,
    this.divisionId,
    this.examInstructions,
    this.noOfQuestions,
    this.staffId,
  );
  ExamScheduleModel.formMap(Map<String, dynamic> map)
      : examName = map['exam_name'],
        examDescription = map['exam_description'],
        startDateTime = map['exam_start_date'],
        endDateTime = map['exam_end_date'],
        examTime = map['exam_time'],
        createdAt = map['created_date'],
        updatedAt = map['updated_date'],
        addedBy = map['added_by'],
        updatedBy = map['updated_by'],
        classId = map['class_id'],
        divisionId = map['division_id'],
        examInstructions = map['exam_instructions'],
        noOfQuestions = map['no_of_questions'],
        staffId = map['staff_id'];

  Map<String, Object?> toMap() {
    return {
      'exam_name': examName,
      'exam_description': examDescription,
      'exam_start_date': startDateTime,
      'exam_end_date': endDateTime,
      'exam_time': examTime,
      'created_date': createdAt,
      'updated_date': updatedAt,
      'added_by': addedBy,
      'updated_by': updatedBy,
      'class_id': classId,
      'division_id': divisionId,
      'exam_instructions': examInstructions,
      'no_of_questions': noOfQuestions,
      'staff_id': staffId,
    };
  }
}
