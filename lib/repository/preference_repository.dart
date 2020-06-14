import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedii/models/daily_report_model.dart';

/// Class that serve of interface for every storage in preferences
class PreferenceRepository {
  Future<void> saveDailyReports(List<DailyReport> dailyReports) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dailyReportsString =
        dailyReports.map((dailyReport) => dailyReport.toJson()).toList();
    prefs.setStringList('dailyReports', dailyReportsString);
  }

  Future<List<dynamic>> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(" ### prefs Début");
    print(prefs.getKeys());
    print(prefs.getStringList('dailyReports'));
    print(prefs.setStringList('dailyReports',
        null)); // Permet de réinitialiser les dailyReports stockés
    print(" ### prefs fin");
  }

  Future<List<DailyReport>> loadDailyReports() async {
//    this.getAll(); // permet de vérifier le contenu des shared_prefs

    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs
        .getStringList('dailyReports')
        ?.map((dailyReport) => DailyReport.fromJson(dailyReport))
        ?.toList() ??
        [];
  }

}
