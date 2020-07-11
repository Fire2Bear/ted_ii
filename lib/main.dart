import 'package:TEDii/home.dart';
import 'package:TEDii/models/daily_report_model.dart';
import 'package:TEDii/repository/preference_repository.dart';
import 'package:TEDii/repository/repository.dart';
import 'package:TEDii/screens/add_or_modify_daily_report.dart';
import 'package:TEDii/screens/food_list_selection.dart';
import 'package:TEDii/stores/daily_report_store.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  PreferenceRepository preferenceRepository = PreferenceRepository();
  Repository repository =
      Repository(preferenceRepository: preferenceRepository);

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
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == AddOrModifyDailyReport.routeName) {
          // Cast the arguments to the correct type: ScreenArguments.
          final DailyReport dailyReport = settings.arguments;

          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return AddOrModifyDailyReport(dailyReportId: dailyReport.id);
            },
          );
        } else if (settings.name == FoodListSelection.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return FoodListSelection();
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      routes: {
//        Routes.addOrModifyDailyReport: (context) => AddOrModifyDailyReport(),
      },
    );
  }
}
