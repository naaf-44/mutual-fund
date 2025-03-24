import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mutual_fund/model_class/mutual_fund_returns_model.dart';
import 'package:mutual_fund/utils/num_utils.dart';
import 'package:mutual_fund/widgets/horizontal_line_widget.dart';
import 'package:mutual_fund/widgets/tab_widget.dart';


class ReturnsDetails extends StatelessWidget {
  final List<ReturnData>? returnData;

  const ReturnsDetails({super.key, this.returnData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        HorizontalLineWidget(color: Colors.blue),
                        Text(
                          "Your Investments - ${NumUtils.formatAmount(5000)}",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        HorizontalLineWidget(color: Colors.orange),
                        Text(
                          "Nifty Midcap 150 - ${NumUtils.formatAmount(150)}",
                          style: TextStyle(color: Colors.orange, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // No fill color
                  shadowColor: Colors.transparent, // Remove shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(color: Colors.grey), // Grey border
                  ),
                ),
                child: Text(
                  "NAV",
                  style: const TextStyle(color: Colors.grey), // Grey text
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  getLineBarData(returnData),
                  getLineBarData(returnData, isReturn: false),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          TabWidget(),
        ],
      ),
    );
  }

  LineChartBarData getLineBarData(List<ReturnData>? returnData, {bool isReturn = true}) {
    List<FlSpot> flSpot = [];
    for(var data in returnData!) {
      if(isReturn) {
        flSpot.add(FlSpot(data.id!.toDouble(), data.returnPercentage!));
      } else {
        flSpot.add(FlSpot(data.id!.toDouble(), data.myInvestPercentage!));
      }
    }
    return LineChartBarData(
      spots: flSpot,
      isCurved: true,
      color: isReturn ? Colors.blue : Colors.orange,
      barWidth: 1,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            Colors.grey.withAlpha(0),
            Colors.grey.withAlpha(10),
            Colors.grey.withAlpha(20),
            Colors.grey.withAlpha(30),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
