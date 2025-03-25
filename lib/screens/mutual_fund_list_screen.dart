import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutual_fund/bloc/mutual_fund_list_bloc/mutual_fund_list_cubit.dart';
import 'package:mutual_fund/model_class/mutual_fund_list_model.dart';
import 'package:mutual_fund/screens/mutual_fund_details_screen.dart';
import 'package:mutual_fund/utils/form_utils.dart';
import 'package:mutual_fund/widgets/loader.dart';

/// displays mutual fund list
/// once click on the list navigates to mutual fund dashboard.
class MutualFundListScreen extends StatelessWidget {
  const MutualFundListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormUtils.appBar("Mutual Fund List"),
      backgroundColor: Colors.black,
      body: BlocProvider<MutualFundListCubit>(
        create: (context) => MutualFundListCubit()..getMutualFundList(),
        child: BlocBuilder<MutualFundListCubit, MutualFundListState>(
          builder: (ctx, state) {
            return state.map(
              initial: (_) => Loader(),
              loading: (e) => Loader(),
              success: (data) {
                return ListView.builder(
                  itemCount: data.fundList.length,
                  itemBuilder: (context, index) {
                    MutualFundListModel fund = data.fundList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MutualFundDetailsScreen(id: fund.id)));
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(fund.fundName!)),
                                  SizedBox(width: 5),
                                  Text("CV: ${fund.currentValue}")
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Returns: ${fund.returnPercentage.toString()}%", style: TextStyle(color: Colors.grey)),
                                  Text("NIFTY: ${fund.niftyMidcap.toString()}", style: TextStyle(color: Colors.grey)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (e) {
                return Text(e.errorMessage);
              },
            );
          },
        )
      ),
    );
  }
}
