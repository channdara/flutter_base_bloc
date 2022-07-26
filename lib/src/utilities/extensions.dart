import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/flutter_base_bloc.dart';
import 'package:flutter_base_bloc/src/models/base_success_model.dart';

extension ContextExtension on BuildContext {
  Future<dynamic> push(StatefulWidget screen) async =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  void pushReplaceAll(StatefulWidget screen) {
    Navigator.of(this).popUntil((route) => route.isFirst);
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  void showLoadingDialog() => showDialog(
        context: this,
        builder: (context) => Center(
          child: Platform.isAndroid
              ? const CircularProgressIndicator()
              : const CupertinoActivityIndicator(),
        ),
      );

  void hideLoadingDialog() => pop();

  void showErrorDialog(BaseErrorModel error, {VoidCallback? onPressed}) =>
      showDialog(
        context: this,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Text(
            'Error',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(error.displayMessage),
          actions: [
            TextButton(
              onPressed: () {
                hideLoadingDialog();
                if (onPressed != null) onPressed();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      );

  void showSuccessDialog(BaseSuccessModel success, {VoidCallback? onPressed}) =>
      showDialog(
        context: this,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Text(
            'Success',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(success.message),
          actions: [
            TextButton(
              onPressed: () {
                hideLoadingDialog();
                if (onPressed != null) onPressed();
              },
              child: const Text(
                'OK',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
}
