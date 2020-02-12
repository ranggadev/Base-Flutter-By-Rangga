import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'MyShimmer.dart';

class MyNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height, width, borderRadius;
  final BoxFit fit;
  final bool shimmerActive;

  const MyNetworkImage(
      {Key key,
      this.imageUrl,
      this.height,
      this.width,
      this.borderRadius = 0.0,
      this.fit = BoxFit.cover,
      this.shimmerActive = true,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetWithoutZoom = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: shimmerActive
          ? MyShimmer(
              height: height,
              width: width,
            )
          : CachedNetworkImage(
              imageUrl: imageUrl.toString(),
              placeholder: (context, url) {
                return MyShimmer(
                  height: height,
                  width: width,
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  height: height,
                  width: width,
                  child: Image.asset(
                    "assets/image_common/placeholder.jpg",
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
