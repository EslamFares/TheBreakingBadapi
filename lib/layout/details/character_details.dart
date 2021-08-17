import 'package:breakingbad_api/layout/details/list_details_item.dart';
import 'package:breakingbad_api/model/character_model.dart';
import 'package:breakingbad_api/shared/themes/dark_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel charData;
  CharacterDetails(this.charData);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: w,
          height: h,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                top: 0,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.amber),
                        // borderRadius: BorderRadius.circular(15.0),
                        // image: DecorationImage(
                        //     image: NetworkImage(charData.img.toString()),
                        //     fit: BoxFit.fitWidth)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: CachedNetworkImage(
                          imageUrl: charData.img.toString(),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      charData.name.toString(),
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: dSecColor,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: Text(
                          charData.nickname.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.withOpacity(.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  height: h * .55,
                  decoration: BoxDecoration(
                      color: dSecColor, //Colors.blue.withOpacity(.5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0))),
                  child: ListView(
                    children: [
                      ListDetailsItem(
                          iconData: Icons.looks_one,
                          title: 'birthday',
                          info: charData.birthday.toString()),
                      ListDetailsItem(
                          iconData: Icons.looks_two,
                          title: 'portrayed',
                          info: charData.portrayed.toString()),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'category',
                          info: charData.category.toString()),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'occupation',
                          list: charData.occupation),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'appearance',
                          list: charData.appearance),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'betterCallSaulAppearance',
                          list: charData.betterCallSaulAppearance),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
