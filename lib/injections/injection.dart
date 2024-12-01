import 'package:construction_mate/injections/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@injectableInit
void configureDependencies() => locator.init();
