import 'package:url_launcher/url_launcher.dart';

import 'custom_snack_bar.dart';

Future<void> customLaunchUrl(context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(
        context,
        'Cannot launch $url',
      );
    }
  }
}
