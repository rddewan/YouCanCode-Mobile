import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';
import 'package:youcancode/common/style/dimens.dart';
import 'package:youcancode/features/signup/presentation/controller/sign_up_controller.dart';
import 'package:youcancode/features/signup/presentation/ui/widget/already_have_account.dart';
import 'package:youcancode/features/signup/presentation/ui/widget/signup_button.dart';

class SignUpFormList extends ConsumerStatefulWidget {
  const SignUpFormList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormListState();
}

class _SignUpFormListState extends ConsumerState<SignUpFormList> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    // controllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // dispose controllers
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    return Padding(
      padding: const EdgeInsets.all(kMedium),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name'.hardcoded,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kSmall))),
                prefix: const Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name'.hardcoded;
                }
                return null;
              },
            ),
            const SizedBox(height: kMedium),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email'.hardcoded,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kSmall))),
                prefix: const Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email'.hardcoded;
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email'.hardcoded;
                }
                return null;
              },
            ),
            const SizedBox(height: kMedium),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password'.hardcoded,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kSmall))),
                prefix: const Icon(Icons.lock),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password'.hardcoded;
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long'
                      .hardcoded;
                }
                return null;
              },
            ),
            const SizedBox(height: kMedium),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password'.hardcoded,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kSmall))),
                prefix: const Icon(Icons.lock),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password'.hardcoded;
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long'
                      .hardcoded;
                } else if (value != _passwordController.text) {
                  return 'Passwords do not match'.hardcoded;
                }
                return null;
              },
            ),
            const SizedBox(height: kExtraLarge),
            SignUpButton(onPressed: _onSubmit),
            const SizedBox(height: kExtraLarge),
            AlreadyHaveAccount(onPressed: _navigateToLogin),
          ],
        ),
      ),
    );
  }

  void _listener() {
    // listen for error
    ref.listen(signUpControllerProvider.select((value) => value.error),
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
    });
    // listen for success
    ref.listen(
        signUpControllerProvider.select((value) => value.isSignUpSuccess),
        (_, next) {
      if (next != null && next) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
                title: Text('Sign Up Successful'.hardcoded),
                content: Text(
                    'Please check your email for verification and please  verify your account'
                        .hardcoded),
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
                      child: Text('Ok'.hardcoded)),
                ]);
          },
        );
      }
    });
  }

  void _clearController() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  void _navigateToLogin() {
    context.go('/login');
  }

  void _onSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      // collect form data from controllers
      final formData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        'passwordConfirm': _confirmPasswordController.text,
      };

      // set form data
      ref.read(signUpControllerProvider.notifier).setFormData(formData);
      // sign up - call api
      ref.read(signUpControllerProvider.notifier).signUp();
    }
  }
}
