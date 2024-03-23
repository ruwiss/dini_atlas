import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/story_model.dart';
import 'package:dini_atlas/services/remote/daily_service.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_services/stacked_services.dart';
import "package:story_view/story_view.dart";
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryViewModel extends BaseViewModel {
  final controller = StoryController();
  final _storyService = locator<DailyService>();
  final _navigationService = locator<NavigationService>();

  late List<Stories> _stories;
  late List<StoryCategory> _categories;

  void init(List<StoryCategory> categories, List<Stories> stories) {
    _categories = categories;
    _stories = stories;
    _loadAd();
  }

  final _interstitialAdService =
      AdmobInterstitialAdService(adUnitId: ksAdmobInterstitital3);

  bool _interstitalAdLoaded = false;
  bool _adShown = false;

  void _loadAd() async {
    _interstitialAdService.loadAd(
      onAdLoaded: () => _interstitalAdLoaded = true,
      onAdDismissed: () => controller.play(),
    );
  }

  List<Story> get _storyList => _stories.expand((e) => e.stories).toList();
  StoryCategory getStoriesCategory(Stories ee) =>
      _categories.singleWhere((e) => e.id == ee.type);

  List<StoryItem> get storyList => _stories
      .expand(
        (ee) => ee.stories.map((e) {
          if (e.mediaType == StoryMediaType.video) {
            return StoryItem.pageVideo(
              e.media,
              requestHeaders: {"token": ksToken} as Map<String, dynamic>?,
              controller: controller,
              errorWidget: const Text("Bir sorun oluştu"),
            );
          } else {
            return StoryItem.pageImage(
              url: e.media,
              requestHeaders: {"token": ksToken} as Map<String, dynamic>?,
              controller: controller,
              errorWidget: const Text("Bir sorun oluştu"),
              duration: const Duration(seconds: 5),
              caption: e.addon == null
                  ? null
                  : Text(e.addon!.placeholder, textAlign: TextAlign.center),
            );
          }
        }).toList(),
      )
      .toList();

  late Story currentStory = _stories.first.stories[0];
  late StoryCategory currentCategory = getStoriesCategory(_stories.first);
  void onStoryShow(int index) async {
    currentStory = _storyList[index];

    currentCategory = getStoriesCategory(_stories[_stories.indexWhere(
        (e) => e.stories.indexWhere((ee) => ee == currentStory) != -1)]);
    _storyService.markStoryAsSeen(currentStory.media);
    if (_interstitalAdLoaded) {
      await Future.delayed(
          const Duration(seconds: 1), () => controller.pause());
      _interstitialAdService.interstitialAd?.show();
      _adShown = true;
    }
  }

  void onStoryCompleted() {
    _navigationService.back(result: 1);
    if (!_adShown && _interstitalAdLoaded) {
      _interstitialAdService.interstitialAd?.show();
    }
  }

  void onShareButtonTap() async {
    controller.pause();
    await _storyService.shareMedia(currentStory.media);
    controller.play();
  }

  void onVerticalSwipe(Direction? direction) async {
    if (direction == Direction.up && currentStory.addon != null) {
      await launchUrl(
        Uri.parse(currentStory.addon!.url),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
