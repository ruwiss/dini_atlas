import 'package:cached_network_image/cached_network_image.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/services/remote/daily_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab_viewmodel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class StoryCircleViews extends StatelessWidget {
  const StoryCircleViews({super.key, required this.viewModel});
  final HomeTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final stories = viewModel.storiesModel;
    if (stories == null) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              stories.categories.length,
              (index) {
                final category = stories.categories[index];
                return _storyCircle(category: category);
              },
            ).toList(),
          ),
        ),
      );
    }
  }

  Widget _storyCircle({required StoryCategory category}) {
    const double size = 55;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () async {
          FirebaseAnalytics.instance.logSelectContent(
              contentType: "story_category", itemId: category.name);

          final (categories, stories) =
              await locator<DailyService>().filterStories(category.id);
          await locator<NavigationService>()
              .navigateToStoriesView(categories: categories, stories: stories)
              .then((_) => viewModel.getStoryViews());
        },
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: size,
                  width: size,
                  child: CircularProgressIndicator(
                    value: category.seenPercentage,
                    color: kcPurpleColorMedium,
                    backgroundColor: kcBlueGrayColor,
                    strokeWidth: 4.5,
                  ),
                ),
                Container(
                  height: size,
                  width: size,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kcBackgroundColor,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: category.thumbnail,
                    fit: BoxFit.cover,
                    httpHeaders: {"token": ksToken},
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
