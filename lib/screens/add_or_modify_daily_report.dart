import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedii/components/common/go_back_button.dart';
import 'package:tedii/components/common/logo.dart';
import 'package:tedii/components/common/my_drawer.dart';
import 'package:tedii/components/meals/meal_details.dart';
import 'package:tedii/components/meals/meal_selector.dart';
import 'package:tedii/models/daily_report_model.dart';
import 'package:tedii/models/meal_model.dart';
import 'package:tedii/stores/daily_report_store.dart';

class AddOrModifyDailyReport extends StatefulWidget {
  static const routeName = '/addOrModifyDailyReport';

  final String dailyReportId;

  AddOrModifyDailyReport({@required this.dailyReportId});

  @override
  _AddOrModifyDailyReportState createState() => _AddOrModifyDailyReportState();
}

class _AddOrModifyDailyReportState extends State<AddOrModifyDailyReport> {
  DailyReportStore dailyReportStore;

  DailyReport currentDailyReport;
  Meal currentMeal;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void changeCurrentMeal(int mealType) {
    setState(() {
      currentMeal = this.currentDailyReport.getMealByMealType(mealType);
    });
  }

  void updateMeal(Meal newMeal) {
    setState(() {
      currentMeal = newMeal;
    });
    this.currentDailyReport.saveMeal(newMeal);
    this.dailyReportStore.saveDailyReport(this.currentDailyReport);
  }

  @override
  Widget build(BuildContext context) {
    dailyReportStore = Provider.of<DailyReportStore>(context);

    if (this.currentDailyReport == null) {
      this.setState(() {
        currentDailyReport =
            dailyReportStore.getDailyReportById(widget.dailyReportId);
      });
    }
    if (this.currentMeal == null) {
      this.changeCurrentMeal(0);
    }

    print("currentMeal");
    print(currentMeal);

    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: Column(
        children: <Widget>[
          GoBackButton(),
          Center(
            child: Text(this.currentDailyReport.getShortDate(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 10,
          ),
          MealSelector(),
          MealDetails(
            currentMeal: this.currentMeal, callBack: this.updateMeal,),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
