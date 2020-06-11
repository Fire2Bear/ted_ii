import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:tedii/home.dart';
import 'package:tedii/repository/open_food_fact_repository.dart';
import 'package:tedii/repository/preference_repository.dart';
import 'package:tedii/repository/repository.dart';
import 'package:tedii/routes.dart';
import 'package:tedii/screens/add_or_modify_daily_report.dart';
import 'package:tedii/stores/daily_report_store.dart';

void main() {
  PreferenceRepository preferenceRepository = PreferenceRepository();
  OpenFoodFactRepository openFoodFactRepository = OpenFoodFactRepository();
  Repository repository = Repository(
      openFoodFactRepository: openFoodFactRepository,
      preferenceRepository: preferenceRepository);

  DailyReportStore dailyReportStore = DailyReportStore(repository);

  initializeDateFormatting(); // Initialisation des dates locales "fr"

  return runApp(Provider<DailyReportStore>(
    create: (_) => dailyReportStore,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      locale: Locale("fr"),
      debugShowCheckedModeBanner: false,
      title: 'My dailyReports',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Home(),
      routes: {
        Routes.addOrModifyDailyReport: (context) => AddOrModifyDailyReport(),
      },
    );
  }
}

