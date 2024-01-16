import 'package:canverro_gallery_task/src/core/extensions/responsiveness_extension.dart';
import 'package:flutter/material.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.fontSize,
        ),
        children: [
          TextSpan(
            text: description,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
