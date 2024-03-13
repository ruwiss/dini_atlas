import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/services/remote/story_service.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_tab_viewmodel.dart';
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
          final stories =
              await locator<StoryService>().filterStories(category.id);
          final val = await locator<NavigationService>()
              .navigateToStoryView(stories: stories);
          if (val) viewModel.getStoryViews();
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
                  child: Image.network(
                    category.thumbnail,
                    fit: BoxFit.cover,
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
