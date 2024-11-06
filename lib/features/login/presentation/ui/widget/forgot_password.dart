import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {
            // Navigate to signup screen
            context.push('/login/forgotPassword');
          },
          child: Text(
            "Forgot Password?".hardcoded,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
