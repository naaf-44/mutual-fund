import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mutual_fund/model_class/mutual_fund_list_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

part 'mutual_fund_basic_state.dart';
part 'mutual_fund_basic_cubit.freezed.dart';

class MutualFundBasicCubit extends Cubit<MutualFundBasicState> {
  MutualFundBasicCubit() : super(const MutualFundBasicState.initial());

  Future<void> getBasicDetails(int id) async {
    emit(MutualFundBasicState.loading());
    try {
      String jsonString = await rootBundle.loadString('assets/fund_list.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      List<MutualFundListModel> modelList =  jsonData.map((item) => MutualFundListModel.fromJson(item as Map<String, dynamic>)).toList();
      MutualFundListModel model = modelList.where((ele) => ele.id == id).first;
      emit(MutualFundBasicState.success(model));
    } catch (e) {
      emit(MutualFundBasicState.error(e.toString()));
    }
  }
}
