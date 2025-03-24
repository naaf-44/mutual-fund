part of 'mutual_fund_list_cubit.dart';

@freezed
class MutualFundListState with _$MutualFundListState {
  const factory MutualFundListState.initial() = _Initial;
  const factory MutualFundListState.loading() = _Loading;
  const factory MutualFundListState.success(List<MutualFundListModel> fundList) = _Success;
  const factory MutualFundListState.error(String errorMessage) = _Error;
}
