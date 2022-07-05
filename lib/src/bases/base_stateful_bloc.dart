import 'package:flutter/widgets.dart';
import 'package:flutter_base_bloc/src/bases/base_bloc.dart';
import 'package:flutter_base_bloc/src/bases/base_stateful.dart';

abstract class BaseStatefulBloc<S extends StatefulWidget, B extends BaseBloc>
    extends BaseStateful<S> {
  abstract B bloc;

  @override
  void baseInitState() {
    _initBlocStreamListener();
  }

  @override
  void baseDispose() {
    bloc.close();
  }

  void _initBlocStreamListener() {
    if (!bloc.option().willInitBaseBlocStreamListener) return;
    bloc.stream.listen((event) {});
  }
}
