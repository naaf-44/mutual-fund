import 'package:flutter/material.dart';
import 'package:mutual_fund/model_class/mutual_fund_list_model.dart';
import 'package:mutual_fund/utils/num_utils.dart';
import 'package:mutual_fund/widgets/vertical_line_widget.dart';

class BasicDetails extends StatelessWidget {
  final MutualFundListModel? model;
  const BasicDetails({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model!.fundName!, style: TextStyle(color: Colors.white, fontSize: 16)),
          Text(model!.growth!, style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  Text("Nav ", style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Text(NumUtils.formatAmount(model!.nav!), style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              VerticalLineWidget(),
              Expanded(child: Row(
                children: [
                  Text("1D ", style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Text(NumUtils.formatAmount(model!.returns!), style: TextStyle(color: Colors.white, fontSize: 12)),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.red),
                  ),
                  Text(model!.returns!.toString(), style: TextStyle(color: Colors.red, fontSize: 12)),
                ],
              )),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical:  8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Invested", style: TextStyle(color: Colors.grey, fontSize: 10)),
                      Text(
                        NumUtils.formatAmount(double.parse(model!.investedAmount!.toString())),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                VerticalLineWidget(height: 25),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Current value", style: TextStyle(color: Colors.grey, fontSize: 10)),
                      Text(
                        NumUtils.formatAmount(double.parse(model!.currentValue!.toString())),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                VerticalLineWidget(height: 25),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Total gain", style: TextStyle(color: Colors.grey, fontSize: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            NumUtils.formatAmount(model!.returns!),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.keyboard_arrow_down, color: Colors.red, size: 10,),
                          ),
                          Text(model!.returns!.toStringAsFixed(0).toString(), style: TextStyle(color: Colors.red, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
