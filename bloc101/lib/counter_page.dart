import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Counter'),
      ),
      body: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterView(),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Counter',
            style: TextStyle(fontSize: 24),
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.count}',
                style: TextStyle(fontSize: 48),
              );
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(IncrementEvent());
                },
                child: Icon(Icons.add),
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(DecrementEvent());
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
