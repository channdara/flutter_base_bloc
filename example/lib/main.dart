import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/flutter_base_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseStatefulBloc<MyHomePage, CounterBloc> {
  @override
  CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                return Text(
                  '${bloc.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterBloc extends BaseBloc {
  int counter = 0;

  void increment() {
    onBaseLoading();
    Future.delayed(const Duration(seconds: 1), () {
      onBaseLoaded();
      counter++;
      if (counter == 5) {
        onBaseError(BaseErrorModel(message: 'Maximum reached'));
        counter = 0;
      }
      emit(CounterIncreased());
    });
  }
}

class CounterIncreased extends BaseBlocState {}
