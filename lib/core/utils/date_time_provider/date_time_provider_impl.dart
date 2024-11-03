import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/utils/date_time_provider/date_time_provider.dart';

@LazySingleton(as: DateTimeProvider)
class DateTimeProviderImpl implements DateTimeProvider {
  @override
  DateTime get now => DateTime.now();
}
