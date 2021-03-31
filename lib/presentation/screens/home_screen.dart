import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    homeScreenBloc.mapEventToState(HomeScreenInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}
