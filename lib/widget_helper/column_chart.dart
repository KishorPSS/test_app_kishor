import 'dart:developer';

import 'package:eschoolapp/widget_helper/widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  final dynamic onlineExamMarks;
  const ColumnChart({Key? key, this.onlineExamMarks}) : super(key: key);

  @override
  ChartDataState createState() => ChartDataState();
}

class ChartDataState extends State<ColumnChart> {
  List<int> marksData = [];
  List<dynamic> marksList = [];
  List<dynamic> examList = [];
  List<_ChartData> data = [];
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    marksList = widget.onlineExamMarks['marks'];
    examList = widget.onlineExamMarks['exam_array'];
    print(marksList.length);
    print(examList.length);
    _tooltip = TooltipBehavior(
        textStyle: const TextStyle(
          fontSize: 10,overflow:TextOverflow.visible
        ),
        enable: true);
    super.initState();
    initial();
  }

  List<dynamic> series = [
    // 'Science 1',
    // 'P.E.',
    // 'Geometry',
    // 'Algebra',
    // 'Science 2',
    // 'Sanskrit'
  ];
  initial() {
    List<_ChartData> dataNew = [];

    if (marksList.isEmpty) {
      for (var i = 0; i < series.length; i++) {
        dataNew.add(_ChartData(series[i], 0));
        // dataNewList.add(_ChartData(series[i],0));
      }
      setState(() {
        data = dataNew;
      });
    } else {
      // data = [
      //
      //   // _ChartData('Science 1', 55),
      //   // _ChartData('P.E.', 90),
      //   // _ChartData('Geometry', 60),
      //   // _ChartData('Algebra', 80),
      //   // _ChartData('Science 2', 50),
      //   // _ChartData('Sanskrit', 90),
      // ];
      for (var i = 0; i < examList.length; i++) {
        dataNew.add(
            _ChartData(examList[i], double.parse(marksList[i].toString())));
        // dataNewList.add(_ChartData(series[i],0));
      }
      setState(() {
        data = dataNew;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 620,
          height:examList.length==0?240: 2000,
          child: SfCartesianChart(
              isTransposed: true,
              primaryXAxis: const CategoryAxis(
                axisLine: AxisLine(width: 1.5, color: Colors.black),
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                labelStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
              //
              primaryYAxis: const NumericAxis(
                // placeLabelsNearAxisLine: true,
                minimum: 0,
                maximum: 100, isVisible: true,
                interval: 25,
                axisLine: AxisLine(width: 2),
                minorGridLines: MinorGridLines(
                  width: 0,
                ),
                majorTickLines: MajorTickLines(width: 2),
                minorTickLines: MinorTickLines(width: 0),
                // majorGridLines: MajorGridLines(width: 2, color: Colors.black),
                labelStyle: TextStyle(fontSize: 15, color: Colors.black),
                // labelFormat: ,
                // numberFormat: ,
              ),
              tooltipBehavior: _tooltip,
              series: <CartesianSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(enableTooltip: true,
                  dataSource: data, width: 0.5,
        
                  xValueMapper: (_ChartData data, _) {
                    return data.x;
                  },
                  yValueMapper: (_ChartData data, _) {
                    return data.y;
                  },
                  // color: HexColor("#00C2B2"),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(5)),
                )
              ]),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
