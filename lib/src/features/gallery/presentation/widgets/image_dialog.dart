import 'package:cached_network_image/cached_network_image.dart';
import 'package:canverro_gallery_task/src/core/constants/app_spacing.dart';
import 'package:canverro_gallery_task/src/core/extensions/responsiveness_extension.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/widgets/image_details.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/widgets/shrinkable.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({required this.image, super.key});

  final ImageModel image;

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog>
    with SingleTickerProviderStateMixin {
  bool isZoomed = false;
  Tween<double> tween = Tween<double>(begin: 0.5, end: 1);
  double offsetX = 0;
  double offsetY = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.black.withOpacity(.5),
      child: Column(
        children: [
          Expanded(
            child: TweenAnimationBuilder<double>(
              tween: tween,
              duration: const Duration(milliseconds: 200),
              builder: (BuildContext context, double? value, Widget? child) =>
                  Transform.scale(
                scale: value ?? 1,
                child: GestureDetector(
                  onDoubleTap: () {
                    if (isZoomed) {
                      offsetX = 0.0;
                      offsetY = 0.0;
                      tween = Tween<double>(begin: 2, end: 1);
                    } else {
                      tween = Tween<double>(begin: 1, end: 3);
                    }
                    isZoomed = !isZoomed;
                    setState(() {});
                  },
                  onHorizontalDragUpdate: (details) {
                    if (isZoomed) {
                      setState(() {
                        offsetX += details.primaryDelta ?? 0.0;
                      });
                    }
                  },
                  onVerticalDragUpdate: (details) {
                    if (isZoomed) {
                      setState(() {
                        offsetY += details.primaryDelta ?? 0.0;
                      });
                    }
                  },
                  child: Transform.translate(
                    offset: Offset(offsetX, offsetY),
                    child: Shrinkable(
                      child: CachedNetworkImage(
                        imageUrl: widget.image.downloadUrl ?? '',
                        fit: BoxFit.cover,
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
                ),
              ),
            ),
          ),
          AppSpacing.verticalSpaceSmall,
          AnimatedCrossFade(
            firstChild: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.radius,
                vertical: 24.radius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageDetails(
                    title: 'Id',
                    description: widget.image.id ?? '',
                  ),
                  ImageDetails(
                    title: 'Author',
                    description: widget.image.author ?? '',
                  ),
                  ImageDetails(
                    title: 'Width',
                    description: widget.image.width?.toString() ?? '',
                  ),
                  ImageDetails(
                    title: 'Height',
                    description: widget.image.height?.toString() ?? '',
                  ),
                  ImageDetails(
                    title: 'Url',
                    description: widget.image.url ?? '',
                  ),
                  ImageDetails(
                    title: 'Download Url',
                    description: widget.image.downloadUrl ?? '',
                  ),
                ],
              ),
            ),
            secondChild: const SizedBox.shrink(),
            crossFadeState:
                isZoomed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
            sizeCurve: Curves.easeInCubic,
          ),
        ],
      ),
    );
  }
}
