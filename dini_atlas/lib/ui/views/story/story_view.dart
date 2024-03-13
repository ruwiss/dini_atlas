import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
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
      body: StoryView(
        storyItems: viewModel.storyList,
        controller: viewModel.controller,
        indicatorColor: kcPrimaryColorLight,
        onComplete: viewModel.onStoryCompleted,
        onStoryShow: (storyItem, index) => viewModel.onStoryShow(index),
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
