import 'package:TEDii/components/common/go_back_button.dart';
import 'package:TEDii/components/common/logo.dart';
import 'package:TEDii/components/common/my_drawer.dart';
import 'package:TEDii/components/meals/meal_details.dart';
import 'package:TEDii/components/meals/meal_selector.dart';
import 'package:TEDii/models/daily_report_model.dart';
import 'package:TEDii/models/meal_model.dart';
import 'package:TEDii/stores/daily_report_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class AddOrModifyDailyReport extends StatefulWidget {
  static const routeName = '/addOrModifyDailyReport';

  final String dailyReportId;

  AddOrModifyDailyReport({@required this.dailyReportId});

  @override
  _AddOrModifyDailyReportState createState() => _AddOrModifyDailyReportState();
}

/// Page de visualisation et de modification d'une journée
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
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Logo(),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          /*flexibleSpace: FlexibleSpaceBar(
//            centerTitle: true,
            titlePadding: EdgeInsets.all(0),
            title:
          ),*/
//          backgroundColor: hexToColor("#FFFFFF"),
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          expandedHeight: 130,
          elevation: 15,
//          titleSpacing: 10,
          leading: GoBackButton(),
          /*flexibleSpace: Container(
            width: double.infinity,
            height: 200,
            child: Placeholder(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),*/
          title: Container(
//            padding: EdgeInsets.only(bottom: 15.0, top: 5),
            child: Row(
              children: <Widget>[
                Center(
                  child: Text(this.currentDailyReport.getShortDate(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: MealSelector(
                callBackChangeMeal: this.changeCurrentMeal,
                currentMealType: this.currentMeal.mealType,
              ),
            ),
            preferredSize: Size(0.0, 70.0),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                MealDetails(
                  currentMeal: this.currentMeal,
                  callBackSaveMeal: this.updateMeal,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
