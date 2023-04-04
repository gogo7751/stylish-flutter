import 'package:flutter/material.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/widget/text_style.dart';

class DetailBottom extends StatelessWidget {
  const DetailBottom({
    super.key,
    required this.productDetail,
  });

  final ProductDetail productDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[
                        Colors.blue,
                        Color.fromARGB(255, 140, 198, 245)
                      ],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                  child: const Center(
                    child: TextWithStyle(
                      text: '細部說明',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Divider(
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            TextWithStyle(
              text: productDetail.detail,
              color: Colors.grey,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productDetail.images.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset(productDetail.images[index],
                      fit: BoxFit.fill),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
