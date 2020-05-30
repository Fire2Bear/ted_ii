import 'package:mobx/mobx.dart';
import 'package:tedii/models/user.dart';
import 'package:tedii/repository/repository.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final Repository _repository;

  _UserStore(this._repository);

  @observable
  ObservableList<User> users = ObservableList<User>();

  @action
  void addOrModify(User user) {
    bool alreadyPresent = false;
    for (int i = 0; i < this.users.length; i++) {
      if (user.id == this.users[i].id) {
        this.users[i] = user;
        alreadyPresent = true;
        break;
      }
    }
    if (!alreadyPresent) {
      users.add(user);
    }
    this._repository.setUsers(this.users);
  }

  @action
  Future<void> load() async {
    // attend le getCompanies puis le cast en ObservableList
    users = ObservableList<User>.of((await this._repository.getUsers()));
  }

  @action
  void delete(User user) {
    for (int i = 0; i < this.users.length; i++) {
      if (user.id == this.users[i].id) {
        this.users.removeAt(i);
        break;
      }
    }
    this._repository.setUsers(this.users);
  }
}
