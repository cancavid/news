import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedImage extends StatelessWidget {
  const MyCachedImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: 200.0,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
