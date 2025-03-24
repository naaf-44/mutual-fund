class MutualFundListModel {
  int? id;
  String? fundName;
  String? growth;
  double? nav;
  double? returns;
  double? returnPercentage;
  int? investedAmount;
  double? currentValue;
  double? totalGain;
  double? totalGainPercentage;
  int? yourInvestment;
  double? niftyMidcap;

  MutualFundListModel({
    this.id,
    this.fundName,
    this.growth,
    this.nav,
    this.returns,
    this.returnPercentage,
    this.investedAmount,
    this.currentValue,
    this.totalGain,
    this.totalGainPercentage,
    this.yourInvestment,
    this.niftyMidcap,
  });

  factory MutualFundListModel.fromJson(Map<String, dynamic> json) {
    return MutualFundListModel(
      id: json['id'],
      fundName: json['fundName'],
      growth: json['growth'],
      nav: (json['nav'] as num?)?.toDouble(),
      returns: (json['returns'] as num?)?.toDouble(),
      returnPercentage: (json['returnPercentage'] as num?)?.toDouble(),
      investedAmount: json['investedAmount'] as int?,
      currentValue: (json['currentValue'] as num?)?.toDouble(),
      totalGain: (json['totalGain'] as num?)?.toDouble(),
      totalGainPercentage: (json['totalGainPercentage'] as num?)?.toDouble(),
      yourInvestment: json['yourInvestment'] as int?,
      niftyMidcap: (json['niftyMidcap'] as num?)?.toDouble(),
    );
  }
}
