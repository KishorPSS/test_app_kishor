class AnnouncementModel {
  final String? annId;
  final String? annTitle;
  final String? annDescription;
  final String? annDate;
  final String? flag;
  AnnouncementModel({
    this.annId,
    this.annTitle,
    this.annDescription,
    this.annDate,
    this.flag,
  });
  AnnouncementModel.from(Map<String, dynamic> map)
      : annId = map['announcement_id'],
        annTitle = map['announcement_name'],
        annDescription = map['announcement_description'],
        annDate = map['date'],
        flag = map['is_notification'];
  Map<String, Object?> toMap() {
    return {
      'announcement_id': annId,
      'announcement_name': annTitle,
      'announcement_description': annDescription,
      'date': annDate,
      'is_notification': flag
    };
  }
}
