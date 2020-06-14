import 'package:tedii/models/daily_report_model.dart';
import 'package:tedii/repository/preference_repository.dart';

/// Main repository
class Repository {
  PreferenceRepository _preferenceRepository;

  Repository({PreferenceRepository preferenceRepository}) {
    this._preferenceRepository = preferenceRepository;
  }

  Future<void> setDailyReports(List<DailyReport> dailyReports) async {
    _preferenceRepository.saveDailyReports(dailyReports);
  }

  Future<List<DailyReport>> getDailyReports() async {
    return _preferenceRepository.loadDailyReports();
  }
}
