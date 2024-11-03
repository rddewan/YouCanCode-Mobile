import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartUpLoading extends ConsumerWidget {
  const StartUpLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
