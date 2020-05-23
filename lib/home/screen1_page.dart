import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/screen1_form.dart';
import 'package:flutter_login/home/bloc/home_bloc.dart';

class Screen1Page extends StatelessWidget {

  Screen1Page({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return HomeBloc();
        },
        child: Screen1Form(),
      ),
    );
  }

}