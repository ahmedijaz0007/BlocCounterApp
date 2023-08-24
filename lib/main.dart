import 'package:blocpractice/countercubit/countercubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
  listener: (context, state) {
    if(state.isIncremented?? true){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incremented!'),duration: Duration(milliseconds: 300),));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Decremented!'),duration: Duration(milliseconds: 300),));

    }
  },
  child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
  builder: (context, state) {
    return Text(
              state.counterValue.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
  },
),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed:BlocProvider.of<CounterCubit>(context).increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.exposure_plus_1),
                ),
                FloatingActionButton(
                  onPressed: BlocProvider.of<CounterCubit>(context).decrement,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.exposure_minus_1),
                ),
              ],
            )
          ],
        ),
      ),
),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
