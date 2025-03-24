import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund/bloc/mutual_fund_calculation_bloc/mutual_fund_calculation_cubit.dart';

class InvestTabWidget extends StatefulWidget {
  const InvestTabWidget({super.key});

  @override
  State<InvestTabWidget> createState() => InvestTabWidgetState();
}

class InvestTabWidgetState extends State<InvestTabWidget>  with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        bool isMonthlyInvest = false;
        if(tabController.index == 1) {
          isMonthlyInvest = true;
        }

        context.read<MutualFundCalculationCubit>().getCalculation(0, isMonthly: isMonthlyInvest);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 35,
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey, width: 1)
        ),
        child: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 0,
          dividerColor: Colors.transparent,
          indicatorPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          indicator: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
          tabs: [
            Tab(text: "1-Time"),
            Tab(text: "Monthly SIP"),
          ],
        ),
      ),
    );
  }
}
