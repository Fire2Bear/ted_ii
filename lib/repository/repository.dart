import 'package:tedii/models/user.dart';
import 'package:tedii/repository/preference_repository.dart';

import 'address_repository.dart';

/// Main repository
class Repository {
  AddressRepository _addressRepository;
  PreferenceRepository _preferenceRepository;

  Repository(
      {AddressRepository addressRepository,
      PreferenceRepository preferenceRepository}) {
    this._addressRepository = addressRepository;
    this._preferenceRepository = preferenceRepository;
  }

  Future<void> setUsers(List<User> users) async {
    _preferenceRepository.saveUsers(users);
  }

  Future<List<User>> getUsers() async {
    return _preferenceRepository.loadUsers();
  }
}
