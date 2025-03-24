part of 'mutual_fund_basic_cubit.dart';

@freezed
class MutualFundBasicState with _$MutualFundBasicState {
  const factory MutualFundBasicState.initial() = _Initial;
  const factory MutualFundBasicState.loading() = _Loading;
  const factory MutualFundBasicState.success(MutualFundListModel fund) = _Success;
  const factory MutualFundBasicState.error(String errorMessage) = _Error;
}
