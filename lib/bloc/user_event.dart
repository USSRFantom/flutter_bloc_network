abstract class UserEvent {
} //общий абстрактный класс, через который и будем работать с собитиями

class UserLoadEvent extends UserEvent {} //событие нажатия на кнопку загрузка

class UserClearEvent extends UserEvent {} //событие нажатия на кнопку оичстка
