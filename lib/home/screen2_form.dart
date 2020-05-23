import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/bloc/home_bloc.dart';

class Screen2Form extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen2FormState();
}

class _Screen2FormState extends State<Screen2Form> {

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          // ignore: missing_return
            builder: (context, state) {
              return Text("Screen 2");
            })
    );
  }
}