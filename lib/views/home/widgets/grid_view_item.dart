import 'package:breakingbad_api/core/themes/dark_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final String imgurl, name;

  const GridViewItem({required this.imgurl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: dSecColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0),
              ),
              child: CachedNetworkImage(
                imageUrl: imgurl,
                placeholder: (context, url) =>
                    Center(child: CupertinoActivityIndicator()),
                errorWidget: (context, url, error) => Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.grey,
                ),
                fit: BoxFit.fill,
              ),
            ),
          )),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0))),
            child: Center(child: Text(name)),
          ),
        ],
      ),
    );
  }
}
