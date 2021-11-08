import 'package:flutter_bloc_network/models/user.dart';
import 'package:flutter_bloc_network/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
