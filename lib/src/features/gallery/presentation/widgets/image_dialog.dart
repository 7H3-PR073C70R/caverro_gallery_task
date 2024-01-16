import 'package:cached_network_image/cached_network_image.dart';
import 'package:canverro_gallery_task/src/core/constants/app_spacing.dart';
import 'package:canverro_gallery_task/src/core/extensions/responsiveness_extension.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/presentation/widgets/image_details.dart';
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
                  GestureDetector(
                onDoubleTap: () {
                  isZoomed = !isZoomed;
                  setState(() {});
                },
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 15,
                  child: CachedNetworkImage(
                    imageUrl: widget.image.downloadUrl ?? '',
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Center(
                        child: CircularProgressIndicator(
                          value:
                              (progress.downloaded) / (progress.totalSize ?? 1),
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
          if(!isZoomed)
          ...[
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
              crossFadeState: isZoomed
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              sizeCurve: Curves.easeInCubic,
            ),
          ],
        ],
      ),
    );
  }
}
