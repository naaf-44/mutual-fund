part of 'mutual_fund_calculation_cubit.dart';

@freezed
class MutualFundCalculationState with _$MutualFundCalculationState {
  const factory MutualFundCalculationState.initial() = _Initial;
  const factory MutualFundCalculationState.loading() = _Loading;
  const factory MutualFundCalculationState.success(MutualFundCalculationModel calculateModel) = _Success;
  const factory MutualFundCalculationState.error(String errorMessage) = _Error;
}
