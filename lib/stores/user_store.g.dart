// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$usersAtom = Atom(name: '_UserStore.users');

  @override
  ObservableList<User> get users {
    _$usersAtom.context.enforceReadPolicy(_$usersAtom);
    _$usersAtom.reportObserved();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.context.conditionallyRunInAction(() {
      super.users = value;
      _$usersAtom.reportChanged();
    }, _$usersAtom, name: '${_$usersAtom.name}_set');
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void addOrModify(User user) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.addOrModify(user);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(User user) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.delete(user);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> load() {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.load();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'users: ${users.toString()}';
    return '{$string}';
  }
}
