class QuestionModel {
  String? id;
  String? createdOn;
  String? lastModifiedOn;
  String? questionTitle;
  String? optionFirst;
  String? optionSecond;
  String? optionThird;
  String? optionFirth;
  String? hasSubquestion;
  List<dynamic>? subQuestion;

  QuestionModel({
    this.id,
    this.createdOn,
    this.lastModifiedOn,
    this.questionTitle,
    this.optionFirst,
    this.optionSecond,
    this.optionThird,
    this.optionFirth,
    this.hasSubquestion,
    this.subQuestion,
  });
  QuestionModel.from(Map<String, dynamic> map)
      : id = map['feedback_question_id'],
        createdOn = map['created_at'],
        lastModifiedOn = map['updated_at'],
        questionTitle = map['feedback_question'],
        optionFirst = map['feedback_option_1'],
        optionSecond = map['feedback_option_2'],
        optionThird = map['feedback_option_3'],
        optionFirth = map['feedback_option_4'],
        hasSubquestion = map['has_subquestion'],
        subQuestion = map['subquestions'];

  Map<String, Object?> toMap() {
    return {
      'feedback_question_id': id,
      'created_at': createdOn,
      'updated_at': lastModifiedOn,
      'feedback_question': questionTitle,
      'feedback_option_1': optionFirst,
      'feedback_option_2': optionSecond,
      'feedback_option_3': optionThird,
      'feedback_option_4': optionFirth,
      'has_subquestion': hasSubquestion,
      'subquestions': subQuestion
    };
  }
}
