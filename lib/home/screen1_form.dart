import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/bloc/home_bloc.dart';

class Screen1Form extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen1FormState();
}

class _Screen1FormState extends State<Screen1Form> {

  TabController _tabController;

  bool hideText = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if(state is HideTextInScreen1) {
            print("HideTextInScreen1 : " + state.hideText.toString());
            setState(() {
              hideText = state.hideText;
            });
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          // ignore: missing_return
            builder: (context, state) {
              return Scaffold(
                body: hideText? Container(): Text("Screen 1"),
              );
            })
    );
  }
}