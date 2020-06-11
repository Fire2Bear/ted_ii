// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DailyReportStore on _DailyReportStore, Store {
  final _$dailyReportsAtom = Atom(name: '_DailyReportStore.dailyReports');

  @override
  ObservableList<DailyReport> get dailyReports {
    _$dailyReportsAtom.reportRead();
    return super.dailyReports;
  }

  @override
  set dailyReports(ObservableList<DailyReport> value) {
    _$dailyReportsAtom.reportWrite(value, super.dailyReports, () {
      super.dailyReports = value;
    });
  }

  final _$currentDailyReportAtom =
      Atom(name: '_DailyReportStore.currentDailyReport');

  @override
  DailyReport get currentDailyReport {
    _$currentDailyReportAtom.reportRead();
    return super.currentDailyReport;
  }

  @override
  set currentDailyReport(DailyReport value) {
    _$currentDailyReportAtom.reportWrite(value, super.currentDailyReport, () {
      super.currentDailyReport = value;
    });
  }

  final _$loadDailyReportsAsyncAction =
      AsyncAction('_DailyReportStore.loadDailyReports');

  @override
  Future<void> loadDailyReports() {
    return _$loadDailyReportsAsyncAction.run(() => super.loadDailyReports());
  }

  final _$_DailyReportStoreActionController =
      ActionController(name: '_DailyReportStore');

  @override
  DailyReport getDailyReport(DateTime dateTime) {
    final _$actionInfo = _$_DailyReportStoreActionController.startAction(
        name: '_DailyReportStore.getDailyReport');
    try {
      return super.getDailyReport(dateTime);
    } finally {
      _$_DailyReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveDailyReport(DailyReport dailyReport) {
    final _$actionInfo = _$_DailyReportStoreActionController.startAction(
        name: '_DailyReportStore.saveDailyReport');
    try {
      return super.saveDailyReport(dailyReport);
    } finally {
      _$_DailyReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(DailyReport dailyReport) {
    final _$actionInfo = _$_DailyReportStoreActionController.startAction(
        name: '_DailyReportStore.delete');
    try {
      return super.delete(dailyReport);
    } finally {
      _$_DailyReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dailyReports: ${dailyReports},
currentDailyReport: ${currentDailyReport}
    ''';
  }
}
