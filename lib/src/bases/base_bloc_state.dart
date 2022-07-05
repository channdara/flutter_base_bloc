import 'package:flutter_base_bloc/src/models/base_error_model.dart';

abstract class BaseBlocState {}

class BaseBlocInit extends BaseBlocState {}

class BaseBlocLoading extends BaseBlocState {}

class BaseBlocLoaded extends BaseBlocState {}

class BaseBlocError extends BaseBlocState {
  BaseBlocError(this.error);

  final BaseErrorModel error;
}
