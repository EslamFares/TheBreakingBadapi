import 'package:breakingbad_api/core/themes/dark_theme.dart';
import 'package:breakingbad_api/views/charDetails/widgets/cahr_img.dart';
import 'package:breakingbad_api/views/home/models/character_model.dart';
import 'package:flutter/material.dart';

class ImgName extends StatelessWidget {
  final CharacterModel charData ;

  const ImgName(this.charData);

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    CahrImg(charData.img.toString()),
                    SizedBox(height: 15),
                    Text(charData.name.toString(),
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
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
                );
  }
}