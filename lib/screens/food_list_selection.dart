import 'package:TEDii/components/common/go_back_button.dart';
import 'package:TEDii/components/common/logo.dart';
import 'package:TEDii/components/common/my_drawer.dart';
import 'package:TEDii/models/food_model.dart';
import 'package:TEDii/repository/open_food_fact_repository.dart';
import 'package:TEDii/utils/utils_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/model/Product.dart';

class FoodListSelection extends StatefulWidget {
  static const routeName = '/foodListSelection';

  FoodListSelection();

  @override
  _FoodListSelectionState createState() => _FoodListSelectionState();
}

class _FoodListSelectionState extends State<FoodListSelection> {
  List<Product> _products;

  bool _loading;

  @override
  void initState() {
    super.initState();
    _products = [];
    _loading = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void updateList(search) async {
    setState(() {
      _loading = true;
    });

    var result;
    if (search != "") {
      result = await OpenFoodFactRepository.searchFood(search);
      result.where((food) => food.productNameFR != null);

      if (result.isEmpty) {
        result = await OpenFoodFactRepository.searchFood(search);
        result.where((food) => food.productNameFR != null);
      }
/*
      print("result[0].productNameFR");
      print(result);*/

    } else {
      result = new List<Product>();
    }
    // Pour empêcher un mise à jour du state alors que l'utilisateur est revenu en arrière
    if (this.mounted) {
      setState(() {
        _products = result;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: Column(
        children: <Widget>[
          GoBackButton(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: "Aliment recherché"),
              cursorColor: Colors.blue,
              onSubmitted: this.updateList,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: !_loading,
                  child: Expanded(
                    child: Container(
//                      color: hexToColor("#E2ECD1"),
                      child: ListView(
                        padding: EdgeInsets.all(8.0),
                        children: _products.map((
                          product,
                        ) {
                          return Container(
                            color: (_products.indexOf(product) % 2 == 0)
                                ? hexToColor("#E2ECD1")
                                : hexToColor("#FFFFFF"),
                            child: ListTile(
                              title: Text(product.productName),
                              onTap: () {
                                Navigator.of(context)
                                    .pop(Food.fromProduct(product));
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _loading,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Chargement des données...',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
