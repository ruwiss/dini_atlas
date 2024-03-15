extension StringExtensions on String {
  bool isVideoExtension() {
    // Desteklenen video uzantılarını buraya ekleyebilirsiniz
    var videoExtensionsWithDot = [
      '.mp4',
      '.avi',
      '.mkv',
      '.mov',
      '.wmv',
      '.flv',
      '.webm',
      '.mpeg'
    ];
    var videoExtensions = [
      'mp4',
      'avi',
      'mkv',
      'mov',
      'wmv',
      'flv',
      'webm',
      'mpeg'
    ];

    // Uzantıyı alma
    var extension = toLowerCase();

    // Uzantının video uzantıları listesinde olup olmadığını kontrol etme
    return videoExtensionsWithDot.contains(extension) ||
        videoExtensions.contains(extension);
  }
}
