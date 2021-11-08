import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network/bloc/user_bloc.dart';
import 'package:flutter_bloc_network/bloc/user_state.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      //возвращаем блокбилдер
      if (state is UserEmptyState) {
        //если состояние имеет пустой список
        return Center(
          child: Text('No Data'), //выводим текст нет данных
        );
      }
      if (state is UserLoadingState) {
        //если состояние имеет стадию загрузки
        return Center(
          child: CircularProgressIndicator(), //выводим прогрессбар
        );
      }
      if (state is UserLoadedState) {
        //если состояние имеет загруженный список выводим наш список
        return ListView.builder(
            itemCount: state.loadedUser.length, //считаем колличество элементов
            itemBuilder: (context, index) => Container(
                  color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                  child: ListTile(
                    leading: Text(
                      'ID: ${state.loadedUser[index].id}', //устанавливаем значение id
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Column(
                      children: [
                        Text(
                          '${state.loadedUser[index].name}', //устанавливаем значение имя
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Email: ${state.loadedUser[index].email}',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            Text(
                              'Phone: ${state.loadedUser[index].phone}',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      }

      if (state is UserErrorState) {
        //если состояние в ошибке
        return Center(
          child: Text('Error'), //устанавливаем текст c jib,rjq
        );
      }
      return null;
    });
  }
}
