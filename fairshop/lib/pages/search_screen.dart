import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../localizations/language.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../theme/custom_theme.dart';

class SearchScreen extends GetView<HomeController>
{
  TabController? _tabController;
  String heroTag = FxTextUtils.randomString(10);
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  String heroKey = FxTextUtils.randomString(10);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
       padding: EdgeInsets.only(top: 30,left: 10,right: 10),
       children:<Widget> [
         Column(
           //clipBehavior: Clip.none,
           children: <Widget>[
             Container(
               height: Get.height*.09,
               width: Get.width*1,
               child: Card(
                 elevation: 3,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(0),
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
                               child: TextFormField(
                                 decoration: InputDecoration(
                                     hintText:"Search here",
                                     border: InputBorder.none,
                                     focusedBorder: InputBorder.none,
                                     enabledBorder: InputBorder.none,
                                     disabledBorder: InputBorder.none,
                                     errorBorder: InputBorder.none,
                                     focusedErrorBorder: InputBorder.none,
                                     isDense: true
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ),
                       CircleAvatar(
                         radius: 16,
                         backgroundColor: Colors.black54,
                         child:  Icon(Icons.search,size: 16,color: Colors.white,),
                       ),
                       10.width,
                       CircleAvatar(
                         radius: 16,
                         backgroundColor: Colors.red,
                         child:  Icon(Icons.keyboard_voice,size: 16,color: Colors.white,),
                       ),
                       10.width,
                       CircleAvatar(
                         radius: 16,
                         backgroundColor: Colors.blue,
                         child: Center(
                             child:Icon(Icons.more_vert,size: 16,color: Colors.white,)
                           /* PopupMenuButton(
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
                                  ),*/
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ],
         ),


       ],
     ),
     bottomNavigationBar: Obx(
         ()=>
             BottomAppBar(
               elevation: 0,
               color: customTheme.card,
               shape: CircularNotchedRectangle(),
               child: DefaultTabController(
                 initialIndex: controller.currentIndex.value,
                 length: 4,
                 child: FxContainer(
                   color: customTheme.card,
                   padding: EdgeInsets.only(top: 12, bottom: 12),
                   child: TabBar(
                     onTap: (value)
                     {
                       controller.setCurrentIndex(value);
                     },
                     controller: _tabController,
                     indicator: BoxDecoration(),
                     indicatorSize: TabBarIndicatorSize.tab,
                     indicatorColor: theme.colorScheme.primary,
                     tabs: <Widget>[
                       Container(
                         child: (controller.currentIndex.value == 0)
                             ? Column(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             Icon(
                               MdiIcons.store,
                               color: theme.colorScheme.primary,
                             ),
                             Container(
                               margin: EdgeInsets.only(top: 4),
                               decoration: BoxDecoration(
                                   color: theme.primaryColor,
                                   borderRadius: new BorderRadius.all(
                                       Radius.circular(2.5))),
                               height: 5,
                               width: 5,
                             )
                           ],
                         )
                             : Icon(
                           MdiIcons.storeOutline,
                           color: theme.colorScheme.onBackground,
                         ),
                       ),
                       Container(
                           margin: EdgeInsets.only(
                             left: Language.autoDirection(0, 20)!,
                             right: Language.autoDirection(20, 0)!,
                           ),
                           child: (controller.currentIndex.value == 1)
                               ? Column(
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                               Icon(
                                 MdiIcons.magnify,
                                 color: theme.colorScheme.primary,
                               ),
                               Container(
                                 margin: EdgeInsets.only(top: 4),
                                 decoration: BoxDecoration(
                                     color: theme.primaryColor,
                                     borderRadius: new BorderRadius.all(
                                         Radius.circular(2.5))),
                                 height: 5,
                                 width: 5,
                               )
                             ],
                           )
                               : Icon(
                             MdiIcons.magnify,
                             color: theme.colorScheme.onBackground,
                           )),
                       Container(
                           margin: EdgeInsets.only(
                             left: Language.autoDirection(20, 0)!,
                             right: Language.autoDirection(0, 20)!,
                           ),
                           child: (controller.currentIndex.value == 2)
                               ? Column(
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                               Icon(
                                 MdiIcons.tag,
                                 color: theme.colorScheme.primary,
                               ),
                               Container(
                                 margin: EdgeInsets.only(top: 4),
                                 decoration: BoxDecoration(
                                     color: theme.primaryColor,
                                     borderRadius: new BorderRadius.all(
                                         Radius.circular(2.5))),
                                 height: 5,
                                 width: 5,
                               )
                             ],
                           )
                               : Icon(
                             MdiIcons.tagOutline,
                             color: theme.colorScheme.onBackground,
                           )),
                       Container(
                           child: (controller.currentIndex.value == 3)
                               ? Column(
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                               Icon(
                                 MdiIcons.account,
                                 color: theme.colorScheme.primary,
                               ),
                               Container(
                                 margin: EdgeInsets.only(top: 4),
                                 decoration: BoxDecoration(
                                     color: theme.primaryColor,
                                     borderRadius: new BorderRadius.all(
                                         Radius.circular(2.5))),
                                 height: 5,
                                 width: 5,
                               )
                             ],
                           )
                               : Icon(
                             MdiIcons.accountOutline,
                             color: theme.colorScheme.onBackground,
                           )),
                     ],
                   ),
                 ),
               ),
             ),
     ),
     floatingActionButton:  FloatingActionButton(
       onPressed: () {
         Get.toNamed(AppPages.getCartPageRoute());

       },
       child: Obx(()=>
       controller.cartlist.length==0?Icon(
         MdiIcons.cartOutline,
         color: theme.colorScheme.primary,
       ):Text(controller.cartlist.length.toString(),style: TextStyle(color: Colors.red),),
       ),
       backgroundColor: theme.backgroundColor,
     ),
     floatingActionButtonLocation:
     FloatingActionButtonLocation.centerDocked,
   );
  }

}