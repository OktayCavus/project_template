import 'package:flutter/material.dart';
import 'package:get_it_injectable_example/widgets/custom_loading_dialog.dart';

extension CustomFutureExtension<T> on Future<T> {
  Future<T> makeWithLoadingDialog({required BuildContext context}) async {
    try {
      return await CustomLoadingDialog.showCustomDialog(
          context: context, future: this);
    } catch (error) {
      print('error extension $error');
      rethrow;
    }
  }
}
