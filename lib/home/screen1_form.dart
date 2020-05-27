import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/bloc/home_bloc.dart';

class Screen1Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: state.hideText ? Container() : Text("Screen 1"),
        );
      },
    );
  }
}
