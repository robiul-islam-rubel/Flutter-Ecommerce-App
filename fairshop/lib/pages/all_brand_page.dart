
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../model/brand.dart';
import '../model/category.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../utils/widget.dart';

class AllBrandScreen extends GetView<HomeController> {
  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
    TextIconItem("Adminstrative", Icons.admin_panel_settings),
  ];
  HomeController controller = Get.put(HomeController());
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          shrinkWrap: true,
          padding: FxSpacing.fromLTRB(0, 30, 0, 20),
          children:[
            Column(
              //clipBehavior: Clip.none,
              children: <Widget>[
                Column(
                  //clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      width: Get.width*1,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: FxSpacing.xy(12, 8),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    //_scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu_outlined,
                                    size: 24,
                                    color:
                                    theme.colorScheme.onBackground.withAlpha(240),
                                  )),
                              Container(
                                child: Expanded(
                                  // flex: 1,
                                  child: Padding(
                                    padding: FxSpacing.fromLTRB(16, 0, 8, 0),
                                    child: Container(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Search here",
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder: InputBorder.none,
                                            isDense: true),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Icon(Icons.search),
                              12.width,
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: customTheme.groceryPrimary.withAlpha(28),
                                child:  Icon(Icons.keyboard_voice),
                              ),
                              Stack(

                                children: [
                                  Obx(()=>
                                      Positioned(
                                        left: 28,
                                        right: 0,
                                        top: 0,
                                        bottom: 10,
                                        child:CircleAvatar(
                                            radius: 10,
                                            child: Text(controller.cartlist.length.toString())
                                        ),
                                      ),
                                  ),
                                  PopupMenuButton(
                                    onSelected: (value){
                                      if(value=="My Cart")
                                      {
                                        Get.toNamed(AppPages.getCartPageRoute());
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return _textIconChoice.map((TextIconItem choice) {
                                        return PopupMenuItem(
                                          value: choice.text,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(choice.iconData,
                                                  size: 18,
                                                  color: theme.colorScheme.onBackground),
                                              FxSpacing.width(8),
                                              Text(choice.text,
                                                  style: TextStyle(letterSpacing: 0.15)
                                                      .merge(theme.textTheme.bodyText2)
                                                      .merge(TextStyle(
                                                      color: theme
                                                          .colorScheme.onBackground)))
                                            ],
                                          ),
                                        );
                                      }).toList();
                                    },
                                    color: theme.backgroundColor,
                                  ),
                                ],
                              )


                            ],
                          ),
                        ),
                      ),
                    ),



                  ],
                ),

              ],
            ),
            Container(
            padding: FxSpacing.fromLTRB(20,20,20,0),
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: FxSpacing.zero,
                mainAxisSpacing: 20,
                childAspectRatio: 4 / 4,
                crossAxisSpacing: 20,
                children: List.generate(controller.brandlist.length, (index) {
                  return getSingleBrand(controller.brandlist[index]);
                }
                )
            ),
          ),
    ]
        )
    );
  }
  Widget getSingleBrand(Brand brand) {
    String heroTag = FxTextUtils.randomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        height: 150,
        width: 100,
        onTap: () {
          Get.toNamed(AppPages.getSingleBrandRoute());
        },
        color: customTheme.groceryPrimary.withAlpha(28),
        child: Column(
          children: [
            Image.network(
              "http://" + brand.ImagePath.toString(),
              width: 80,
              height: 80,
            ),
            FxSpacing.height(4),
            FxText.labelSmall(
              brand.Name.toString(),
              color: theme.colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }
}