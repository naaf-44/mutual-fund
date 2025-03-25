import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mutual_fund/model_class/mutual_fund_calculation_model.dart';
import 'package:mutual_fund/utils/num_utils.dart';

part 'mutual_fund_calculation_state.dart';
part 'mutual_fund_calculation_cubit.freezed.dart';

/// MutualFundCalculationCubit to handle bar graph data of mutual.

class MutualFundCalculationCubit extends Cubit<MutualFundCalculationState> {
  MutualFundCalculationCubit() : super(const MutualFundCalculationState.initial());

  bool isMonthlyInvest = false;
  TextEditingController investController = TextEditingController();

  /// getCalculation based on month and yearly data
  getCalculation(int invest, {bool isMonthly = false}) {
    emit(MutualFundCalculationState.loading());
    isMonthlyInvest = isMonthly;

    MutualFundCalculationModel model = MutualFundCalculationModel(
      min: isMonthly ? 1000 : 100000,
      max: isMonthly ? 50000 : 1000000,
      invested: invest == 0 ? isMonthly ? 1000 : 100000 : invest,
      postReturn: isMonthly ? 100000 : 360000,
      profit:  300,
      savingAc: isMonthly? 70000 : 119000,
      catAvg: isMonthly? 160000 : 360000,
      directPlan: isMonthly? 166000 : 455000,
      graphData: isMonthly? [
        GraphData(val1: 50, val2: 40),
        GraphData(val1: 100, val2: 50),
        GraphData(val1: 150, val2: 20),
      ] : [
        GraphData(val1: 150, val2: 20),
        GraphData(val1: 70, val2: 10),
        GraphData(val1: 50, val2: 40),
      ]
    );

    if (invest == 0) {
      investController.text = NumUtils.formatAmount(model.min!.toDouble());
    } else {
      investController.text = NumUtils.formatAmount(invest.toDouble());
    }

    emit(MutualFundCalculationState.success(model));
  }
}
