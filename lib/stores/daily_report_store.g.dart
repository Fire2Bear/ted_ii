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
    _$dailyReportsAtom.context.enforceReadPolicy(_$dailyReportsAtom);
    _$dailyReportsAtom.reportObserved();
    return super.dailyReports;
  }

  @override
  set dailyReports(ObservableList<DailyReport> value) {
    _$dailyReportsAtom.context.conditionallyRunInAction(() {
      super.dailyReports = value;
      _$dailyReportsAtom.reportChanged();
    }, _$dailyReportsAtom, name: '${_$dailyReportsAtom.name}_set');
  }

  final _$_DailyReportStoreActionController =
      ActionController(name: '_DailyReportStore');

  @override
  void saveDailyReport(DailyReport dailyReport) {
    final _$actionInfo = _$_DailyReportStoreActionController.startAction();
    try {
      return super.saveDailyReport(dailyReport);
    } finally {
      _$_DailyReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(DailyReport dailyReport) {
    final _$actionInfo = _$_DailyReportStoreActionController.startAction();
    try {
      return super.delete(dailyReport);
    } finally {
      _$_DailyReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> loadDailyReports() {
    final _$actionInfo = _$_DailyReportStoreActionController.startAction();
    try {
      return super.loadDailyReports();
    } finally {
      _$_DailyReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'usedailyReportsrs: ${dailyReports.toString()}';
    return '{$string}';
  }
}
