import 'package:flutter/material.dart';

import '../common/color_extenstion.dart';

class TopPicksCell extends StatelessWidget {
  final Map iObj;
  const TopPicksCell({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        width: media.width * 0.32,
        height: media.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: media.width * 0.32,
              height: media.width * 0.50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 2),
                        blurRadius: 5)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(iObj["img"].toString(),
                    width: media.width * 0.32,
                    height: media.width * 0.50,
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    iObj["name"].toString(),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    iObj["author"].toString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.subTitle,
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
