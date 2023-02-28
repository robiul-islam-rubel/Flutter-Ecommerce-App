
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../theme/app_theme.dart';
import '../utils/images.dart';

class PageDetailsScreen extends GetView<HomeController> {
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            FeatherIcons.chevronLeft,
            size: 20,
          ),
        ),
        title: Obx(()=>
            FxText.titleMedium(controller.pageheading.value, fontWeight: 600,color: Colors.white,)
        ),
      ),
      body: Obx(()=>
          ListView.builder(
            itemCount: controller.pageDetails.length,
            itemBuilder: (context,int index)
              {
                return ListView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FxText.bodyMedium(controller.pageDetails[index].shortDescription.toString(),
                            fontWeight: 500,
                            color: theme.colorScheme.onBackground),
                      ),
                    ),
                    10.height,
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FxText.bodyMedium(
                            controller.pageDetails[index].description.toString(),
                            fontWeight: 500,
                            color: theme.colorScheme.onBackground),
                      ),
                    ),

                  ],
                );
              }
          )

      )


    );

  }

}