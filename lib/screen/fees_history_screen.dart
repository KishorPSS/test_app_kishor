import 'package:eschoolapp/global_helper.dart';
import 'package:eschoolapp/screen/payment_receipt.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import '../models/payment_history_model.dart';
import '../widget_helper/widgets_helper.dart';
import 'package:eschoolapp/widget_helper/constants.dart' as constant;

class FeesHistoryScreen extends StatefulWidget {
  final String studentId;
  final String currentYear;
  final Map<String, dynamic> studentMap;

  const FeesHistoryScreen(
      {super.key,
      required this.studentId,
      required this.currentYear,
      required this.studentMap});

  @override
  State<FeesHistoryScreen> createState() => _FeesHistoryScreenState();
}

class _FeesHistoryScreenState extends State<FeesHistoryScreen> {
  List<PaymentHistoryModel> paymentHistoryModel=[];
  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    paymentHistoryModel =
        (await GlobalHelper().feePaid(widget.studentId, widget.currentYear))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: MyAppBar(
              leading: MyTextButton(
                myWidget: const Icon(Icons.arrow_back_ios, color: Colors.white),
                callback: () {
                  Navigator.pop(context);
                },
              ),
              title: "Payment History",
              containerHeight: 160,
              between: Positioned(
                bottom: -20,
                left: 25,
                right: 25,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  child: Center(
                      child: Text(
                    'Academic Year ${widget.currentYear.substring(0, 4)}-${widget.currentYear.substring(4, 6)}',
                    style: const TextStyle(fontSize: 18),
                  )),
                ),
              ),
            )),
        body: paymentHistoryModel.isEmpty
            ? const Center(child:
        Column(
          children: [
            Text('Fees Not Paid Yet!'),
          ],
        )
        )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: paymentHistoryModel.length,
                itemBuilder: (context, index) {
                  var payHistory = paymentHistoryModel[index];
                  return SizedBox(
                    height: 180,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 27),
                              child: Column(
                                children: [
                                  const Gap(34),
                                  Expanded(
                                    child: MyTextMedium(
                                        maxLines: 2,
                                        title: constant.dateToDate2(
                                            payHistory.createDate.toString())),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Row(
                            children: [
                              const Gap(25),
                              SizedBox(
                                width: 32,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: VerticalDivider(
                                          color: HexColor('#ABADAE'),
                                          thickness: 3),
                                    ),
                                    const Positioned(
                                      top: 36,
                                      child: Icon(Icons.brightness_1,
                                          color: Colors.green, size: 35),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTextSmall(
                                        color: HexColor('#7B7B7B'),
                                        title:
                                            "Receipt No: ${payHistory.receiptNo}"),
                                    const Gap(7),
                                    MyTextBig(
                                      title:
                                          "${payHistory.totalFeesPaid.toString()}/-",
                                    ),
                                    const Gap(10),
                                    MyTextButton(
                                        callback: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentReceipt(
                                                        paymentHistoryModel:
                                                            payHistory,
                                                        studentMap:
                                                            widget.studentMap),
                                              ));
                                        },
                                        bgColor: Colors.blue,
                                        myWidget: const MyTextSmall(
                                          title: "View Receipt",
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
