import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:story_view/story_view.dart';
import 'story_viewmodel.dart';

class StoriesView extends StackedView<StoryViewModel> {
  const StoriesView({super.key, required this.stories});
  final Stories stories;

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
            Positioned(
              top: 60,
              right: 20,
              child: StreamBuilder<PlaybackState>(
                stream: viewModel.controller.playbackNotifier.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      viewModel.currentStory.mediaType !=
                          StoryMediaType.video) {
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StoryViewModel viewModelBuilder(BuildContext context) => StoryViewModel();

  @override
  void onViewModelReady(StoryViewModel viewModel) {
    viewModel.init(stories);
    super.onViewModelReady(viewModel);
  }
}
