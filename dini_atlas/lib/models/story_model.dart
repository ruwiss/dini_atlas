import 'package:dini_atlas/ui/common/constants/app_strings.dart';

class StoriesModel {
  final List<StoryCategory> categories;
  final List<Stories> stories;
  StoriesModel({required this.categories, required this.stories});

  factory StoriesModel.fromJson(Map<String, dynamic> json) {
    final List categoriesJson = json['categories'];
    final List storiesJson = json['stories'];

    return StoriesModel(
      categories: categoriesJson.map((e) => StoryCategory.fromJson(e)).toList(),
      stories: storiesJson.map((e) => Stories.fromJson(e)).toList(),
    );
  }
}

class StoryCategory {
  final int id;
  final String name;
  final String thumbnail;
  double seenPercentage = 0;
  StoryCategory(this.id, this.name, this.thumbnail, this.seenPercentage);

  StoryCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        thumbnail = "$ksBaseUrl${json['thumbnail']}";
}

class Stories {
  /// [type] = category id
  final int type;
  final List<Story> stories;

  Stories({required this.type, required this.stories});

  factory Stories.fromJson(Map<String, dynamic> json) {
    return Stories(
      type: json['type'],
      stories: (json['list'] as List).map((e) => Story.fromJson(e)).toList(),
    );
  }
}

enum StoryMediaType { image, video }

class Story {
  final String media;
  final StoryMediaType mediaType;
  final StoryAddon? addon;

  Story({required this.media, required this.mediaType, this.addon});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      media: "$ksBaseUrl${json['media']}",
      mediaType: switch (json['mediaType']) {
        'video' => StoryMediaType.video,
        _ => StoryMediaType.image
      },
      addon: json['addon'] == null ? null : StoryAddon.fromJson(json['addon']),
    );
  }
}

class StoryAddon {
  final String placeholder;
  final String url;
  StoryAddon(this.placeholder, this.url);

  StoryAddon.fromJson(Map<String, dynamic> json)
      : placeholder = json['placeholder'],
        url = json['url'];
}
