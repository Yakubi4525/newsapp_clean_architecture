import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_top_headlines_bloc.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/top_head_line_module.dart';
import 'package:news_cleaan_arch_bloc/presentation/widgets/home_widgets/headline_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  GetTopHeadlinesBloc _getTopHeadLinesBloc;
  @override
  void initState() {
    _getTopHeadLinesBloc = TopHaedLineModule.getBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeadingSliderWidget(),
      ],
    );
  }
}
