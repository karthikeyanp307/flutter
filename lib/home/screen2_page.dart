import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/home_form.dart';
import 'package:flutter_login/home/bloc/home_bloc.dart';
import 'package:flutter_login/home/screen2_form.dart';

class Screen2Page extends StatelessWidget {

  Screen2Page({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return HomeBloc();
        },
        child: Screen2Form(),
      ),
    );
  }

}