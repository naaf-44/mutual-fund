import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mutual_fund/model_class/mutual_fund_calculation_model.dart';
import 'package:mutual_fund/utils/num_utils.dart';

class MutualFundBarWidget extends StatelessWidget {
  final MutualFundCalculationModel? model;
  const MutualFundBarWidget({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (color) {
                return Colors.transparent;
              },
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  NumUtils.formatAmount(rod.toY),
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              },
              tooltipMargin: 0
            ),
            handleBuiltInTouches: false,
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text('Saving A/C', style: TextStyle(color: Colors.white, fontSize: 10),);
                    case 1:
                      return Text('Category Avg', style: TextStyle(color: Colors.white, fontSize: 10));
                    case 2:
                      return Text('Direct Plan', style: TextStyle(color: Colors.white, fontSize: 10));
                    default:
                      return Text('');
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: [
            for(int i = 0; i < model!.graphData!.length; i++)
              BarChartGroupData(
                x: i,
                groupVertically: true,
                showingTooltipIndicators: [0],
                barRods: [
                  BarChartRodData(toY: model!.graphData![i].val1!.toDouble(), color: Colors.green, width: 50, borderRadius: BorderRadius.circular(0)),
                  BarChartRodData(toY: model!.graphData![i].val2!.toDouble(), color: Colors.grey, width: 50,  borderRadius: BorderRadius.circular(0)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
