import 'package:flutter/material.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          image: AssetImage(TImages.loginSignupLogo),
        ),
        Text(translatedStrings?[13] ?? "Connect with Krishi Bindu",
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
            translatedStrings?[14] ??
                "Join our network for tailored agricultural guidance and resources, empowering your farming journey.",
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
