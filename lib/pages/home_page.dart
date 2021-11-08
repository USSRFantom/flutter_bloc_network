import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network/bloc/user_bloc.dart';
import 'package:flutter_bloc_network/services/user_preository.dart';
import 'package:flutter_bloc_network/widgets/action_buttons.dart';
import 'package:flutter_bloc_network/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('User List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
