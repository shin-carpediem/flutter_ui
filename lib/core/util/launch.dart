import 'package:url_launcher/url_launcher.dart';

void launchGitHub() async {
  const url = 'https://github.com/shin-carpediem/flutter_ui';
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
    );
  } else {
    throw 'This URL is unavairable.';
  }
}
