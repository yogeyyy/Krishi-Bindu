import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/white_search_container.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_appbar.dart';
import 'package:solution_challenge/features/donate/screens/ngo/widgets/ngo_categories.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

import '../../../../common/widgets/ngo/sections/CampaignSection.dart';
import '../../../../common/widgets/ngo/sections/EventSection.dart';
import '../../../../common/widgets/ngo/sections/OrganistionSection.dart';

class NgoScreen extends StatelessWidget {
  const NgoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Appbar
                  const PNgoAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// SearchBar
                  PWhiteSearchContainer(
                    text: translatedStrings?[39] ?? "Search Organizations",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Categories
                  PNgoCategories(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ],
              ),
            ),

            /// Body
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  PCampaignSection(
                    sectionHeading: 'New Campaigns',
                    initiativeType: 'Campaigns',
                    cardHeight: 256,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  POrganisationSection(
                    sectionHeading: 'Organizations',
                    initiativeType: 'Organizations',
                    cardHeight: 80,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  PEventSection(
                    sectionHeading: 'Upcoming Events',
                    initiativeType: 'Events',
                    cardHeight: 202,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
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
