import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/bloc/home_bloc.dart';
import 'package:flutter_login/home/screen1_page.dart';
import 'package:flutter_login/home/screen2_page.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Home'),
                centerTitle: false,
                backgroundColor: Color(0xFF32373B),
                actions: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                ],
                bottom: TabBar(
                    indicatorColor: Colors.blue,
                    indicatorWeight: 4.0,
                    tabs: <Widget>[
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Screen 1"),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Screen 2"),
                        ),
                      )
                    ]),
              ),
              body: TabBarView(
                children: <Widget>[
                  Screen1Page(),
                  Screen2Page(),
                ],
              ),
              endDrawer: _FilterDrawer(),
            ),
          );
        },
      ),
    );
  }
}

class _FilterDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Filter"),
                ),
                Row(
                  children: <Widget>[
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Checkbox(
                          value: state.hideText,
                          onChanged: (value) => context
                              .bloc<HomeBloc>()
                              .add(ApplyFilter(hideText: value)),
                        );
                      },
                    ),
                    Text("Hide Text in Screen 1"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
