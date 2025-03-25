import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mutual_fund/model_class/mutual_fund_list_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

part 'mutual_fund_list_state.dart';
part 'mutual_fund_list_cubit.freezed.dart';

/// MutualFundListCubit to get the list of mutual from fund_list.json

class MutualFundListCubit extends Cubit<MutualFundListState> {
  MutualFundListCubit() : super(const MutualFundListState.initial());

  Future<void> getMutualFundList() async {
    emit(MutualFundListState.loading());
    try {
      /// get fund list from fund_list.json using rootBundle
      /// convert the string to model class and emit success state along with the data
      String jsonString = await rootBundle.loadString('assets/fund_list.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      List<MutualFundListModel> model =  jsonData.map((item) => MutualFundListModel.fromJson(item as Map<String, dynamic>)).toList();
      emit(MutualFundListState.success(model));
    } catch (e) {
      emit(MutualFundListState.error(e.toString()));
    }
  }
}
