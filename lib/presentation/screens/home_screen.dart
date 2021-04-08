import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/presentation/widgets/home_widgets/headline_slider.dart';
import 'package:news_cleaan_arch_bloc/presentation/widgets/home_widgets/hot_news_widget.dart';
import 'package:news_cleaan_arch_bloc/presentation/widgets/home_widgets/top_channel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            HeadingSliderWidget(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Top channels",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ],
              ),
            ),
            TopChannelWidget(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Hot news",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ],
              ),
            ),
            HotNewsWidget(),
          ],
        ),
      ),
    );
  }
}
