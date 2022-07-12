import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NsuCabIcons {
  static const String back = 'assets/images/svgs/back.svg';
  static const String nsuStar = 'assets/images/svgs/nsu_star.svg';
  static const String owl = 'assets/images/svgs/owl.svg';

  // emoji
  static const String viva = 'assets/images/emoji/viva.png';
  static const String fingerDown = 'assets/images/emoji/finger_down.png';
}

class NsuCabIcon extends StatelessWidget {
  final String svgAsset;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  const NsuCabIcon(
    this.svgAsset, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      this.svgAsset,
      key: key,
      width: size,
      height: size,
      color: color,
      semanticsLabel: semanticLabel,
    );
  }
}
