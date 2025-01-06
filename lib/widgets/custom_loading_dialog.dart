import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});

  static Future<T> showCustomDialog<T>({
    required BuildContext context,
    required Future<T> future,
  }) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black45,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const CustomLoadingDialog();
      },
    );

    try {
      final result = await future;

      if (context.mounted) {
        Navigator.pop(context);
      }

      return result;
    } catch (error) {
      if (context.mounted) {
        Navigator.pop(context);

        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }

      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
