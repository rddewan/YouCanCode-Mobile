import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';
import 'package:youcancode/common/style/dimens.dart';
import 'package:youcancode/features/forgot_password/presentation/controller/forgot_password_controller.dart';
import 'package:youcancode/features/forgot_password/presentation/ui/widget/forgot_password_button.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    return Scaffold(
        appBar: AppBar(
          title: Text('Forgot Password'.hardcoded),
        ),
        body: Padding(
          padding: const EdgeInsets.all(kMedium),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email'.hardcoded,
                    border: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(kSmall))),
                    prefix: const Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email'.hardcoded;
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email'.hardcoded;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: kMedium),
                ForgotPasswordButton(onPressed: _sendForgotPasswordEmail),
              ],
            ),
          ),
        ));
  }

  void _sendForgotPasswordEmail() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      // collect form data from controllers
      final email = _emailController.text;
      // call the service
      ref.read(forgotPasswordControllerProvider.notifier).forgotPassword(email);
    }
  }

  void _clearController() {    
    _emailController.clear();
  }

  void _navigateToLogin() {
    context.go('/login');
  }

  void _listener() {
    // listen for error
    ref.listen(
      forgotPasswordControllerProvider.select((value) => value.error),
      (_, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 5),
              backgroundColor: Colors.red,
              content: Text(next),
            ),
          );
        }
      },
    );

    // listen for success
    ref.listen(
      forgotPasswordControllerProvider.select((value) => value.isEmailSent),
      (_, next) {
        if (next != null && next) {
        showDialog(
          context: context, 
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title:  Text('Email Sent Successfuly'.hardcoded),
              content:  Text('Please check your email for further instructions'.hardcoded),
              actions: [
                TextButton(
                  onPressed: () {
                    // close dialog
                    context.pop();
                    // clear controllers
                    _clearController();
                    // navigate to login
                    _navigateToLogin();
                  }, 
                  child: Text('Ok'.hardcoded)
                ),
              ]
            );
          },
        );
      }
      },
    );
  }
  // listen for success
}
