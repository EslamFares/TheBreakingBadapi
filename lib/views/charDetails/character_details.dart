import 'package:breakingbad_api/views/home/models/character_model.dart';
import 'package:flutter/material.dart';
import 'compnant/char_info_list.dart';
import 'compnant/img_name.dart';

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
                child: ImgName(charData)
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: CharInfoList(charData)
              )
            ],
          ),
        ));
  }
}