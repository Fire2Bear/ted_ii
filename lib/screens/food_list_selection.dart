import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:tedii/components/common/go_back_button.dart';
import 'package:tedii/components/common/logo.dart';
import 'package:tedii/components/common/my_drawer.dart';
import 'package:tedii/models/food_model.dart';
import 'package:tedii/repository/open_food_fact_repository.dart';

class FoodListSelection extends StatefulWidget {
  final List<Food> foods;

  FoodListSelection({@required this.foods});

  @override
  _FoodListSelectionState createState() => _FoodListSelectionState();
}

class _FoodListSelectionState extends State<FoodListSelection> {
  List<Product> products;

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
    OpenFoodFactRepository.searchFood("lait").then((result) {
      products = result;
      print("result[0].productNameFR");
      print(result[0].productNameFR);
    });

    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: Column(
        children: <Widget>[
          GoBackButton(),
          Center(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
