import 'package:cached_network_image/cached_network_image.dart';
import 'package:dini_atlas_panel/constants.dart';
import 'package:dini_atlas_panel/extensions/string_extensions.dart';
import 'package:dini_atlas_panel/models/story_model.dart';
import 'package:dini_atlas_panel/services/ftp_service.dart';
import 'package:dini_atlas_panel/ui/views/media/media_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EditorView extends StatefulWidget {
  const EditorView({super.key, required this.fileName, this.isNew = false});
  final String fileName;
  final bool isNew;

  @override
  State<EditorView> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  StoriesModel? _stories;

  List<StoryCategory> get _categories => _stories?.categories ?? [];

  String? _errorText;
  bool _contentSaving = false;

  @override
  void initState() {
    if (!widget.isNew) {
      FTPService.instance.getJsonAsModel(widget.fileName).then((value) {
        _stories = value;
        setState(() {});
      });
    } else {
      _stories = StoriesModel.empty();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.fileName,
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: _contentSaving
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() => _contentSaving = true);
                      FTPService.instance
                          .saveJsonContent(
                        fileName: widget.fileName,
                        json: _stories!.toJson(),
                      )
                          .then((value) {
                        Navigator.of(context).pop();
                      });
                    },
                    icon: const Icon(Icons.save, color: Colors.indigo),
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: !widget.isNew
              ? const CircularProgressIndicator()
              : _editorContent(),
        ),
      ),
    );
  }

  Widget _editorContent() {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          if (_errorText case final String error)
            Text(error, textAlign: TextAlign.center),
          Expanded(child: _storyView()),
        ],
      ),
    );
  }

  bool _storyCreatorVisibility = false;

  Widget _storyView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        children: [
          _storyCategories(),
          if (_showStoryCategoryId != null) ...[
            const Divider(),
            _storiesListView(),
          ],
          const Divider(),
          _storyCreatorVisibility ? _storyCreator() : _createStoryButton(),
        ],
      ),
    );
  }

  bool _showAddCategoryView = false;
  bool _addCategoryUploadProgress = false;
  final _addCategoryInputCtrl = TextEditingController();

  PlatformFile? _pickedCategoryThumbnail;
  String? _pickedCategoryThumbnailFromMedia;

  void _pickCategoryThumbnail() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    _pickedCategoryThumbnail = result?.files.single;
    setState(() {});
  }

  Widget _imagePickerButton(
      {required Widget widget, Function(String choice)? onSelect}) {
    return PopupMenuButton(
      onSelected: onSelect,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: "upload",
          child: Text("Yükle"),
        ),
        PopupMenuItem(
          value: "fromMedia",
          child: Text("Medyadan Seç"),
        ),
      ],
      child: widget,
    );
  }

  int? _showStoryCategoryId;

  Widget _storyCategories() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Kategoriler"),
            TextButton(
              onPressed: () {
                if (_categories.length < 4) {
                  _showAddCategoryView = true;
                  setState(() {});
                }
              },
              child: const Text("Ekle (Max 4)"),
            )
          ],
        ),
        ...List.generate(
          _categories.length,
          (index) {
            final category = _categories[index];
            final storiesIndex =
                _stories?.stories.indexWhere((e) => e.type == category.id) ??
                    -1;
            return ListTile(
              title: Text(category.name),
              subtitle: storiesIndex == -1
                  ? null
                  : Text(
                      "${_stories?.stories[storiesIndex].stories.length} Hikaye"),
              onTap: () {
                if (storiesIndex != -1) {
                  setState(() => _showStoryCategoryId = category.id);
                }
              },
              leading: CachedNetworkImage(
                imageUrl: "$kBaseUrl${category.thumbnail}",
                httpHeaders: kHeaderWithToken,
                height: 35,
                width: 35,
              ),
              trailing: IconButton(
                onPressed: () {
                  _stories!.stories
                      .removeWhere((e) => e.type == _categories[index].id);
                  _categories.removeAt(index);
                  setState(() {});
                },
                icon: const Icon(Icons.remove_circle),
              ),
            );
          },
        ),
        if (_showAddCategoryView)
          ListTile(
            title: TextField(
              controller: _addCategoryInputCtrl,
              decoration: const InputDecoration(hintText: "İsim"),
            ),
            leading: _pickedCategoryThumbnail == null &&
                    _pickedCategoryThumbnailFromMedia == null
                ? _imagePickerButton(
                    widget: const Icon(Icons.add_a_photo),
                    onSelect: (choice) async {
                      if (choice == "upload") {
                        _pickCategoryThumbnail();
                      } else {
                        final fileName = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MediaView(onlyImages: true)));
                        _pickedCategoryThumbnailFromMedia = fileName;
                        setState(() {});
                      }
                    },
                  )
                : const Icon(Icons.check_circle),
            trailing: IconButton(
              onPressed: () async {
                if (_addCategoryInputCtrl.text.isEmpty) return;
                if (_pickedCategoryThumbnail != null) {
                  setState(() => _addCategoryUploadProgress = true);
                  final thumb = await FTPService.instance
                      .uploadMedia(_pickedCategoryThumbnail!);
                  setState(() => _addCategoryUploadProgress = false);
                  _categories.add(
                    StoryCategory.createNew(_addCategoryInputCtrl.text, thumb),
                  );
                } else if (_pickedCategoryThumbnailFromMedia != null) {
                  _categories.add(
                    StoryCategory.createNew(_addCategoryInputCtrl.text,
                        "/story/$_pickedCategoryThumbnailFromMedia"),
                  );
                }
                _showAddCategoryView = false;
                _addCategoryInputCtrl.clear();
                _pickedCategoryThumbnail = null;
                _pickedCategoryThumbnailFromMedia = null;
                setState(() {});
              },
              icon: _addCategoryUploadProgress
                  ? const SizedBox(
                      width: 25, height: 25, child: CircularProgressIndicator())
                  : const Icon(Icons.add),
            ),
          ),
      ],
    );
  }

  Widget _storiesListView() {
    List<Story> stories = [];
    if (_stories != null && _stories!.stories.isNotEmpty) {
      stories = _stories!.stories
          .singleWhere((e) => e.type == _showStoryCategoryId)
          .stories;
    }

    return Column(
      children: [
        Text(
            "${_categories.singleWhere((e) => e.id == _showStoryCategoryId).name} Kategori Hikayeleri"),
        ...List.generate(
          stories.length,
          (index) {
            final Story story = stories[index];
            return ListTile(
              title: Text(
                story.media,
                style: const TextStyle(fontSize: 13),
              ),
              subtitle: story.addon == null
                  ? null
                  : Text(
                      "${story.addon!.placeholder} ${story.addon!.url.isEmpty ? '' : '(${story.addon!.url})'}",
                      style: const TextStyle(fontSize: 10),
                    ),
              trailing: IconButton(
                onPressed: () {
                  stories.removeAt(index);
                  setState(() {});
                },
                icon: const Icon(Icons.close, size: 20),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _createStoryButton() {
    return ElevatedButton(
      onPressed: () => setState(() => _storyCreatorVisibility = true),
      child: const Text("Yeni Hikaye Oluştur"),
    );
  }

  int? _storyCreatorSelectedCategory;
  PlatformFile? _pickedStoryMedia;
  String? _pickedStoryMediaFromMedia;

  final _addonTextCtrl = TextEditingController();
  final _addonUrlCtrl = TextEditingController();

  void _pickStoryMedia() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.media);
    _pickedStoryMedia = result?.files.single;
    setState(() {});
  }

  bool _loadingStoryData = false;

  void _addStoryData() async {
    if ((_pickedStoryMedia == null && _pickedStoryMediaFromMedia == null) ||
        _storyCreatorSelectedCategory == null) {
      return;
    }

    setState(() => _loadingStoryData = true);
    final path = _pickedStoryMedia != null
        ? await FTPService.instance
            .uploadMedia(_pickedStoryMedia!, autoFileName: true)
        : "/story/$_pickedStoryMediaFromMedia";
    setState(() => _loadingStoryData = false);

    final storyIdx = _stories!.stories
        .indexWhere((e) => e.type == _storyCreatorSelectedCategory);

    final StoryAddon? addon = _addonTextCtrl.text.isEmpty
        ? null
        : StoryAddon(_addonTextCtrl.text, _addonUrlCtrl.text);

    final bool isVideo = _pickedStoryMedia != null
        ? _pickedStoryMedia!.extension!.isVideoExtension()
        : _pickedStoryMediaFromMedia!.split('.').last.isVideoExtension();
    final story = Story(
      media: path,
      mediaType: isVideo ? StoryMediaType.video : StoryMediaType.image,
      addon: addon,
    );
    if (storyIdx == -1) {
      // Yeni
      _stories!.stories.add(
        Stories(
          type: _storyCreatorSelectedCategory!,
          stories: [story],
        ),
      );
    } else {
      // Düzenle
      _stories!.stories[storyIdx].stories.add(story);
    }

    _addonTextCtrl.clear();
    _addonUrlCtrl.clear();
    _storyCreatorSelectedCategory = null;
    _storyCreatorVisibility = false;
    _pickedStoryMedia = null;
    setState(() {});
  }

  Widget _storyCreator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Hikaye Ekle", textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.purpleAccent.withOpacity(.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<int>(
                value: _storyCreatorSelectedCategory,
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Kategori Seçiniz"),
                ),
                isDense: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                underline: const SizedBox(),
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                items: _categories
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e.id,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(e.name),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => _storyCreatorSelectedCategory = value);
                },
              ),
              const SizedBox(height: 10),
              _imagePickerButton(
                widget: const Text("MEDYA SEÇ "),
                onSelect: (choice) async {
                  if (choice == "upload") {
                    _pickStoryMedia();
                  } else {
                    final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MediaView()));
                    _pickedStoryMediaFromMedia = result;
                    setState(() {});
                  }
                },
              )
            ],
          ),
        ),
        if (_pickedStoryMedia != null)
          Text(
            _pickedStoryMedia!.name,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 11, color: Colors.black54),
          ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.all(8),
          color: Colors.blueGrey.shade50,
          child: Column(
            children: [
              const Text("İsteğe bağlı açıklama ve kaydırma linki"),
              TextField(
                controller: _addonTextCtrl,
                maxLines: 2,
                style: const TextStyle(fontSize: 13),
                decoration: const InputDecoration(hintText: "Açıklama"),
              ),
              TextField(
                controller: _addonUrlCtrl,
                style: const TextStyle(fontSize: 13),
                decoration: const InputDecoration(hintText: "https://.."),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: _addStoryData,
          child: _loadingStoryData
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(),
                )
              : const Text("Tamam"),
        ),
      ],
    );
  }
}
