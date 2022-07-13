import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:nsu_cab/bootstrap.dart';
import 'package:nsu_cab/locator.dart';
import 'package:nsu_cab/modules/app/view/app.dart';

Future<void> main() async {
  Intl.defaultLocale = 'ru_RU';

  await dotenv.load(
    fileName: '.env',
  );

  initGetIt();

  bootstrap(() => const App());
}
