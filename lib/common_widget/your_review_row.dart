import 'package:flutter/material.dart';
import '../common/color_extenstion.dart';

class YourReviewRow extends StatelessWidget {
  final Map sObj;
  const YourReviewRow({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                sObj["description"].toString(),
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: TColor.subTitle.withValues(alpha: 0.3),
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Read more >",
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: TColor.subTitle.withValues(alpha: 0.3),
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: List.generate(5, (index) => Icon(
                  Icons.star,
                  color: TColor.primary,
                  size: 15,
                )),
              ),
            ],
          )),
          const SizedBox(
            width: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(sObj["img"].toString(),
                width: media.width * 0.15,
                height: media.width * 0.15 * 1.6,
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
