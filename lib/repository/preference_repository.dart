import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedii/models/user.dart';

/// Class that serve of interface for every storage in preferences
class PreferenceRepository {
  Future<void> saveUsers(List<User> users) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('users', users.map((user) => user.toJson()).toList());
  }

  Future<List<User>> loadUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs
            .getStringList('users')
            ?.map((user) => User.fromJson(user))
            ?.toList() ??
        [];
  }
}
