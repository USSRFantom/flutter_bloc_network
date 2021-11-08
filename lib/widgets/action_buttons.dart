import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network/bloc/user_bloc.dart';
import 'package:flutter_bloc_network/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc =
        BlocProvider.of<UserBloc>(context); //создаем переменную блока
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            userBloc.add(
                UserLoadEvent()); //при нажатии на кнопку опрокидываем событие загрузки
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            userBloc.add(
                UserClearEvent()); //при нажатии на кнопку опрокидываем событие очистки
          },
          color: Colors.red,
        ),
      ],
    );
  }
}
