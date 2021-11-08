import 'package:flutter_bloc_network/models/user.dart';
import 'package:flutter_bloc_network/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider =
      UserProvider(); //переменаая с помощью котороый будем обращаться к провайдеру

  //метод  который будет взаимодействовать с поставщиком данных и
  // выполнять преобразование данных перед передачей на уровень бизнеслогики
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}
//оболочка вокруг провайдера, чтобы не на прямую работать с api
//и через репоззиторий будем обращаться к api этого класса
