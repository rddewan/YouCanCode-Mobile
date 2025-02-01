import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'.hardcoded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Home Screen'.hardcoded),
            ElevatedButton(
              onPressed: () {
                // Navigate to setting screen
                context.push('/home/setting');
              },
              child: Text('Setting'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
