import 'package:fairshop/model/brand_search.dart';
import 'package:fairshop/pages/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../localizations/language.dart';
import '../model/cart.dart';
import '../model/category.dart';
import '../model/category_search.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../theme/app_theme.dart';
import '../theme/app_theme.dart';
import '../utils/custom_navigation_bar.dart';
import '../utils/images.dart';
import '../utils/widget.dart';

class SingleCategoryScreen extends GetView<HomeController> {
  List<TextIconItem> _textIconChoice = [
    TextIconItem("My Cart", Icons.add),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
    TextIconItem("Adminstrative", Icons.admin_panel_settings),
  ];
   HomeController controller = Get.put(HomeController());
  TabController? _tabController;


  int quantity = 1;
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  String heroTag = FxTextUtils.randomString(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height:Get.height*0.03,
                width: Get.width*0.82,
                child: Obx(()=>
                   ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount:controller.categorylist.length,
                      itemBuilder: (context,int index)
                      {
                        return Obx(()=>
                          InkWell(
                            onTap: (){
                              controller.selectedCategoryId.value=controller.categorylist[index].Id!;
                              controller.selectedCategoryIndex.value=index;
                              controller.singleCategoryProduct.clear();
                              controller.SingleCategoryAllProductList();
                              controller.selectedIndex.value=index;
                            },
                            child: Container(
                              decoration:    controller.selectedCategoryIndex.value==index?BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.blue,
                                          width: 1
                                      )
                                  )
                              ):null,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(controller.categorylist[index].Name.toString(),style:TextStyle(fontSize: 15,color: controller.selectedCategoryIndex.value==index?Colors.blue:Colors.black54,),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              FxContainer(
                borderRadiusAll: 5,
                height:Get.height*0.05,
                width: Get.width*0.12,
                margin: EdgeInsets.all(5),
                padding:EdgeInsets.all(10),
                child:Icon(
                  MdiIcons.swapVertical,
                  color: theme.colorScheme.primary,
                  size:20,
                ),
              )
            ],
          ),
    Obx(()=>
    controller.singleCategoryProduct.isEmpty? Container(
        height: Get.height*0.75,
        child: Center(child: CircularProgressIndicator())
    ):
          Obx(()=>
          Container(
            height: Get.height*0.73,
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.singleCategoryProduct.length,
              itemBuilder: (context,int index)
                {
                  return getSingleProduct(controller.singleCategoryProduct[index]);
                }
            ),
          )


          ),
    )
        ],
      ),
      bottomNavigationBar: Obx(
            () =>BottomAppBar(
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
  Widget getSingleCategory(CategorySearch category) {
    String heroTag = FxTextUtils.randomString(10);
    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 92,
        onTap: () {
        },
        padding: FxSpacing.all(16),
        color: CustomTheme.red.withAlpha(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "http://" + category.imagePath.toString(),
              width: 80,
              height: 80,
            ),
            FxSpacing.height(4),
            FxText.labelSmall(
              category.category.toString(),
              color: theme.colorScheme.onBackground,
            ),

          ],
        ),
      ),
    );
  }
  Widget getSingleProduct(CategorySearch category) {
    String heroKey = FxTextUtils.randomString(10);

    return FxContainer(
      margin: FxSpacing.only(bottom: 8),
      child: Row(
        children: [
          FxContainer(
            color: Colors.white,
            padding: FxSpacing.all(7.5),
            child: Hero(
              tag: heroKey,
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: Image.network("http://"+category.imagePath.toString(),
                    width: 90,
                    height: 90,

                  ),
                ),
              ),
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                FxText.bodyMedium(category.name.toString(),
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                FxSpacing.height(8),
                FxText.labelSmall(category.brand.toString(),
                    color: theme.colorScheme.onBackground, muted: true),
                FxSpacing.height(8),
                FxText.bodyMedium("৳"+category.price.toString(),
                    color: theme.colorScheme.onBackground,
                    fontWeight: 700),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor:customTheme.oliveGreen),
                        onPressed: (){
                          controller.productdetailsName.value=category.name!;
                          controller.productdetailsPrice.value=category.price!;
                          controller.productdetailsImage.value=category.imagePath!;
                          Get.toNamed(AppPages.getProdctDetailsRoute());

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.remove_red_eye,size: 15,),
                            5.width,
                            Text("Details".tr,style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    5.width,
                    Container(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: (){
                          var s=Cart(
                              name: category.name,
                              brand: category.brand,
                              price: category.price,
                              category: category.category,
                              imagePath: category.imagePath
                          );
                          controller.cartlist.add(s);
                          print(controller.cartlist.toList().toString());

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text("Add".tr,style: TextStyle(fontSize: 12),),
                            5.width,
                            Icon(Icons.shopping_basket,size: 15,),
                          ],
                        ),
                      ),
                    )

                  ],
                )

              ],
            ),
          ),
          // Space.width(8),

        ],
      ),
    );
  }

/*  Widget getSingleProduct(CategorySearch category) {
    String heroKey = FxTextUtils.randomString(10);
    return FxContainer(
      margin: FxSpacing.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxContainer(
            color: customTheme.groceryPrimary.withAlpha(32),
            padding: FxSpacing.all(8),
            child: Hero(
              tag: heroKey,
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network("http://"+category.imagePath.toString(),
                  width: 72,
                  height: 72,
                ),
              ),
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyMedium(category.name.toString(),
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                FxSpacing.height(8),
                FxText.labelSmall(category.brand.toString(),
                    color: theme.colorScheme.onBackground, muted: true),
                FxSpacing.height(8),
                FxText.bodyMedium("৳"+category.price.toString(),
                    color: theme.colorScheme.onBackground,
                    fontWeight: 700),
                FxSpacing.height(8),
                Row(

                  children: [
                    ElevatedButton(
                      onPressed: (){
                        controller.productdetailsName.value=category.name!;
                        controller.productdetailsPrice.value=category.price!;
                        controller.productdetailsImage.value=category.imagePath!;
                        Get.toNamed(AppPages.getProdctDetailsRoute());

                      },
                      child: Text("Details"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        onPressed: (){
                          var s=Cart(
                              name: category.name,
                              brand: category.brand,
                              price: category.price,
                              category: category.category,
                              imagePath: category.imagePath
                          );
                          controller.cartlist.add(s);
                          //controller.cartlist.add(category);


                        },
                        child: Text("Cart"),
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
          // Space.width(8),

        ],
      ),
    );
  }*/



}
