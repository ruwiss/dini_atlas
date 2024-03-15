import 'package:cached_network_image/cached_network_image.dart';
import 'package:dini_atlas_panel/constants.dart';
import 'package:dini_atlas_panel/extensions/string_extensions.dart';
import 'package:dini_atlas_panel/services/ftp_service.dart';
import 'package:flutter/material.dart';

class MediaView extends StatefulWidget {
  const MediaView({
    super.key,
    this.onlyImages = false,
    this.onlyVideos = false,
    this.viewer = false,
  });
  final bool onlyImages;
  final bool onlyVideos;
  final bool viewer;

  @override
  State<MediaView> createState() => _MediaViewState();
}

class _MediaViewState extends State<MediaView> {
  List<String> _fileNames = [];
  String? _removingFile;

  void _getFiles() async {
    FTPService.instance.getMediaFiles().then((value) {
      value.removeWhere((e) => e.length < 3);
      if (widget.onlyImages) {
        value.removeWhere((e) => e.split('.').last.isVideoExtension());
      } else if (widget.onlyVideos) {
        value.removeWhere((e) => !e.split('.').last.isVideoExtension());
      }

      setState(() => _fileNames = value);
    });
  }

  @override
  void initState() {
    _getFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewer ? "Yüklenen Medyalar" : "Medya Seçin",
            style: const TextStyle(fontSize: 16)),
      ),
      body: _fileNames.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (context, index) {
                final name = _fileNames[index];
                final isVideo = name.split(".").last.isVideoExtension();
                return widget.viewer
                    ? PopupMenuButton(
                        onSelected: (value) async {
                          setState(() => _removingFile = name);
                          await FTPService.instance.removeMedia(name);
                          _fileNames.removeWhere((e) => e == name);
                          setState(() => _removingFile = null);
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: "delete",
                            child: Text("SİL"),
                          ),
                        ],
                        child: _listTile(name, isVideo, context),
                      )
                    : _listTile(name, isVideo, context);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _fileNames.length),
    );
  }

  ListTile _listTile(String name, bool isVideo, BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: _removingFile != name ? null : const CircularProgressIndicator(),
      trailing: isVideo
          ? const Icon(Icons.video_collection)
          : CachedNetworkImage(
              imageUrl: "$kBaseUrl/story/$name",
              httpHeaders: kHeaderWithToken,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
      onTap: widget.viewer ? null : () => Navigator.of(context).pop(name),
    );
  }
}
