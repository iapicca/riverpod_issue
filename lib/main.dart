import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_issue/bars.dart';

import 'foos.dart';

void main() async {
  final container = ProviderContainer();
  try {
    await container.read(foosProvider.notifier).initialize();
    await container.read(barsProvider.notifier).initialize();
  } catch (e) {
    exit(0);
  }

  runApp(
    ProviderScope(
      parent: container,
      child: const MaterialApp(
        home: Application(),
      ),
    ),
  );
}

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(context, ref) {
    final list = ref.watch(barsProvider);
    //final list = ref.watch(foosProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Text(list[index]),
      ),
    );
  }
}
