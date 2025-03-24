import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund/bloc/mutual_fund_calculation_bloc/mutual_fund_calculation_cubit.dart';
import 'package:mutual_fund/model_class/mutual_fund_calculation_model.dart';
import 'package:mutual_fund/utils/num_utils.dart';
import 'package:mutual_fund/widgets/invest_slide_widget.dart';
import 'package:mutual_fund/widgets/invest_tab_widget.dart';
import 'package:mutual_fund/widgets/mutual_fund_bar_widget.dart';

class CalculationWidget extends StatelessWidget {
  final MutualFundCalculationModel? model;
  const CalculationWidget({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    MutualFundCalculationCubit bloc = context.read<MutualFundCalculationCubit>();

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.grey.withAlpha(30)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text("If you invested ", style: TextStyle(color: Colors.white)),
                    if(bloc.isMonthlyInvest)
                      Text("p.m ", style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: bloc.investController,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        decoration: InputDecoration(isDense: true),
                      )
                    )
                  ],
                )
              ),
              Expanded(child: InvestTabWidget()),
            ],
          ),
          const SizedBox(height: 20),
          InvestSlideWidget(model: model),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("This Fund's past returns", style: TextStyle(color: Colors.white))),
              Text(NumUtils.formatAmount(model!.postReturn!.toDouble()), style: TextStyle(color: Colors.green)),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("Profit % (Absolute Return)", style: TextStyle(color: Colors.grey, fontSize: 11))),
              Text("${model!.profit}%", style: TextStyle(color: Colors.white, fontSize: 11)),
            ],
          ),
          const SizedBox(height: 80),
          MutualFundBarWidget(model: model),
        ],
      ),
    );
  }
}
