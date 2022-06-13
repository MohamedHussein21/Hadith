import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith/cubit/cubit.dart';
import 'package:hadith/screens/splash_screen.dart';
import 'package:hadith/shared/remote/dio.dart';

import 'bloc_observer.dart';

void main() {
  DioHelper.init();

  BlocOverrides.runZoned(
        () {
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HadithCubit()..getHadith(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hadith',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
            elevation: 0
          )
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

