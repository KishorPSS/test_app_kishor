class HomeworkModel {
  final String? homeworkId;
  final String? subjectName;
  final String? createdAt;
  final String? description;
  final String? question;
  final String? dueDate;
  HomeworkModel(
      {this.homeworkId,
      this.subjectName,
      this.description,
      this.createdAt,
      this.question,
      this.dueDate});
  HomeworkModel.from(Map<String, dynamic> map)
      : homeworkId = map['homework_id'],
        subjectName = map['subject_name'],
        createdAt = map['allocation_date'],
        description = map['homework_description'],
        question = map['questions_text'],
        dueDate = map['due_date'];
  Map<String, Object?> toMap() {
    return {
      'homework_id': homeworkId,
      'subject_name': subjectName,
      'homework_description': description,
      'allocation_date': createdAt,
      'questions_text': question,
      'due_date': dueDate
    };
  }
}
