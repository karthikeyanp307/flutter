import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/home/bloc/home_bloc.dart';
import 'package:flutter_login/home/screen1_page.dart';
import 'package:flutter_login/home/screen2_page.dart';

class HomeForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {

  TabController _tabController;

  bool rememberMe = false;
  bool hideText = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;

    setState(() {
      hideText = rememberMe;
    });
  });

  @override
  Widget build(BuildContext context) {

    getFilterDrawer() {
      return Drawer(
          child: Column(children: <Widget>[
            Expanded(child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Filter"),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                        value: rememberMe,
                        onChanged: _onRememberMeChanged
                    ),
                    Text("Hide Text in Screen 1"),
                  ],
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: (){
                  print("Hide Text in Screen 1 : " + hideText.toString());
                  BlocProvider.of<HomeBloc>(context).add(ApplyFilter(hideText: hideText));
                      Navigator.pop(context);
                },
              ),
            )
          ],));
    }

    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          // ignore: missing_return
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
                            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                          ),
                        ),
                      ],
                      bottom: TabBar(
                          controller: _tabController,
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
                        controller: _tabController,
                        children: <Widget>[
                          Screen1Page(),
                          Screen2Page(),
                        ]),
                    endDrawer: getFilterDrawer(),
                  ));
            })
    );
  }
}