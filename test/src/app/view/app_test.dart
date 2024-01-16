import 'package:canverro_gallery_task/src/app/view/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app ...', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that ScreenUtilInit is rendered.
    expect(find.byType(ScreenUtilInit), findsOneWidget);
  });
}
