import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedii/components/common/go_back_button.dart';
import 'package:tedii/components/common/logo.dart';
import 'package:tedii/components/common/my_drawer.dart';
import 'package:tedii/components/meals/meal_selector.dart';
import 'package:tedii/models/daily_report_model.dart';
import 'package:tedii/stores/daily_report_store.dart';

class AddOrModifyDailyReport extends StatefulWidget {
  final DailyReport dailyReport;

  AddOrModifyDailyReport({this.dailyReport});

  @override
  _AddOrModifyDailyReportState createState() => _AddOrModifyDailyReportState();
}

class _AddOrModifyDailyReportState extends State<AddOrModifyDailyReport> {
  DailyReportStore dailyReportStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    dailyReportStore = Provider.of<DailyReportStore>(context);
/*
    if (this.widget.dailyReport == null) {
      this.widget.dailyReport.date = DateTime.now();
    }
*/

    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: Column(
        children: <Widget>[
          GoBackButton(),
          MealSelector(),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
