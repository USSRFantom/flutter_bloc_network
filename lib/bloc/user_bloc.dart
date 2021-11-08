import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network/bloc/user_event.dart';
import 'package:flutter_bloc_network/bloc/user_state.dart';
import 'package:flutter_bloc_network/models/user.dart';
import 'package:flutter_bloc_network/services/user_preository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  //класс блок наследующийся от библиотеки блок
  //которому передаем евенты и состояния
  final UsersRepository
      usersRepository; //создаем переменную для подключения хранилища

  UserBloc(this.usersRepository)
      : super(
            UserEmptyState()); //конструктор принимающий репозиторий и передаем стартовое состояние

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    //метод асинхронный работающий с потоком куда прокидываем переменные и состояния
    if (event is UserLoadEvent) {
      //проверяем евент, если загружен
      yield UserLoadingState(); //прокидываем класс в поток загрузки
      try {
        //ловим загрузку пользователей
        final List<User> _loadedUserList = await usersRepository
            .getAllUsers(); //вспомогательная переменная которая берет
        //репозиторий и запрашивает получить всех юзеры
        yield UserLoadedState(
            loadedUser:
                _loadedUserList); //прокидываем следующее состояние и передаем список полученный выше
      } catch (_) {
        yield UserErrorState(); //если поймали ошибку вызываем состояние ошибки
      }
    } else if (event is UserClearEvent) {
      //если нажимаем на очистку, устанавливаем состояние очистки
      yield UserEmptyState();
    }
  }
}
