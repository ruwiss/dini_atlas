// ignore_for_file: public_member_api_docs, sort_constructors_first
enum EContentTypes { sure, hadis, dua }

class ContentTypes {
  final EContentTypes type;
  final bool hidePlayButton;
  final bool hideShareButton;
  final bool hideBookmarkButton;
  ContentTypes({
    required this.type,
    required this.hidePlayButton,
    required this.hideShareButton,
    required this.hideBookmarkButton,
  });

  ContentTypes copyWith({
    EContentTypes? type,
    bool? hidePlayButton,
    bool? hideShareButton,
    bool? hideBookmarkButton,
  }) {
    return ContentTypes(
      type: type ?? this.type,
      hidePlayButton: hidePlayButton ?? this.hidePlayButton,
      hideShareButton: hideShareButton ?? this.hideShareButton,
      hideBookmarkButton: hideBookmarkButton ?? this.hideBookmarkButton,
    );
  }

  ContentTypes.suraType()
      : type = EContentTypes.sure,
        hidePlayButton = false,
        hideShareButton = false,
        hideBookmarkButton = false;

  ContentTypes.suraTypeFavorite()
      : type = EContentTypes.sure,
        hidePlayButton = true,
        hideShareButton = false,
        hideBookmarkButton = false;
}
