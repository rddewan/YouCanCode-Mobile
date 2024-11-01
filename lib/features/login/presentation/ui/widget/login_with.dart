import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';

class LoginWith extends ConsumerWidget {
  const LoginWith({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Text("or login with".hardcoded),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.android, color: Colors.blue),
            onPressed: () {
              // Handle Google login
            },
          ),
          IconButton(
            icon: const Icon(Icons.apple, color: Colors.black),
            onPressed: () {
              // Handle Apple login
            },
          ),
        ],
      ),
    ]);
  }
}
