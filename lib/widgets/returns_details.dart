import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund/bloc/mutual_fund_returns_bloc/mutual_fund_returns_cubit.dart';
import 'package:mutual_fund/model_class/mutual_fund_returns_model.dart';
import 'package:mutual_fund/utils/app_enums.dart';
import 'package:mutual_fund/utils/num_utils.dart';
import 'package:mutual_fund/widgets/horizontal_line_widget.dart';
import 'package:mutual_fund/widgets/tab_widget.dart';


class ReturnsDetails extends StatelessWidget {
  final List<ReturnData>? returnData;

  const ReturnsDetails({super.key, this.returnData});

  @override
  Widget build(BuildContext context) {
    MutualFundReturnsCubit bloc = context.read<MutualFundReturnsCubit>();
    List<String> years = ["2020", "2021", "2022", "2023", "2024", "2025"];

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: bloc.isNav ?
                  Row(
                    children: [
                      HorizontalLineWidget(color: Colors.white),
                      Text(
                        "NAV - 23.6%(104.2)",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ) :
                  Column(
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
                onPressed: (){
                  bloc.isNav = !bloc.isNav;
                  bloc.getReturns(ReturnType.threeMonth);
                },
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
                  style: TextStyle(color: bloc.isNav ? Colors.white : Colors.grey), // Grey text
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        try {
                          return Text(
                            years[int.parse(meta.formattedValue)],
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          );
                        } catch (e) {
                          return Container();
                        }
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (color) {
                      return Colors.transparent;
                    },
                    tooltipBorder: BorderSide(color: Colors.blue, width: 1),
                    tooltipRoundedRadius: 6,
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return [touchedBarSpots.map((LineBarSpot spot) {
                        String tooltipText = '';
                        tooltipText = "${returnData![spot.barIndex].date}\n"
                            "Your Investment ${NumUtils.formatAmount(spot.x)}"
                            "\n"
                            "Nifty Midcap ${NumUtils.formatAmount(spot.y)}";

                        return LineTooltipItem(
                          tooltipText,
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.start
                        );
                      }).first, null];
                    },
                  ),
                  handleBuiltInTouches: true,
                ),
                lineBarsData: [
                  if(!bloc.isNav)
                    getLineBarData(returnData, "return"),
                  if(!bloc.isNav)
                    getLineBarData(returnData, "invest"),
                  if(bloc.isNav)
                    getLineBarData(returnData, "nav"),
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

  LineChartBarData getLineBarData(List<ReturnData>? returnData, String type) {
    List<FlSpot> flSpot = [];
    for(var data in returnData!) {
      if(type == "return") {
        flSpot.add(FlSpot(data.id!.toDouble(), data.returnPercentage!));
      } else if(type == "invest") {
        flSpot.add(FlSpot(data.id!.toDouble(), data.myInvestPercentage!));
      } else {
        flSpot.add(FlSpot(data.id!.toDouble(), data.navReturns!));
      }
    }
    return LineChartBarData(
      spots: flSpot,
      isCurved: true,
      color: type == "return" ? Colors.blue : type == "invest" ? Colors.orange : Colors.white,
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
