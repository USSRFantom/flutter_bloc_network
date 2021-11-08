abstract class UserState {} //абстрактный класс отвечающий за состояния

class UserEmptyState extends UserState {} //состояние отсутствуют

class UserLoadingState extends UserState {} //состояния загружаются

class UserLoadedState extends UserState {
  //состояния загружены
  List<dynamic> loadedUser;
  UserLoadedState({required this.loadedUser})
      : assert(loadedUser !=
            null); //кунструктор, куда будем передавать пользователей
}

class UserErrorState extends UserState {} //ошибка при загрузке данных
