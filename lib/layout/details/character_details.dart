import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:breakingbad_api/layout/details/list_details_item.dart';
import 'package:breakingbad_api/model/character_model.dart';
import 'package:breakingbad_api/shared/themes/dark_theme.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final index;
  CharacterDetails(this.index);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    HomeCubit cubit = HomeCubit.get(context);
    CharacterModel data = cubit.characterList![index];
    return Scaffold(
        appBar: AppBar(
            // title: Text(data.name.toString()),
            // backgroundColor: Colors.blue.withOpacity(.3),

            ),
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
                      height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage(data.img.toString()),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(height: 15),
                    Text(
                      data.name.toString(),
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
                          data.nickname.toString(),
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
                          info: data.birthday.toString()),
                      ListDetailsItem(
                          iconData: Icons.looks_two,
                          title: 'portrayed',
                          info: data.portrayed.toString()),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'category',
                          info: data.category.toString()),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'occupation',
                          list: data.occupation),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'appearance',
                          list: data.appearance),
                      ListDetailsItem(
                          iconData: Icons.looks,
                          title: 'betterCallSaulAppearance',
                          list: data.betterCallSaulAppearance),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
