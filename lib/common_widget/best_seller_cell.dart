import 'package:flutter/material.dart';
import '../common/color_extenstion.dart';

class BestSellerCell extends StatelessWidget {
  final Map bObj;
  const BestSellerCell({super.key, required this.bObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: media.width * 0.32,
        height: media.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Image.asset(bObj["img"].toString(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bObj["name"].toString(),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    bObj["author"].toString(),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: TColor.subTitle,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: TColor.primary,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        bObj["rating"].toString(),
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
