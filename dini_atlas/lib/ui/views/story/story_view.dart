import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/constants/app_images.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:story_view/story_view.dart';
import 'story_viewmodel.dart';

class StoriesView extends StackedView<StoryViewModel> {
  const StoriesView(
      {super.key, required this.stories, required this.categories});
  final List<Stories> stories;
  final List<StoryCategory> categories;

  @override
  Widget builder(
    BuildContext context,
    StoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Stack(
          children: [
            StoryView(
              storyItems: viewModel.storyList,
              controller: viewModel.controller,
              indicatorColor: kcPrimaryColorLight,
              onComplete: viewModel.onStoryCompleted,
              onStoryShow: (storyItem, index) => viewModel.onStoryShow(index),
              onVerticalSwipeComplete: viewModel.onVerticalSwipe,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                left: 16,
                right: 16,
              ),
              child: _profileView(viewModel),
            ),
            Positioned(
              top: 60,
              right: 20,
              child: _shareButton(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileView(StoryViewModel viewModel) {
    return StreamBuilder<PlaybackState>(
      stream: viewModel.controller.playbackNotifier.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage:
                    NetworkImage(viewModel.currentCategory.thumbnail,
                    headers: {"token": ksToken}
                    ),
              ),
              horizontalSpaceSmall,
              Text(
                viewModel.currentCategory.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  StreamBuilder<PlaybackState> _shareButton(StoryViewModel viewModel) {
    return StreamBuilder<PlaybackState>(
      stream: viewModel.controller.playbackNotifier.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            viewModel.currentStory.mediaType != StoryMediaType.video) {
          return CircleAvatar(
            radius: 19,
            backgroundColor: kcGrayColor.withOpacity(.5),
            child: IconButton(
              onPressed: viewModel.onShareButtonTap,
              icon: SvgPicture.asset(
                kiShare,
                height: 17,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  StoryViewModel viewModelBuilder(BuildContext context) => StoryViewModel();

  @override
  void onViewModelReady(StoryViewModel viewModel) {
    viewModel.init(categories, stories);
    super.onViewModelReady(viewModel);
  }
}
