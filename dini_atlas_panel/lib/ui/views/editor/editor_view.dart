import 'dart:typed_data';

import 'package:dini_atlas_panel/constants/strings.dart';
import 'package:dini_atlas_panel/models/daily_content.dart';
import 'package:dini_atlas_panel/models/story_model.dart';
import 'package:dini_atlas_panel/services/ftp_service.dart';
import 'package:dini_atlas_panel/ui/views/editor/widgets/content_input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EditorView extends StatefulWidget {
  const EditorView({super.key, required this.fileName});
  final String fileName;

  @override
  State<EditorView> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  (StoriesModel, DailyContents?)? _data;

  final _ayetCtrl = TextEditingController();
  final _ayetKaynakCtrl = TextEditingController();
  final _hadisCtrl = TextEditingController();
  final _hadisKaynakCtrl = TextEditingController();
  final _duaCtrl = TextEditingController();
  final _duaKaynakCtrl = TextEditingController();

  bool _inputValuesSet = false;

  void _setInputValues() {
    final contents = _data?.$2;
    if (contents == null || _inputValuesSet) return;

    _inputValuesSet = true;
    _ayetCtrl.text = contents.ayet.metin;
    _ayetKaynakCtrl.text = contents.ayet.kaynak;
    _hadisCtrl.text = contents.hadis.metin;
    _hadisKaynakCtrl.text = contents.hadis.kaynak;
    _duaCtrl.text = contents.dua.metin;
    _duaKaynakCtrl.text = contents.dua.kaynak;
  }

  @override
  void initState() {
    FTPService.instance.getJsonAsModel(widget.fileName).then((value) {
      _data = value;
      _setInputValues();
      setState(() {});
    });
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: !_inputValuesSet ? const SizedBox() : _editorContent()),
      ),
    );
  }

  Widget _editorContent() {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: "İçerik"),
              Tab(text: "Hikaye"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _contentView(),
                _storyView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentView() {
    return ListView(
      children: [
        ContentInput(
          name: "Günün Ayeti",
          metinCtrl: _ayetCtrl,
          kaynakCtrl: _ayetKaynakCtrl,
        ),
        ContentInput(
          name: "Günün Hadisi",
          metinCtrl: _hadisCtrl,
          kaynakCtrl: _hadisKaynakCtrl,
        ),
        ContentInput(
          name: "Günün Duası",
          metinCtrl: _duaCtrl,
          kaynakCtrl: _duaKaynakCtrl,
        ),
      ],
    );
  }

  Widget _storyView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        children: [
          _storyCategories(),
          const Divider(),
        ],
      ),
    );
  }

  bool _showAddCategoryView = false;
  final _addCategoryInputCtrl = TextEditingController();

  PlatformFile? _pickedCategoryThumbnail;

  void _pickCategoryThumbnail() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    _pickedCategoryThumbnail = result?.files.single;
    setState(() {});
  }

  Widget _storyCategories() {
    final categories = _data?.$1.categories ?? [];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Kategoriler"),
            TextButton(
              onPressed: () {
                if (categories.length < 4) {
                  _showAddCategoryView = true;
                  setState(() {});
                }
              },
              child: const Text("Ekle (Max 4)"),
            )
          ],
        ),
        ...List.generate(
          categories?.length ?? 0,
          (index) {
            final category = categories[index];
            return ListTile(
              title: Text(category.name),
              leading: Image.network(category.thumbnail, height: 35),
              trailing: IconButton(
                onPressed: () {
                  categories.removeAt(index);
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
            leading: IconButton(
              onPressed: _pickCategoryThumbnail,
              icon: _pickedCategoryThumbnail == null
                  ? const Icon(Icons.add_a_photo)
                  : const Icon(Icons.check_circle),
            ),
            trailing: IconButton(
              onPressed: () async {
                if (_pickedCategoryThumbnail != null &&
                    _addCategoryInputCtrl.text.isNotEmpty) {
                  final thumb = await FTPService.instance
                      .uploadMedia(_pickedCategoryThumbnail!);
                  categories.add(
                    StoryCategory.createNew(
                        _addCategoryInputCtrl.text, "$kBaseUrl$thumb"),
                  );
                  _showAddCategoryView = false;
                  _addCategoryInputCtrl.clear();
                  _pickedCategoryThumbnail = null;
                  setState(() {});
                }
              },
              icon: const Icon(Icons.add),
            ),
          ),
      ],
    );
  }
}
