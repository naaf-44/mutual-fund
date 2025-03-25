import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund/bloc/mutual_fund_basic_bloc/mutual_fund_basic_cubit.dart';
import 'package:mutual_fund/bloc/mutual_fund_calculation_bloc/mutual_fund_calculation_cubit.dart';
import 'package:mutual_fund/bloc/mutual_fund_returns_bloc/mutual_fund_returns_cubit.dart';
import 'package:mutual_fund/utils/app_enums.dart';
import 'package:mutual_fund/utils/form_utils.dart';
import 'package:mutual_fund/widgets/basic_details.dart';
import 'package:mutual_fund/widgets/calculation_widget.dart';
import 'package:mutual_fund/widgets/icon_button.dart';
import 'package:mutual_fund/widgets/loader.dart';
import 'package:mutual_fund/widgets/returns_details.dart';

/// displays all the information about the mutual fund.
/// displays line graph, bar graph and other basic details.
class MutualFundDetailsScreen extends StatelessWidget {
  final int? id;

  const MutualFundDetailsScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormUtils.appBar("Mutual Fund Details", showBackButton: true),
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MutualFundBasicCubit()..getBasicDetails(id!)),
          BlocProvider(create: (context) => MutualFundReturnsCubit()..getReturns(ReturnType.month)),
          BlocProvider(create: (context) => MutualFundCalculationCubit()..getCalculation(0, isMonthly: false)),
        ],
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<MutualFundBasicCubit, MutualFundBasicState>(
                    builder: (context, state) {
                      return state.map(
                        initial: (e) => Loader(),
                        loading: (e) => Loader(),
                        success: (data) {
                          return BasicDetails(model: data.fund);
                        },
                        error: (error) {
                          return Text("Error: ${error.errorMessage}");
                        },
                      );
                    },
                  ),
                  BlocBuilder<MutualFundReturnsCubit, MutualFundReturnsState>(
                    builder: (context, state) {
                      return state.map(
                        initial: (e) => Loader(),
                        loading: (e) => Loader(),
                        success: (loadedData) {
                          return ReturnsDetails(
                            returnData: loadedData.fundReturns,
                          );
                        },
                        error: (error) {
                          return Text("Error: ${error.errorMessage}");
                        },
                      );
                    },
                  ),
                  BlocBuilder<MutualFundCalculationCubit, MutualFundCalculationState>(
                    builder: (context, state) {
                      return state.map(
                        initial: (e) => Loader(),
                        loading: (e) => Loader(),
                        success: (loadedData) {
                          return CalculationWidget(model: loadedData.calculateModel);
                        },
                        error: (error) {
                          return Text("Error: ${error.errorMessage}");
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(children: [
                Expanded(
                  child: AppIconButton(
                    onPressed: () {},
                    title: "Sell",
                    iconData: Icons.arrow_downward,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child:  AppIconButton(
                    onPressed: () {},
                    title: "Invest More",
                    iconData: Icons.arrow_upward,
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
