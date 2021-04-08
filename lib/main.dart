import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/article_response_local.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/source_local_model.dart';
import 'package:news_cleaan_arch_bloc/presentation/main_screen.dart';
import 'package:path_provider/path_provider.dart';

import 'data/local/model/article_local_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(LocalArticleModelAdapter());
  Hive.registerAdapter(LocalSourceModelAdapter());
  Hive.registerAdapter(LocalArticleResponseModelAdapter());

  Hive.openBox('articles');
  runApp(MyApp());
}

class LocalSourceeModelAdapter {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
