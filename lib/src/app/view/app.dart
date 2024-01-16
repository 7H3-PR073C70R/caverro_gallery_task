import 'package:canverro_gallery_task/src/core/themes/app_theme.dart';
import 'package:canverro_gallery_task/src/di/locator.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/pages/gallery_page.dart';
import 'package:canverro_gallery_task/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider(
            create: (context) => GalleryCubit(locator())..getImages(),
            child: const GalleryPage(),
          ),
        );
      },
    );
  }
}
