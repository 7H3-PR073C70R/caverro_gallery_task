import 'package:cached_network_image/cached_network_image.dart';
import 'package:canverro_gallery_task/src/core/extensions/responsiveness_extension.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/widgets/image_dialog.dart';
import 'package:canverro_gallery_task/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<GalleryCubit>().getImages();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.radius,
          vertical: 24.radius,
        ),
        child: BlocBuilder<GalleryCubit, GalleryState>(
          builder: (context, state) {
            if (state.viewState.isProcessing && state.images.isNotEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Scrollbar(
              controller: _scrollController,
              interactive: true,
              scrollbarOrientation: ScrollbarOrientation.right,
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 5,
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: state.images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog<dynamic>(
                        context: context,
                        builder: (BuildContext context) {
                          return ImageDialog(
                            image: state.images[index],
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: state.images[index].downloadUrl ?? '',
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                              child: CircularProgressIndicator(
                                value: (progress.downloaded) /
                                    (progress.totalSize ?? 1),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
