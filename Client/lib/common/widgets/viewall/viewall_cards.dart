import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/white_search_container.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_card.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/ngo/event_card.dart';
import 'package:solution_challenge/common/widgets/ngo/organization_card.dart';
import 'package:solution_challenge/models/campaign.dart';
import 'package:solution_challenge/models/event.dart';
import 'package:solution_challenge/models/organisation.dart';
import 'package:solution_challenge/services/campaign_service.dart';
import 'package:solution_challenge/services/education/video_service.dart';
import 'package:solution_challenge/services/event_service.dart';
import 'package:solution_challenge/services/ngo_service.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import '../../../models/education/articles.dart';
import '../../../models/education/video.dart';
import '../../../services/education/article_service.dart';
import '../education/articles/home_article_card.dart';

class PViewAllScreen extends StatelessWidget {
  const PViewAllScreen({super.key, required this.initiativeType});

  final String initiativeType;

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
                  PAppBar(
                    showBackArrow: true,
                    title: Text(
                      initiativeType,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  PWhiteSearchContainer(
                    text: 'Search $initiativeType',
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            if (initiativeType == 'Campaigns')
              FutureBuilder<List<Campaign>>(
                future: CampaignService.getAllCampaigns(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Column(
                        children: snapshot.data!.map((campaign) {
                          return Column(
                            children: [
                              PCampaignCard(
                                cardWidth: PHelperFunctions.screenWidth(),
                                rightMargin: EdgeInsets.zero,
                                campaign: campaign,
                              ),
                              const SizedBox(height: 16),
                              // Add space between items
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            if (initiativeType == 'Videos')
              FutureBuilder<List<Video>>(
                future: VideoService.getVideos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Column(
                      children: snapshot.data!.map((video) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: TSizes.defaultSpace),
                              child: PVideoCard(
                                video: video,
                                cardWidth: PHelperFunctions.screenWidth(),
                                rightMargin: EdgeInsets.zero,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Add space between items
                          ],
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            if (initiativeType == 'Events')
              FutureBuilder<List<Event>>(
                future: EventService().getEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Column(
                      children: snapshot.data!.map((event) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: TSizes.defaultSpace),
                              child: PEventCard(
                                cardWidth: PHelperFunctions.screenWidth(),
                                rightMargin: EdgeInsets.zero,
                                event: event,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Add space between items
                          ],
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            if (initiativeType == 'Organizations')
              FutureBuilder<List<NGO>>(
                future: NGOService().getAllNGOs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Column(
                      children: snapshot.data!.map((ngo) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.defaultSpace),
                          child: Column(
                            children: [
                              POrganizationCard(
                                cardWidth: PHelperFunctions.screenWidth(),
                                rightMargin: EdgeInsets.zero,
                                ngo: ngo,
                              ),
                              const SizedBox(height: TSizes.spaceBtwSections),
                              // Add space between cards
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            if (initiativeType == 'Articles')
              FutureBuilder<List<Article>>(
                future: ArticleService.getAllArticles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Column(
                      children: snapshot.data!.map((article) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.defaultSpace),
                          child: PHomeArticleCard(
                            article: article,
                            cardWidth: PHelperFunctions.screenWidth(),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
