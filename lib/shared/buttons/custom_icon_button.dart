import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.onTap,
      required this.iconData,
      this.color,
      this.iconColor,
      this.imgPath,
      this.gradient,
      this.iconSize,
      this.badgeInfo});

  final VoidCallback? onTap;
  final IconData iconData;
  final Color? color;
  final Color? iconColor;
  final String? imgPath;
  final bool? gradient;
  final double? iconSize;
  final String? badgeInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          // gradient: gradient == true
          //     ? const LinearGradient(
          //         colors: [orange300, pink500],
          //         begin: Alignment.topLeft,
          //         end: Alignment.bottomRight)
          //     : null,
          color: color ?? Colors.green.withOpacity(0.4),
          borderRadius: BorderRadius.circular(50)),
      child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Center(
            child: imgPath != null
                ? badgeInfo == null
                    ? Image.asset(
                        scale: 2.5,
                        imgPath!,
                        height: 45,
                        width: 45,
                        fit: BoxFit.scaleDown,
                      )
                    : Badge(
                        label: Text(badgeInfo!),
                        // backgroundColor: primary,
                        child: Image.asset(
                          scale: 2.5,
                          imgPath!,
                          height: 45,
                          width: 45,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                : badgeInfo == null
                    ? Icon(
                        iconData,
                        color: iconColor ?? Colors.white,
                      )
                    : Badge(
                        label: Text(badgeInfo!),
                        // backgroundColor: primary,
                        child: Icon(
                          iconData,
                          color: iconColor ?? Colors.white,
                        ),
                      ),
          )),
    );
  }
}
