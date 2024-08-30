import 'package:eschoolapp/models/payment_history_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentReceipt extends StatefulWidget {
  final PaymentHistoryModel paymentHistoryModel;
  final Map<String, dynamic> studentMap;

  const PaymentReceipt(
      {super.key, required this.paymentHistoryModel, required this.studentMap});

  @override
  State<PaymentReceipt> createState() => _PaymentReceiptState();
}

class _PaymentReceiptState extends State<PaymentReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Receipt"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                'assets/logo1.png',
                height: 90,
              ),
              const Gap(10),
              const Expanded(
                child: Text('Gurukul Internation School',
                  style: TextStyle(fontSize: 22)),
              ),
            ],
          ),
          const Divider(),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Fees Receipt No.: ${widget.paymentHistoryModel.receiptNo}'),
                      Text('Roll No.: ${widget.studentMap['numRollNo']}'),
                      Text(
                        'Name: ${widget.studentMap['txtStudentName']} ${widget.studentMap['txtFatherName']} ${widget.studentMap['txtSurname']}',
                      ),
                      Text('Class: ${widget.studentMap['txtStandard']}'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Date: ${widget.paymentHistoryModel.receiptDate.toString().substring(0, 10)}'),
                      Text(
                          'Student ID: ${widget.paymentHistoryModel.studentId}'),
                      Text('Div: ${widget.studentMap['txtDivision']}'),
                      Text(
                          'Academic Year: ${widget.paymentHistoryModel.txtYear}'),
                    ],
                  ),
                )
              ]),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fees Head'),
              Text('Amount'),
            ],
          ),
          const Divider(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Admission Fees'),
                      const Text('Tuition Fees'),
                      (widget.paymentHistoryModel.numTerm1Fee != null &&
                              widget.paymentHistoryModel.numTerm1Fee != '0')
                          ? const Text('Term 1 Fees')
                          : Container(),
                      (widget.paymentHistoryModel.numTerm2Fee != null &&
                              widget.paymentHistoryModel.numTerm2Fee != '0')
                          ? const Text('Term 2 Fees')
                          : Container(),
                      const Text('Exam Fees'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.paymentHistoryModel.admissionFees
                          .toString()),
                      Text(widget.paymentHistoryModel.tuitionFees
                          .toString()),
                      (widget.paymentHistoryModel.numTerm1Fee != null &&
                              widget.paymentHistoryModel.numTerm1Fee != '0')
                          ? Text(widget.paymentHistoryModel.numTerm1Fee
                              .toString())
                          : Container(),
                      (widget.paymentHistoryModel.numTerm2Fee != null &&
                              widget.paymentHistoryModel.numTerm2Fee != '0')
                          ? Text(widget.paymentHistoryModel.numTerm2Fee
                              .toString())
                          : Container(),
                      Text(widget.paymentHistoryModel.examFee.toString()),
                    ],
                  ),
                )
              ]),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Paid'),
              Text(widget.paymentHistoryModel.totalFeesPaid.toString()),
            ],
          ),
          const Divider(),
        ]),
      ),
    );
  }
}


