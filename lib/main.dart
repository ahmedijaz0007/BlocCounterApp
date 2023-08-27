import 'package:blocpractice/logic/internetcubit/internetcubit_cubit.dart';
import 'package:blocpractice/router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/countercubit/countercubit_cubit.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity(),appRoute: AppRoute(),));
}

class MyApp extends StatelessWidget {
  AppRoute appRoute;
  Connectivity connectivity;

  MyApp({super.key,required this.connectivity,required this.appRoute});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider( create: (context) => CounterCubit(internetCubit: BlocProvider.of<InternetCubit>(context))),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }
  @override
  void dispose() {
    appRoute.dispose();
  }

}
