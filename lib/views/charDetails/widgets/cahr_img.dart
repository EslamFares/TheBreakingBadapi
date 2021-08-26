import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CahrImg extends StatelessWidget {
  final String imgUrl;

  const CahrImg(this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 3, color: Colors.amber),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
