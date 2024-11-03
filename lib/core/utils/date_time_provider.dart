import 'package:injectable/injectable.dart';

abstract interface class DateTimeProvider {
  DateTime get now;
}

@LazySingleton(as: DateTimeProvider)
class DateTimeProviderImpl implements DateTimeProvider {
  @override
  DateTime get now => DateTime.now();
}
