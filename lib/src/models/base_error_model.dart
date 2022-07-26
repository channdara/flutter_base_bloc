class BaseErrorModel {
  BaseErrorModel({required this.message, this.code = 0});

  final String message;
  final int code;

  String get displayMessage => code == 0 ? message : '$code: $message';
}
