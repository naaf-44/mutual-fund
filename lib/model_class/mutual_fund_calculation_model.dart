class MutualFundCalculationModel {
  final int? min;
  final int? max;
  final int? invested;
  final int? savingAc;
  final int? catAvg;
  final int? directPlan;
  final int? postReturn;
  final int? profit;
  final List<GraphData>? graphData;

  MutualFundCalculationModel({
    this.min,
    this.max,
    this.invested,
    this.savingAc,
    this.catAvg,
    this.directPlan,
    this.postReturn,
    this.profit,
    this.graphData,
  });
}

class GraphData {
  final int? val1;
  final int? val2;

  GraphData({this.val1, this.val2});
}
