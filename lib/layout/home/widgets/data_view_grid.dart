import 'package:breakingbad_api/cubit/home/home_cubit.dart';
import 'package:breakingbad_api/layout/details/character_details.dart';
import 'package:breakingbad_api/model/character_model.dart';
import 'package:breakingbad_api/shared/themes/dark_theme.dart';
import 'package:flutter/material.dart';

class DataViewGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    List<CharacterModel> charData = cubit.searchController.text.isNotEmpty
        ? cubit.searchList!
        : cubit.characterList!;

    return (charData.length > 0)
        ? GridView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CharacterDetails(index)));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: dSecColor,
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: NetworkImage(charData[index].img.toString()),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0))),
                      child:
                          Center(child: Text(charData[index].name.toString())),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: charData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .7,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
          )
        : Center(child: Text('No Data'));
  }
}
