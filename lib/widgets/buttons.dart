import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final Color textColor;
  final Color iconColor;
  const CustomIconButton({super.key, required this.icon, required this.title, required this.color, required this.textColor, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
             icon,
              height: 24,
              width: 24,
              color: iconColor
            ),
            SizedBox(width:4,),
            Text(title,
            style: TextStyle(
              color: textColor
            ),)

          ],
        ),
      ),
    );
  }
}


class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 0.5,
                color: Colors.white
            ),
            color: Colors.black.withOpacity(0.40),
            shape: BoxShape.circle
        ),
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Center(child: SvgPicture.asset("assets/icons/play-1001-svgrepo-com.svg",
            height: 28,
            width: 28,
            color: Colors.white,)),
        ));
  }
}
