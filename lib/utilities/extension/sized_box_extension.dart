import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExt on num {
  Widget get hx {
    return toDouble().h.verticalSpace;
  }

  Widget get wx {
    return toDouble().w.horizontalSpace;
  }
}
