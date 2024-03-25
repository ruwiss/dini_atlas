import 'dart:math';

class StoryModel {
  final List<Stories> stories;
  final List<StoryCategory> categories;

  StoryModel(this.stories, this.categories);

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    final stories =
        (json['stories'] as List).map((e) => Stories.fromJson(e)).toList();

    final categories = (json['categories'] as List)
        .map((e) => StoryCategory.fromJson(e))
        .toList();

    return StoryModel(stories, categories);
  }

  Map<String, dynamic> toJson() => {
        "stories": stories.map((e) => e.toJson()).toList(),
        "categories": categories.map((e) => e.toJson()).toList(),
      };

  StoryModel.empty()
      : stories = [],
        categories = [];
}

class StoryCategory {
  final int? id;
  final String name;
  final String thumbnail;
  StoryCategory(this.name, this.thumbnail, this.id);

  StoryCategory.createNew(this.name, this.thumbnail)
      : id = Random().nextInt(999);

  StoryCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        thumbnail = json['thumbnail'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
      };
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
  Map<String, dynamic> toJson() => {
        "type": type,
        "list": stories.map((e) => e.toJson()).toList(),
      };
}

enum StoryMediaType { image, video }

class Story {
  final String media;
  final StoryMediaType mediaType;
  final StoryAddon? addon;

  Story({required this.media, required this.mediaType, this.addon});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      media: json['media'],
      mediaType: switch (json['mediaType']) {
        'video' => StoryMediaType.video,
        _ => StoryMediaType.image
      },
      addon: json['addon'] == null ? null : StoryAddon.fromJson(json['addon']),
    );
  }
  Map<String, dynamic> toJson() => {
        "media": media,
        "mediaType": mediaType.name,
        "addon": addon?.toJson(),
      };
}

class StoryAddon {
  final String placeholder;
  final String url;
  StoryAddon(this.placeholder, this.url);

  StoryAddon.fromJson(Map<String, dynamic> json)
      : placeholder = json['placeholder'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        "placeholder": placeholder,
        "url": url,
      };
}
