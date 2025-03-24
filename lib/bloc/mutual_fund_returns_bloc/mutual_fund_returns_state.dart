part of 'mutual_fund_returns_cubit.dart';

@freezed
class MutualFundReturnsState with _$MutualFundReturnsState {
  const factory MutualFundReturnsState.initial() = _Initial;
  const factory MutualFundReturnsState.loading() = _Loading;
  const factory MutualFundReturnsState.success(List<ReturnData> fundReturns) = _Success;
  const factory MutualFundReturnsState.error(String errorMessage) = _Error;
}
