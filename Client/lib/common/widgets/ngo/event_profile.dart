import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/ngo/people_donating.dart';
import 'package:solution_challenge/common/widgets/success_screen/success_screen.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/features/donate/screens/ngo/ngo.dart';
import 'package:solution_challenge/models/event.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import '../../../utils/datetime/date_time.dart';

import '../appbar/appbar.dart';
import '../icons/circular_heart.dart';

class PEventProfile extends StatefulWidget {
  const PEventProfile({
    super.key,
    required this.cardWidth,
    required this.event,
  });

  final Event event;
  final double cardWidth;

  @override
  _PEventProfileState createState() => _PEventProfileState();
}

class _PEventProfileState extends State<PEventProfile> {
  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        backArrowColor: dark ? Colors.white : TColors.dimgrey,
        actions: const [
          PCircularHeart(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Column(
            children: [
              PRoundedImage(
                isNetworkImage: true,
                imageUrl: widget.event.banner,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.title,
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: dark ? TColors.brightpink : TColors.rani),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    PCardIconText(
                      iconData: Iconsax.location,
                      iconColor: TColors.battleship,
                      title: widget.event.location,
                      titleStyle: Theme.of(context).textTheme.titleSmall!.apply(
                            color: dark ? Colors.white : TColors.battleship,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const PPeopleDonated(
                      userPhotos: [
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                        'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      ],
                      numberOfPeople: 120,
                      text: 'attending',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    PCardIconText(
                      iconData: Iconsax.calendar,
                      title: formatDateFromString(widget.event.uploadDate.toString()),
                      titleStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: dark ? Colors.white : Colors.black,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    PCardIconText(
                      iconData: Iconsax.clock,
                      iconColor: Colors.black,
                      title: formatTimeString(widget.event.uploadDate.toString()),
                      titleStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: dark ? Colors.white : Colors.black,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Divider(
                      color: dark
                          ? TColors.battleship
                          : TColors.battleship.withOpacity(0.5),
                      thickness: 0.9,
                      indent: 5,
                      endIndent: 5,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Text(
                      translatedStrings?[71] ?? "Description",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: dark ? TColors.brightpink : TColors.burgandy,
                            fontWeightDelta: 2,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Text(
                      widget.event.description,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.8)
                                : TColors.dimgrey,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: TSizes.md),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              backgroundColor: TColors.rani,
              textColor: Colors.white,
              image: TImages.registrationSuccess,
              title: translatedStrings?[75] ?? "You're In!",
              subTitle:
                  translatedStrings?[76] ?? "Thank you for joining the donation event. Your support makes a difference!",
              onPressed: () => Get.to(() => const NgoScreen()))),
          child: Text(translatedStrings?[77] ?? 'Register'),
        ),
      ),
    );
  }
}
