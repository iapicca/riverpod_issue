import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'foos.g.dart';

@Riverpod(keepAlive: true)
class Foos extends _$Foos {
  @override
  List<String> build() => <String>[];

  Future<void> initialize() => Future.sync(
        () => state = [for (var i = 0; i < 100; ++i) 'foo'],
      );
}
