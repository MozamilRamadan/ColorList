import 'package:bloc/bloc.dart';
import 'package:colors_list/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'bloc_observer.dart';
import 'color_list.dart';
import 'dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Hive.initFlutter();
  Hive.registerAdapter(ColorListAdapter());
  await Hive.openBox('color_box');
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  //Directory directory = await pathProvider.getApplicationDocumentDirectory();
  //Hive.init(directory.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}


