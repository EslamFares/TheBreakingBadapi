import 'package:breakingbad_api/views/home/cubits/home_cubit.dart';
import 'package:breakingbad_api/views/home/componants/home_grid_view.dart';
import 'package:breakingbad_api/views/noInternetRefresh/no_internet_refresh.dart';
import 'package:breakingbad_api/views/nodataRefresh/nodata_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildConditions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   HomeCubit cubit = HomeCubit.get(context);
    if (cubit.internetConnect) {
      return Container(
        padding: EdgeInsets.all(10),
        child: cubit.loading
            ? Center(child: CupertinoActivityIndicator())
            : cubit.noData
                ? NoDataRefresh()
                : HomeGridView(),
      );
    } else {
      return NoInternetRefresh();
    }
  }
}