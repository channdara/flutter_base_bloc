import 'package:flutter/widgets.dart';
import 'package:flutter_base_bloc/src/bases/base_bloc.dart';
import 'package:flutter_base_bloc/src/bases/base_bloc_state.dart';
import 'package:flutter_base_bloc/src/bases/base_stateful.dart';
import 'package:flutter_base_bloc/src/utilities/extensions.dart';

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
    if (!bloc.option.willInitBaseBlocStreamListener) return;
    bloc.stream.listen((event) {
      if (bloc.option.willShowBaseLoading && event is BaseBlocLoading) {
        context.showLoadingDialog();
      }
      if (bloc.option.willShowBaseLoading && event is BaseBlocLoaded) {
        context.hideLoadingDialog();
      }
      if (bloc.option.willShowBaseError && event is BaseBlocError) {
        context.showErrorDialog(event.error);
      }
    });
  }
}
