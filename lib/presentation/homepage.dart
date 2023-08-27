import 'package:blocpractice/logic/internetcubit/internetcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/countercubit/countercubit_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
    listener: (context, state) {
    if (state is InternetConnected && state.connectionType == ConnectionType.wifi){
      context.read<CounterCubit>().increment();
    }

    else if (state is InternetConnected && state.connectionType == ConnectionType.mobile){
      context.read<CounterCubit>().decrement();
    }
  },
  child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncremented ?? true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Incremented!'),
              duration: Duration(milliseconds: 300),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Decremented!'),
              duration: Duration(milliseconds: 300),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              // BlocBuilder<InternetCubit, InternetState>(
              //   builder: (context, state) {
              //     var dis = "";
              //     if (state is InternetConnected && state.connectionType == ConnectionType.wifi){
              //       dis = "WIFI";
              //     }
              //    else if (state is InternetConnected && state.connectionType == ConnectionType.mobile){
              //       dis = "Mobile";
              //     }
              //    else if (state is InternetDisconnected){
              //      dis = "Disconnected";
              //     }
              //     return Text(
              //       dis,
              //       style: Theme.of(context).textTheme.headlineLarge                  );
              //   },
              // ),
              Builder(builder: (context){
                    var dis = "";
                    var internet = context.watch<InternetCubit>();
                    var state = internet.state;
                    if (state is InternetConnected && state.connectionType == ConnectionType.wifi){
                      dis = "WIFI";
                    }
                   else if (state is InternetConnected && state.connectionType == ConnectionType.mobile){
                      dis = "Mobile";
                    }
                   else if (state is InternetDisconnected){
                     dis = "Disconnected";
                    }
                    return Text(
                      dis,
                      style: Theme.of(context).textTheme.headlineLarge);
              }),
              // BlocBuilder<CounterCubit, CounterState>(
              //   builder: (context, state) {
              //     return Text(
              //       state.counterValue.toString(),
              //       style: Theme.of(context).textTheme.headlineMedium,
              //     );
              //   },
              // ),
              Builder(builder: (context){
                var counter = context.watch<CounterCubit>();
                return  Text(
                  counter.state.counterValue.toString(),
                           style: Theme.of(context).textTheme.headlineMedium,
                        );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: context.read<CounterCubit>().increment,
                    tooltip: 'Increment',
                    child: const Icon(Icons.exposure_plus_1),
                  ),
                  FloatingActionButton(
                    heroTag: null,                    onPressed: context.read<CounterCubit>().decrement,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("2ndHome");
                    },
                    child: const Text("go to 2nd Page"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("3rdHome");
                    },
                    child: const Text("go to 3rd Page"),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ),
);
  }
}
