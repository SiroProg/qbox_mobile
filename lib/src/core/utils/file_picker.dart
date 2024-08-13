import 'package:file_picker/file_picker.dart';

class FilePickerUtils {
  Future<FilePickerResult> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'],
    );
    return result!;
  }

  Future<FilePickerResult> pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    return result!;
  }
}
