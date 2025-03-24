import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund/bloc/mutual_fund_returns_bloc/mutual_fund_returns_cubit.dart';
import 'package:mutual_fund/utils/app_enums.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key});

  @override
  State<TabWidget> createState() => TabWidgetState();
}

class TabWidgetState extends State<TabWidget>  with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);

    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        ReturnType? returnType;
        if(tabController.index == 0) {
          returnType = ReturnType.month;
        } else if(tabController.index == 1) {
          returnType = ReturnType.threeMonth;
        } else if(tabController.index == 2) {
          returnType = ReturnType.sixMonth;
        } else if(tabController.index == 3) {
          returnType = ReturnType.year;
        } else if(tabController.index == 4) {
          returnType = ReturnType.threeYear;
        } else if(tabController.index == 5) {
          returnType = ReturnType.month;
        }

        context.read<MutualFundReturnsCubit>().getReturns(returnType!);
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
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 0.5)
        ),
        child: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 0,
          dividerColor: Colors.transparent,
          indicatorPadding: EdgeInsets.symmetric(vertical: 10),
          indicator: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
          tabs: [
            Tab(text: "1M"),
            Tab(text: "3M"),
            Tab(text: "6M"),
            Tab(text: "1Y"),
            Tab(text: "3Y"),
            Tab(text: "MAX"),
          ],
        ),
      ),
    );
  }
}
