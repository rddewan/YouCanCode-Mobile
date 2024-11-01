

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';
import 'package:youcancode/features/signup/presentation/ui/widget/signup_form_list.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'.hardcoded),
      ),
      body: const SignUpFormList(),
    );
  }
}