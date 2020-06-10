import 'package:tedii/models/daily_report_model.dart';
import 'package:tedii/repository/preference_repository.dart';

import 'open_food_fact_repository.dart';

/// Main repository
class Repository {
  OpenFoodFactRepository _openFoodFactRepository;
  PreferenceRepository _preferenceRepository;

  Repository({OpenFoodFactRepository openFoodFactRepository,
      PreferenceRepository preferenceRepository}) {
    this._openFoodFactRepository = openFoodFactRepository;
    this._preferenceRepository = preferenceRepository;
  }

  Future<void> setDailyReports(List<DailyReport> dailyReports) async {
    _preferenceRepository.saveDailyReports(dailyReports);
  }

  Future<List<DailyReport>> getDailyReports() async {
    return _preferenceRepository.loadDailyReports();
  }
}
