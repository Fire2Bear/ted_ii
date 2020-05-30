import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedii/repository/address_repository.dart';
import 'package:tedii/repository/preference_repository.dart';
import 'package:tedii/repository/repository.dart';
import 'package:tedii/stores/user_store.dart';

import 'home.dart';

void main() {
  PreferenceRepository preferenceRepository = PreferenceRepository();
  AddressRepository addressRepository = AddressRepository();
  Repository repository = Repository(
      addressRepository: addressRepository,
      preferenceRepository: preferenceRepository);

  UserStore userStore = UserStore(repository);
  return runApp(Provider<UserStore>(
    create: (_) => userStore,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My users',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Home(),
      routes: {
        /*
        Routes.addOrModifyUser: (context) => AddOrModifyUser(),
        Routes.searchAddress: (context) => SearchAddress(),
        */
      },
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              "Coucou toi" + " <3",
              style: TextStyle(color: Colors.blue),
            ),
            Row(
              children: <Widget>[
                Container(
                    child: Text("Texte 1"),
                    color: Colors.green,
                    margin: EdgeInsets.all(10)),
                Container(
                    child: Text("Texte 2"),
                    color: Colors.blue,
                    margin: EdgeInsets.all(10)),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

*/
