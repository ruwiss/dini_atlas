import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/services/remote/story_service.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_services/stacked_services.dart';
import "package:story_view/story_view.dart";
import 'package:stacked/stacked.dart';

class StoryViewModel extends BaseViewModel {
  final controller = StoryController();
  final _storyService = locator<StoryService>();
  final _navigationService = locator<NavigationService>();

  late Stories _stories;

  void init(Stories stories) {
    _stories = stories;
  }

  List<StoryItem> get storyList => _stories.stories.map((e) {
        if (e.mediaType == StoryMediaType.video) {
          return StoryItem.pageVideo(
            e.media,
            controller: controller,
            errorWidget: const Text("Bir sorun oluştu"),
          );
        } else {
          return StoryItem.pageImage(
            url: e.media,
            controller: controller,
            errorWidget: const Text("Bir sorun oluştu"),
            duration: const Duration(seconds: 5),
            caption: e.addon == null
                ? null
                : Text(e.addon!.placeholder, textAlign: TextAlign.center),
          );
        }
      }).toList();

  void onStoryShow(int index) =>
      _storyService.markAsSeen(_stories.stories[index].media);

  void onStoryCompleted() => _navigationService.back(result: 1);
}
