import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  final dynamic onlineExamMark;
  const LineChart({super.key, this.onlineExamMark});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<dynamic> examMarks = [];
  List<dynamic> examOnSub = [];
  List<OnlineExamMarks> data = [];
  @override
  void initState() {
    super.initState();
    examMarks = widget.onlineExamMark['marks'];
    examOnSub = widget.onlineExamMark['exam_array'];

    initial();
  }

  initial() {
    List<OnlineExamMarks> initializingDataList = [];
    if (examMarks.isNotEmpty) {}
    for (var i = 0; i < examMarks.length; i++) {
      initializingDataList.add(
          OnlineExamMarks(examOnSub[i], double.parse(examMarks[i].toString())));

      print("$i) ${examOnSub[i]} ${examMarks[i]}");
    }
    setState(() {
      data = initializingDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(data.length);
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              color: Colors.white,
              width: 500,
              height: 300,
              child: SfCartesianChart(
                //     onMarkerRender: (markerArgs) {
                //   return markerArgs.;
                // },
                margin: EdgeInsets.all(10),

                  plotAreaBorderWidth: 4,
                  primaryXAxis: const CategoryAxis(
                    isVisible: false, arrangeByIndex: true,
                    axisLine: AxisLine(
                      width: 2,
                    ),
                    majorGridLines: MajorGridLines(width: 1),
                    majorTickLines: MajorTickLines(width: 1),
                    // labelStyle: TextStyle(fontSize: 16, color: color),
                  ),
                  //
                  primaryYAxis: const NumericAxis(
                    isVisible: true,
                    minimum: 0,
                    maximum: 110, interval: 20,
                    // opposedPosition: true,
                  ),

                  // ok
                  tooltipBehavior: TooltipBehavior(
                      builder:
                          (data, point, series, pointIndex, seriesIndex) {
                        return SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  data.examName.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  "${data.mark} %",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                // Text(
                                //   NumberFormat.simpleCurrency(
                                //       locale: 'hi-In')
                                //       .format(data.y),
                                //   style: const TextStyle(
                                //       fontSize: 16, color: Colors.white),
                                // )
                              ],
                            ),
                          ),
                        );
                      },
                      textStyle: const TextStyle(fontSize: 16),
                      enable: true),
                  series: <CartesianSeries<OnlineExamMarks, String>>[
                    LineSeries<OnlineExamMarks, String>(
                      markerSettings:MarkerSettings(
                          isVisible: true,borderColor: Colors.orange,
                          color: Colors.orange) ,
                      emptyPointSettings: const EmptyPointSettings(
                          borderWidth: 40, color: Colors.black),
                      width: 3, isVisibleInLegend: true,
                      initialIsVisible: true,

                      // dataLabelSettings: DataLabelSettings(
                      //     builder: (data, point, series, pointIndex,
                      //         seriesIndex) {
                      //
                      //       return Text(
                      //       //   NumberFormat.simpleCurrency(locale: 'hi-In')
                      //       //       .format(data.y),
                      //         data.examName,
                      //         style: TextStyle(fontSize: 12),
                      //       );
                      //     },
                      //     isVisible: true,
                      //     useSeriesColor: true,
                      //     labelIntersectAction: LabelIntersectAction.none,overflowMode: OverflowMode.none,
                      //     textStyle: const TextStyle(fontSize: 16)),

                      dataSource: data,
                      xValueMapper: (OnlineExamMarks data, _) {
                        // return '';
                        return data.examName;
                      },
                      yValueMapper: (OnlineExamMarks data, _) {
                        return data.mark;
                      },
                      // trackPadding: 4,
                      // borderRadius: const BorderRadius.vertical(
                      //     top: Radius.circular(5)),
                      name: 'Subject',
                      // pointColorMapper: (OnlineExamMarks data, _) {
                      //   return data.color;
                      // },
                    )
                  ]),
            ),
          ],
        ),
      );


  }
}

class OnlineExamMarks {
  OnlineExamMarks(
    this.examName,
    this.mark,
  );
  final String examName;
  final double mark;
}
