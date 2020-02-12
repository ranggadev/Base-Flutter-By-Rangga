import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'MyShimmer.dart';

class MyNetworkImageZoom extends StatelessWidget {
  final String imageUrl;
  final double height, width, borderRadius;
  final BoxFit fit;
  final bool shimmerActive;
  final String heroTag;
  final int heroTagIndex;

  const MyNetworkImageZoom(
      {Key key,
      this.imageUrl,
      this.height,
      this.width,
      this.borderRadius = 0.0,
      this.fit = BoxFit.cover,
      this.shimmerActive = true,
      this.heroTag = "a",
      this.heroTagIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetWithZoom = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: () {
          if (shimmerActive == false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _MyZoomableImg(
                  imgUrl: imageUrl,
                  heroTag: heroTag,
                  heroTagIndex: heroTagIndex,
                ),
              ),
            );
          }
        },
        child: Hero(
          tag: "$heroTag-$heroTagIndex",
          child: shimmerActive
              ? MyShimmer(
                  height: height,
                  width: width,
                )
              : CachedNetworkImage(
                  imageUrl: imageUrl,
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
        ),
      ),
    );

    return widgetWithZoom;
  }
}

class _MyZoomableImg extends StatelessWidget {

  final String imgUrl, heroTag;
  final int heroTagIndex;

  const _MyZoomableImg({Key key, this.imgUrl, this.heroTag, this.heroTagIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Hero(
        tag: "$heroTag-$heroTagIndex",
        child: Container(
          color: Colors.black,
          child: PhotoView(
            imageProvider: NetworkImage(imgUrl)
          ),
        )
      ),
    );
  }
}