import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

import '../../../../utils/constants/sizes.dart';

class RegisteredEventsScreen extends StatelessWidget {
  const RegisteredEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  ///Appbar
                  PAppBar(
                    showBackArrow: true,
                    title: Text(
                      translatedStrings?[104] ?? 'Registered Events',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.defaultSpace,),
            /// Events card Future Builder
          ],
        ),
      ),
    );
  }
}
