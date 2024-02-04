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
