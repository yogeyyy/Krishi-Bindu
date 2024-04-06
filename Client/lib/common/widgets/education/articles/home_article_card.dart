import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/models/education/articles.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import 'article_display.dart';

class PHomeArticleCard extends StatelessWidget {
  const PHomeArticleCard({
    super.key,
    required this.article,
    required this.cardWidth,
  });

  final double cardWidth;
  final Article article;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => PArticleScreen(article: article)),
      child: Container(
        width: cardWidth,
        height: 90,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),
        child: Row(
          children: [
            PRoundedContainer(
              backgroundColor: TColors.accent,
              child: PRoundedImage(
                isNetworkImage: true,
                imageUrl: article.thumbnailUrl,
                aspectRatio: 1 / 1,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                // Adjust the padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: dark ? Colors.white : TColors.dimgrey,
                          ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),

                    /// Icon with category
                    PCardIconText(
                        iconData: Iconsax.category,
                        iconColor: dark ? TColors.brightpink : TColors.rani,
                        iconSize: 14,
                        title: article.category,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(
                                color:
                                    dark ? TColors.brightpink : TColors.rani)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
