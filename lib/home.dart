import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedii/stores/user_store.dart';
import 'package:tedii/tabs/daily_report.dart';

import 'components/common/logo.dart';
import 'utils/utils_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserStore userStore;
  int _index;

  @override
  void initState() {
    super.initState();

    _index = 1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    userStore = Provider.of<UserStore>(context);

    userStore.load();

    return Scaffold(
      appBar: AppBar(
        title: Logo(),
      ),
      body: IndexedStack(
        index: _index,
        children: <Widget>[
          DailyReport(),
          DailyReport(),
          DailyReport(),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          User user = await Navigator.of(context).pushNamed<dynamic>(
              Routes.addOrModifyUser,
              arguments: User(firstName: "", lastName: ""));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('STATISTIQUE'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
            title: Text('ACTIVITE'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              title: Text('RECETTE'),
              backgroundColor: Colors.green)
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Logo(),
              decoration: BoxDecoration(color: hexToColor("#E2ECD1")),
            ),
            ListTile(
              title: Text("Blog"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Bien-être"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Recettes"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Annuaire des pros"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("FAQ"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Nous contacter"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Paramètres"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
