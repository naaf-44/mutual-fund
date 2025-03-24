import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund/bloc/mutual_fund_calculation_bloc/mutual_fund_calculation_cubit.dart';
import 'package:mutual_fund/model_class/mutual_fund_calculation_model.dart';

class InvestSlideWidget extends StatelessWidget {
  final MutualFundCalculationModel? model;

  const InvestSlideWidget({super.key, this.model});

  @override
  Widget build(BuildContext context) {

    return Slider(
      value: model!.invested!.toDouble(),
      min: model!.min!.toDouble(),
      max: model!.max!.toDouble(),
      onChanged: (newValue) {
        bool isMonthly = context.read<MutualFundCalculationCubit>().isMonthlyInvest;
        context.read<MutualFundCalculationCubit>().getCalculation(newValue.toInt(), isMonthly: isMonthly);
      },
      activeColor: Colors.blue,
      inactiveColor: Colors.blue.withAlpha(50),
      thumbColor: Colors.blue,
      padding: EdgeInsets.all(0),
    );
  }
}
