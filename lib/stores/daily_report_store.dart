import 'package:TEDii/models/daily_report_model.dart';
import 'package:TEDii/repository/repository.dart';
import 'package:TEDii/utils/utils_service.dart';
import 'package:mobx/mobx.dart';

part 'daily_report_store.g.dart';

class DailyReportStore = _DailyReportStore with _$DailyReportStore;

abstract class _DailyReportStore with Store {
  final Repository _repository;

  _DailyReportStore(this._repository);

  @observable
  ObservableList<DailyReport> dailyReports = ObservableList<DailyReport>();

  @observable
  DailyReport currentDailyReport;

  @action
  DailyReport getDailyReport(DateTime dateTime) {
    print("# getCurrentDailyReport");
//    print(dailyReports);
    DailyReport dailyReport = this.dailyReports.singleWhere(
            (dailyReport) => compareOnlyDateTo(dailyReport.date, dateTime) == 0,
        orElse: () {
          // On retourne un nouveau dailyReport et on l'ajoute à la liste des existants
          DailyReport newDailyReport = new DailyReport(date: dateTime);
          this.dailyReports.add(newDailyReport);
          this._repository.setDailyReports(dailyReports);
          return newDailyReport;
        });
    print(dailyReport);
    this._repository.setDailyReports(this.dailyReports);

    return dailyReport;
  }

  @action
  DailyReport getDailyReportById(String dailyReportId) {
    print("# getCurrentDailyReport");
//    print(dailyReports);
    DailyReport dailyReport = this.dailyReports.singleWhere(
            (dailyReport) => (dailyReport.id == dailyReportId));
    print(dailyReport);

    return dailyReport;
  }

  @action
  void saveDailyReport(DailyReport dailyReport) {
    print("# saveDailyReport");
//    print(dailyReports);
    bool alreadyPresent = false;
    for (int i = 0; i < this.dailyReports.length; i++) {
      if (dailyReport.id == this.dailyReports[i].id) {
        this.dailyReports[i] = dailyReport;
        alreadyPresent = true;
        break;
      }
    }
    if (!alreadyPresent) {
      this.dailyReports.add(dailyReport);
    }
    this._repository.setDailyReports(this.dailyReports);
    print(this.dailyReports);
    print("length : " + this.dailyReports.length.toString());
    print("# saveDailyReport FIN");
  }

  @action
  Future<void> loadDailyReports() async {
    print("# loadDailyReports");
    // attend le getDailyReports puis le cast en ObservableList
    this.dailyReports = ObservableList<DailyReport>.of(
        (await this._repository.getDailyReports()));
    print(this.dailyReports);
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
