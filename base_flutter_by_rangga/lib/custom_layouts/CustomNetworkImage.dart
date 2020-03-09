import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'CustomShimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height, width, borderRadius;
  final BoxFit fit;
  final bool shimmerActive;
  final String imgPlaceholderAsset;

  const CustomNetworkImage(
      {Key key,
      this.imageUrl,
      this.height,
      this.width,
      this.borderRadius = 0.0,
      this.fit = BoxFit.cover,
      this.shimmerActive = true,
      this.imgPlaceholderAsset = "assets/images/common_placeholder.png",
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetWithoutZoom = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: shimmerActive
          ? CustomShimmer(
              height: height,
              width: width,
            )
          : CachedNetworkImage(
              imageUrl: imageUrl.toString(),
              placeholder: (context, url) {
                return CustomShimmer(
                  height: height,
                  width: width,
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  height: height,
                  width: width,
                  child: Image.asset(
                    this.imgPlaceholderAsset,
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                );
              },
              height: height,
              width: width,
              fit: fit,
            ),
    );

    return widgetWithoutZoom;
  }
}
