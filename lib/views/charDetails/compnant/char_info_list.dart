import 'package:breakingbad_api/core/themes/dark_theme.dart';
import 'package:breakingbad_api/views/charDetails/widgets/char_list_details_item.dart';
import 'package:breakingbad_api/views/home/models/character_model.dart';
import 'package:flutter/material.dart';

class CharInfoList extends StatelessWidget {
  final CharacterModel charData;
  const CharInfoList(this.charData);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      height: h * .55,
      decoration: BoxDecoration(
          color: dSecColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: ListView(
        children: [
          CharListDetailsItem(
              iconData: Icons.looks_one,
              title: 'birthday',
              info: charData.birthday.toString()),
          CharListDetailsItem(
              iconData: Icons.looks_two,
              title: 'portrayed',
              info: charData.portrayed.toString()),
          CharListDetailsItem(
              iconData: Icons.looks,
              title: 'category',
              info: charData.category.toString()),
          CharListDetailsItem(
              iconData: Icons.looks,
              title: 'occupation',
              list: charData.occupation),
          CharListDetailsItem(
              iconData: Icons.looks,
              title: 'appearance',
              list: charData.appearance),
          CharListDetailsItem(
              iconData: Icons.looks,
              title: 'betterCallSaulAppearance',
              list: charData.betterCallSaulAppearance),
        ],
      ),
    );
  }
}
