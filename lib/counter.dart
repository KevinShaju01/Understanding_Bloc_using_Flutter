import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class counter extends StatelessWidget {
  const counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter"),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Counter"),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text("${state.count}");
                },
              )
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          isExtended: true,
          onPressed: () {
            context.read<CounterBloc>().add(Increment());
          },
        ));
  }
}
