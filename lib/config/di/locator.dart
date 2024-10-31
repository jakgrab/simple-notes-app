import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/config/di/locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void setupDependencies() => getIt.init();
