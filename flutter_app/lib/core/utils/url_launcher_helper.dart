import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> launch(String urlString) async {
    try {
      final uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
          webOnlyWindowName: urlString.startsWith('mailto:') ? null : '_blank',
        );
      } else {
        debugPrint('Could not launch URL: $urlString');
      }
    } catch (e) {
      debugPrint('Error launching URL ($urlString): $e');
    }
  }

  static const String linkedIn = 'https://linkedin.com/in/lhsiung';
  static const String instagram = 'https://instagram.com/film.foto.lan';
  static const String github = 'https://github.com/lawrencehsiung/lawrencejhsiung';
  static const String email = 'mailto:ljhlucidshowcars@gmail.com';
  static const String resumePdf = 'assets/docs/Lawrence_Hsiung_Resume.pdf';
}
