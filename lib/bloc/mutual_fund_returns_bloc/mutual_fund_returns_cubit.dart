import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mutual_fund/model_class/mutual_fund_returns_model.dart';
import 'package:mutual_fund/utils/app_enums.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

part 'mutual_fund_returns_state.dart';
part 'mutual_fund_returns_cubit.freezed.dart';

/// MutualFundReturnsCubit is to get the returns data from file fund_returns.json file
/// this is used to display the line graph
/// shows returns, my investment and nav value
class MutualFundReturnsCubit extends Cubit<MutualFundReturnsState> {
  MutualFundReturnsCubit() : super(const MutualFundReturnsState.initial());

  bool isNav = false;

  getReturns(ReturnType type) async {
    emit(MutualFundReturnsState.loading());
    try {
      /// read the data from fund_returns.json
      /// convert the data into model class
      /// emit success state with the data.
      String jsonString = await rootBundle.loadString('assets/fund_returns.json');
      final data = jsonDecode(jsonString);
      MutualFundReturnsModel model = MutualFundReturnsModel.fromJson(data);

      /// return the data based on the ReturnType input.
      List<ReturnData>? returnData;
      switch(type) {
        case ReturnType.month:
          returnData = model.month;
          break;
        case ReturnType.threeMonth:
          returnData = model.threeMonth;
          break;
        case ReturnType.sixMonth:
          returnData = model.sixMonth;
          break;
        case ReturnType.year:
          returnData = model.year;
          break;
        case ReturnType.threeYear:
          returnData = model.threeYears;
          break;
        case ReturnType.max:
          returnData = model.month;
          break;
      }
      emit(MutualFundReturnsState.success(returnData!));
    } catch (e) {
      emit(MutualFundReturnsState.error(e.toString()));
    }
  }
}
