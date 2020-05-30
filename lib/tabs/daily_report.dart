import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tedii/stores/user_store.dart';

class DailyReport extends StatelessWidget {
  UserStore userStore;

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);

    Widget slideRightBackground() {
      return Container(
        color: Colors.green,
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.edit,
                color: Colors.white,
              ),
              Text(
                " Edit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          alignment: Alignment.centerLeft,
        ),
      );
    }

    Widget slideLeftBackground() {
      return Container(
        color: Colors.red,
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              Text(
                " Delete",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          alignment: Alignment.centerRight,
        ),
      );
    }

//    Map<DismissDirection, double> dismissThresholds =
//        Map<DismissDirection, double>();
//    dismissThresholds[DismissDirection.startToEnd] = 0.5;
//    dismissThresholds[DismissDirection.endToStart] = 0.9;

    return Observer(builder: (context) {
      return Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Column(
                  // Daily report
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      // Naviguation DailyReport
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          tooltip: "Jour précédent",
                          onPressed: () {
                            // TODO Call changeDay(-1)
                          },
                        ), // Jour précédent
                        Container(
                            child: Row(// Jour courant
                                children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text("Aujourd'hui, 23 Avril")
                        ])),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          tooltip: "Jour suivant",
                          onPressed: () {
                            // TODO Call changeDay(1)
                          },
                        ), // Jour suivant
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10),
                        Icon(Icons.restaurant),
                        SizedBox(width: 10),
                        Text("Mes repas")
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Todo goto MyEvents
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          Icon(FlatIcons.target),
                          SizedBox(width: 10),
                          Text("Mes objectifs")
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Todo goto MyEvents
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          Icon(Icons.event),
                          SizedBox(width: 10),
                          Text("Mes événements")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              // Largeur de la naviguation
              height: MediaQuery.of(context).size.height / 3,
              // Hauteur de la naviguation
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(-1.5, 1.5),
                    blurRadius: 5.0,
                  )
                ],
              ),
              alignment: Alignment.topCenter,
            )
          ],
          /*
          child: ListView.separated(
            itemBuilder: (context, index) {
              User user = userStore.users[index];
              return Dismissible(
                  // Show a red background as the item is swiped away.
                  background: slideRightBackground()*/ /*Container(child: Icon(Icons.delete_forever), alignment: Alignment(0.6, 0),)*/ /*,
                  secondaryBackground: slideLeftBackground()*/ /*Container(child: Icon(Icons.delete_forever), alignment: Alignment(0.4, 0),)*/ /*,

                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  key: Key(user.id),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  dismissThresholds: dismissThresholds,

                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {

                    if (direction == DismissDirection.endToStart){
                      // Remove the item from the data source.
                      userStore.delete(user);
                    }

                    // Show a snackbar. This snackbar could also contain "Undo" actions.
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("${user.firstName} supprimé")));
                  },
                  child: ListTile(
                    title: Text(user?.firstName ?? ""),
                    onLongPress: () {},
                    onTap: () async {
                      User newUser =
                          await Navigator.of(context).pushNamed<dynamic>(
                        Routes.addOrModifyUser,
                        arguments: user,
                      );
                      if (newUser != null) {
//                      this._onUpdate(newUser);
                      }
                    },
                    leading: Icon(Icons.business),
                    trailing: Icon(Icons.arrow_right, size: 35),
                    subtitle: Text(user?.firstName?.toString() ?? ""),
                  ));
            },
            itemCount: userStore.users.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(color: Colors.red, height: 3),
          ),
          */
        ),
      );
    });
  }
}
