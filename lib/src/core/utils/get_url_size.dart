import 'package:http/http.dart' as http;

Future<double> getFileSizeInMB(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    int sizeInBytes = response.contentLength ?? 0;
    double sizeInMB = sizeInBytes / (1024 * 1024);
    double result = double.parse(sizeInMB.toStringAsFixed(2));
    return result;
  } else {
    throw Exception('Failed to load image');
  }
}
