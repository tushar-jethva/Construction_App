import 'package:flutter/foundation.dart';

extension DebugPrintExtension on Object? {
  void log() {
    debugPrint(this?.toString());
  }
}
