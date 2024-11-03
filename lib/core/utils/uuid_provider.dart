import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: UuidProvider)
class UuidProviderImpl implements UuidProvider {
  @override
  String gen() {
    return const Uuid().v7();
  }
}

abstract interface class UuidProvider {
  String gen();
}
