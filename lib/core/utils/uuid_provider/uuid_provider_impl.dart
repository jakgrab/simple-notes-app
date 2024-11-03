import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/utils/uuid_provider/uuid_provider.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: UuidProvider)
class UuidProviderImpl implements UuidProvider {
  @override
  String generateNewUuid() {
    return const Uuid().v7();
  }
}
