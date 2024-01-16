import 'package:canverro_gallery_task/bootstrap.dart';
import 'package:canverro_gallery_task/src/app/view/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.dev');
  await bootstrap(() => const App());
}
