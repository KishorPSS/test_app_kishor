class PaymentHistoryModel {
  String? receiptNo;
  String? receiptDate;
  String? studentId;
  String? totalFeesPaid;
  String? tuitionFees;
  String? admissionFees;
  String? numTerm1Fee;
  String? numTerm2Fee;
  String? feeMasterId;
  String? examFee;
  String? txtYear;
  String? schoolCode;
  String? onlinePayment;
  String? installment;
  String? paymentTrackingCode;
  String? createDate;
  PaymentHistoryModel(
      {this.receiptNo,
      this.receiptDate,
      this.studentId,
      this.tuitionFees,
      this.feeMasterId,
      this.totalFeesPaid,
      this.examFee,
      this.txtYear,
      this.schoolCode,
      this.onlinePayment,
      this.installment,
      this.paymentTrackingCode,
      this.createDate,
      this.admissionFees,
      this.numTerm1Fee,
      this.numTerm2Fee});
  PaymentHistoryModel.formMap(Map<String, dynamic> map)
      : numTerm2Fee = map['numTerm2Fee'],
        numTerm1Fee = map['numTerm1Fee'],
        receiptNo = map['numRecpNo'],
        admissionFees = map['numAdmnFee'],
        receiptDate = map['dtRecpDate'],
        studentId = map['numStudentID'],
        tuitionFees = map['numTutionFees'],
        feeMasterId = map['fee_master_id'],
        totalFeesPaid = map['numTotalFeesPaid'],
        examFee = map['numExamFee'],
        txtYear = map['txtYear'],
        schoolCode = map['numSchoolCode'],
        onlinePayment = map['online_payment'],
        installment = map['installment'],
        paymentTrackingCode = map['payment_tracking_code'],
        createDate = map['created_date'];
  Map<String, Object?> toMap() {
    return {
      'numTerm2Fee': numTerm2Fee,
      'numTerm1Fee': numTerm1Fee,
      'numAdmnFee': admissionFees,
      'numRecpNo': receiptNo,
      'dtRecpDate': receiptDate,
      'numStudentID': studentId,
      'numTutionFees': tuitionFees,
      'fee_master_id': feeMasterId,
      'numTotalFeesPaid': totalFeesPaid,
      'numExamFee': examFee,
      'txtYear': txtYear,
      'numSchoolCode': schoolCode,
      'online_payment': onlinePayment,
      'installment': installment,
      'payment_tracking_code': paymentTrackingCode,
      'created_date': createDate,
    };
  }
}
