import 'package:flutter/material.dart';

extension SizedBoxExt on num {
  Widget get hx {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get wx {
    return SizedBox(
      width: toDouble(),
    );
  }
}
