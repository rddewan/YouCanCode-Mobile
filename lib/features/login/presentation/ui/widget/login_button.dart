import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';
import 'package:youcancode/common/style/dimens.dart';
import 'package:youcancode/features/login/presentation/controller/login_controller.dart';

class LoginButton extends ConsumerWidget {
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loginControllerProvider.select((value) => value.isLoading));
        
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: kMedium),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSmall)),
        ),
        label: Text(
          'Login'.hardcoded,
          style: const TextStyle(fontSize: kMedium),
        ),
        icon: isLoading
            ? const CircularProgressIndicator.adaptive()
            : const Icon(Icons.person_add),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
