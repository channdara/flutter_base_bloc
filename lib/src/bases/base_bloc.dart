import 'package:flutter/widgets.dart';
import 'package:flutter_base_bloc/src/bases/base_bloc_state.dart';
import 'package:flutter_base_bloc/src/models/base_bloc_option.dart';
import 'package:flutter_base_bloc/src/models/base_error_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseBloc extends Cubit<BaseBlocState> {
  BaseBloc() : super(BaseBlocInit());

  BaseBlocOption get option => BaseBlocOption();

  @protected
  void onBaseLoading() => emit(BaseBlocLoading());

  @protected
  void onBaseLoaded() => emit(BaseBlocLoaded());

  @protected
  void onBaseError(BaseErrorModel error) => emit(BaseBlocError(error));
}
