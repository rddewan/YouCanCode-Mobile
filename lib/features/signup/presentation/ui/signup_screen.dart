

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/features/signup/presentation/ui/widget/signup_form_list.dart';

class SingUpScreen extends ConsumerStatefulWidget {
  const SingUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends ConsumerState<SingUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const SignUpFormList(),
    );
  }
}