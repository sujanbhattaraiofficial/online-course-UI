import 'package:design_course/sizeConfig.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget potrait;
  final Widget landscape;

  const ResponsiveWidget({Key key, this.potrait, this.landscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.isMobilePortrait && SizeConfig.isPortrait) {
      return potrait;
    }
    return landscape;
  }
}
