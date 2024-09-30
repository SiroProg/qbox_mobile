import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qbox_mobile/src/core/styles/app_svg.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const NetworkImageWidget({
    required this.imageUrl,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return SvgPicture.string(
        AppSvg.qiFile,
        width: width,
        height: height,
      );
    } else {
      bool isSvg = imageUrl!.toLowerCase().endsWith(".svg");

      if (isSvg) {
        return SvgPicture.network(
          imageUrl!,
          placeholderBuilder: (BuildContext context) => SvgPicture.string(
            AppSvg.qiFile,
            width: width,
            height: height,
          ),
          height: height,
          width: width,
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl!,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => SvgPicture.string(
            AppSvg.qiFile,
            width: width,
            height: height,
          ),
          height: height,
          width: width,
          fit: BoxFit.cover,
        );
      }
    }
  }
}
