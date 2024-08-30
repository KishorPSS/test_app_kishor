class StudentModel {
  final String? name;
  final String? surname;
  final String? std;
  final String? div;
  final String? rollNo;
  final String? fatherName;
  final String? fatherNumber;
  final String? motherName;
  final String? address;
  final String? gender;
  StudentModel({
    this.name,
    this.surname,
    this.std,
    this.div,
    this.rollNo,
    this.fatherName,
    this.fatherNumber,
    this.motherName,
    this.address,
    this.gender,
  });
  StudentModel.from(Map<String, dynamic> map)
      : name = map['txtStudentName'],
        surname = map['txtSurname'],
        std = map['txtStandard'],
        div = map['txtDivision'],
        rollNo = map['numRollNo'],
        fatherName = map['txtFatherName'],
        fatherNumber = map['txtFMobileNo'],
        motherName = map['txtMotherName'],
        address = map['txtAddress'],
        gender = map['txtGender'];
  Map<String, Object?> toMap() {
    return {
      'txtStudentName': name,
      'txtSurname': surname,
      'txtStandard': std,
      'txtDivision': div,
      'numRollNo': rollNo,
      'txtFatherName': fatherName,
      'txtFMobileNo': fatherNumber,
      'txtMotherName': motherName,
      'txtAddress': address,
      'txtGender': gender,
    };
  }
}
