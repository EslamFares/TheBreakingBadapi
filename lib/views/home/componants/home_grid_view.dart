import 'package:breakingbad_api/views/home/cubits/home_cubit.dart';
import 'package:breakingbad_api/views/charDetails/character_details.dart';
import 'package:breakingbad_api/views/home/models/character_model.dart';
import 'package:flutter/material.dart';
import '../widgets/grid_view_item.dart';

class HomeGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    List<CharacterModel> charData = cubit.searchController.text.isNotEmpty
        ? cubit.searchList!
        : cubit.characterList!;

    if (charData.length > 0) {
      return GridView.builder(
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CharacterDetails(charData[index])));
            },
            child: GridViewItem(
                imgurl: charData[index].img.toString(),
                name: charData[index].name.toString())),
        itemCount: charData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .65,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
      );
    } else {
      return Center(child: Text('No Data'));
    }
  }
}
