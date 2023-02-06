import 'package:flutter/material.dart';

extension Extras on BuildContext {
  void _showSnackBar(
    String message, {
    Color? color,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: color,
      ),
    );
  }

  void showError(String message) {
    _showSnackBar(
      message,
      color: Colors.red,
    );
  }

  void showSuccess(String message) {
    _showSnackBar(
      message,
      color: Colors.green,
    );
  }
}
