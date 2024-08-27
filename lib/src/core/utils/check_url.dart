bool isUrlImage(String string) {
  const String urlPattern =
      r'^(http|https):\/\/[^\s$.?#].[^\s]*\.(png|jpg|jpeg|gif|avif)$';
  final bool result = RegExp(urlPattern, caseSensitive: false).hasMatch(string);
  return result;
}

bool isUrlFile(String string) {
  const String urlPattern =
      r'^(http|https):\/\/[^\s$.?#].[^\s]*\.(pdf|doc|docx|xls|xlsx|ppt|pptx)$';
  final bool result = RegExp(urlPattern, caseSensitive: false).hasMatch(string);
  return result;
}

bool isUrlVideo(String string) {
  const String urlPattern =
      r'^(http|https):\/\/[^\s$.?#].[^\s]*\.(mp4|avi|mov|wmv)$';
  final bool result = RegExp(urlPattern, caseSensitive: false).hasMatch(string);
  return result;
}

bool isUrlAudio(String string) {
  const String urlPattern =
      r'^(http|https):\/\/[^\s$.?#].[^\s]*\.(mp3|wav|ogg|aac|flac)$';
  final bool result = RegExp(urlPattern, caseSensitive: false).hasMatch(string);
  return result;
}
