import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'foos.dart';

part 'bars.g.dart';

@Riverpod(keepAlive: true, dependencies: [Foos])
class Bars extends _$Bars {
  @override
  List<String> build() => <String>[];

  Future<void> initialize() =>
      Future.sync(() => [for (final _ in ref.read(foosProvider)) 'bar']);
}
