import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_builder.dart';
import 'package:solution_challenge/common/widgets/ngo/progress_bar.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:solution_challenge/features/education/screens/resources/widgets/education_appbar.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/education/articles/article_column_display.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/viewall/viewall_cards.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// AppBar
            const PEducationAppbar(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///SearchBar
            PSearchContainer(
              text: translatedStrings?[92] ?? "Search Resources",
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///Body
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Featured videos
                  PSectionHeading(
                    title: translatedStrings?[41] ?? 'Featured Videos',
                    textColor: dark ? Colors.white : Colors.black,
                    onPressed: () => Get.to(() => const PViewAllScreen(
                      initiativeType: 'Videos',
                    )),
                  ),
                  const SizedBox(
                    height: 265,
                    child: VideoBuilder(),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Latest Articles
                  PSectionHeading(
                    title: translatedStrings?[42] ?? 'Latest Articles',
                    textColor: dark ? Colors.white : Colors.black,
                    onPressed: () => Get.to(() => const PViewAllScreen(
                      initiativeType: 'Articles',
                    )),
                  ),
                  const SizedBox(
                    height: 330,
                    child: ArticleColumnBuilder(),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}