import 'package:breakingbad_api/shared/themes/dark_theme.dart';
import 'package:flutter/material.dart';

class ListDetailsItem extends StatelessWidget {
  final String title;
  final String? info;
  final IconData iconData;
  final List? list;
  ListDetailsItem(
      {required this.title, this.info, required this.iconData, this.list});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: dPrimaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: w * .5 - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(iconData),
                SizedBox(width: 20),
                Flexible(
                  child: Text(
                    title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: w * .5 - 20,
            // color: Colors.red,
            child: list == null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        info != null ? info! : 'noData',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : Expanded(
                    child: Center(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                    child: Text(
                                  '${list![index]}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                            SizedBox(height: 10)
                          ],
                        ),
                        itemCount: list!.length,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
