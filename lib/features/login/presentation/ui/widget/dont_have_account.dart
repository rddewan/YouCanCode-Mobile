import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';

class DontHaveAccount extends ConsumerWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?".hardcoded,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to signup screen
            context.push('/signup');
          },
          child: Text(
            "Sign up".hardcoded,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
