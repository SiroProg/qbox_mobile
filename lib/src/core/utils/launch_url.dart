import 'logger.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await launchUrl(uri)) {
    info('Launched $url');
  } else {
    throw 'Could not launch $url';
  }
}
