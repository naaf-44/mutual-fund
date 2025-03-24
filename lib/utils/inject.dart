import 'package:get_it/get_it.dart';
import 'package:mutual_fund/utils/preference_handler.dart';

final GetIt getIt = GetIt.instance;

void inject() {
  getIt.registerLazySingleton<PreferenceHandler>(PreferenceHandler.new);
}