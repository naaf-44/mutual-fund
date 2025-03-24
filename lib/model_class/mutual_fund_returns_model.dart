class MutualFundReturnsModel {
  final List<ReturnData>? month;
  final List<ReturnData>? threeMonth;
  final List<ReturnData>? sixMonth;
  final List<ReturnData>? year;
  final List<ReturnData>? threeYears;

  MutualFundReturnsModel({
    this.month,
    this.threeMonth,
    this.sixMonth,
    this.year,
    this.threeYears,
  });

  factory MutualFundReturnsModel.fromJson(Map<String, dynamic> json) {
    return MutualFundReturnsModel(
      month: (json['month'] as List?)?.map((e) => ReturnData.fromJson(e)).toList(),
      threeMonth: (json['threeMonth'] as List?)?.map((e) => ReturnData.fromJson(e)).toList(),
      sixMonth: (json['sixMonth'] as List?)?.map((e) => ReturnData.fromJson(e)).toList(),
      year: (json['year'] as List?)?.map((e) => ReturnData.fromJson(e)).toList(),
      threeYears: (json['threeYears'] as List?)?.map((e) => ReturnData.fromJson(e)).toList(),
    );
  }
}

class ReturnData {
  final int? id;
  final int? year;
  final String? date;
  final double? returnPercentage;
  final int? myInvestment;
  final double? myInvestPercentage;

  ReturnData({
    this.id,
    this.year,
    this.date,
    this.returnPercentage,
    this.myInvestment,
    this.myInvestPercentage,
  });

  factory ReturnData.fromJson(Map<String, dynamic> json) {
    return ReturnData(
      id: json['id'],
      year: json['year'],
      date: json['date'],
      returnPercentage: (json['returnPercentage'] as num?)?.toDouble(),
      myInvestment: json['myInvestment'],
      myInvestPercentage: json['myInvestPercentage'],
    );
  }
}