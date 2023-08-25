import 'package:blocpractice/logic/countercubit/countercubit_cubit.dart';
import 'package:blocpractice/presentation/homepage.dart';
import 'package:blocpractice/presentation/homepage2.dart';
import 'package:blocpractice/presentation/homepage3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute{
   final CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){

      case "/":
        return MaterialPageRoute(builder: (_){
          return BlocProvider.value(value: _counterCubit,
          child: const MyHomePage(title: "HOME"));
        });
      case "2ndHome":
        return MaterialPageRoute(builder: (_){
          return BlocProvider.value(value: _counterCubit,
          child: const HomePage2(title: "2ndHome"));
        });
      case "3rdHome":
        return MaterialPageRoute(builder: (_){
          return BlocProvider.value(value: _counterCubit,
          child: const Homepage3(title: "3rdHome"));
        });
       default:
         return null;

    }

  }

  @override
  dispose(){
   _counterCubit.close();
  }

}