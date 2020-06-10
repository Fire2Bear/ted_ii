import 'package:mobx/mobx.dart';
import 'package:tedii/models/daily_report_model.dart';
import 'package:tedii/repository/repository.dart';
import 'package:tedii/utils/utils_service.dart';

part 'daily_report_store.g.dart';

class DailyReportStore = _DailyReportStore with _$DailyReportStore;

abstract class _DailyReportStore with Store {
  final Repository _repository;

  _DailyReportStore(this._repository);

  @observable
  ObservableList<DailyReport> dailyReports = ObservableList<DailyReport>();

  @action
  DailyReport getDailyReport(DateTime dateTime) {
    print("getCurrentDailyReport");
    print(dailyReports);
    DailyReport dailyReport = this.dailyReports.singleWhere(
        (dailyReport) => compareOnlyDateTo(dailyReport.date, dateTime) == 0,
        orElse: () => new DailyReport(date: new DateTime.now()));
    print(dailyReports);

    return dailyReport;
  }

  @action
  void saveDailyReport(DailyReport dailyReport) {
    print("saveDailyReport");
    print(dailyReports);
    bool alreadyPresent = false;
    for (int i = 0; i < this.dailyReports.length; i++) {
      if (dailyReport.id == this.dailyReports[i].id) {
        this.dailyReports[i] = dailyReport;
        alreadyPresent = true;
        break;
      }
    }
    if (!alreadyPresent) {
      dailyReports.add(dailyReport);
    }
    this._repository.setDailyReports(this.dailyReports);
    print(dailyReports);
  }

  @action
  Future<void> loadDailyReports() async {
    print("loadDailyReports");
    // attend le getDailyReports puis le cast en ObservableList
    dailyReports = ObservableList<DailyReport>.of(
        (await this._repository.getDailyReports()));
    print(dailyReports);
  }

  @action
  void delete(DailyReport dailyReport) {
    for (int i = 0; i < this.dailyReports.length; i++) {
      if (dailyReport.id == this.dailyReports[i].id) {
        this.dailyReports.removeAt(i);
        break;
      }
    }
    this._repository.setDailyReports(this.dailyReports);
  }
}
