


import 'package:fairshop/model/brand_search.dart';
import 'package:fairshop/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../localizations/language.dart';
import '../model/category_search.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../theme/app_theme.dart';
import '../theme/app_theme.dart';
import '../utils/custom_navigation_bar.dart';
import '../utils/images.dart';
import '../utils/widget.dart';
import 'package:path/path.dart' as Path;
import 'database_helper.dart';


class SingleBrandScreen extends GetView<HomeController> {

  List<TextIconItem> _textIconChoice = [
    TextIconItem("My Cart".tr, Icons.add),
    TextIconItem("Contact".tr, Icons.email),
    TextIconItem("Setting".tr, Icons.build),
    TextIconItem("Adminstrative".tr, Icons.admin_panel_settings),
  ];

  TabController? _tabController;
  int quantity = 1;
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  String heroTag = FxTextUtils.randomString(10);
  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height:Get.height*0.03,
                  width: Get.width*0.82,
                  child: Obx(()=>
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:controller.brandlist.length,
                          itemBuilder: (context,int index)
                          {

                            return Obx(()=>
                                InkWell(
                                  onTap: (){
                                    controller.selectedBrandId.value=controller.brandlist[index].Id!;
                                    controller.SingleBrandAllProductList();
                                    controller.singleBrandProduct.clear();
                                    controller.selectedIndex.value=controller.selectedBrandId.value;
                                    controller.selectedBrandIndex.value=index;


                                  },
                                  child: Container(
                                    decoration: controller.selectedBrandIndex.value==index?BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.blue,
                                                width: 1
                                            )
                                        )
                                    ):null,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Obx(()=>
                                        Text(controller.brandlist[index].Name.toString(),style:TextStyle(fontSize: 15,color: controller.selectedBrandIndex.value==index?Colors.blue:Colors.black54,),
                                        ),
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
              controller.singleBrandProduct.isEmpty? Container(
                height: Get.height*0.75,
                  child: Center(child: CircularProgressIndicator())
              ):
              Obx(()=>
                  Container(
                    height: Get.height*0.75,
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.singleBrandProduct.length,
                        itemBuilder: (context,int index)
                        {
                          return getSingleProduct(controller.singleBrandProduct[index],context);
                        }
                    ),
                  )


              ),
            ),
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
  Widget getSingleProduct(BrandSearch brand,context) {
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
                  child: Image.network("http://"+brand.imagePath.toString(),
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

                FxText.bodyMedium(brand.name.toString(),
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                FxSpacing.height(8),
                FxText.labelSmall(brand.category.toString(),
                    color: theme.colorScheme.onBackground, muted: true),

                FxSpacing.height(8),
                FxText.labelSmall(brand.brand.toString(),
                    color: theme.colorScheme.onBackground, muted: true),
                FxSpacing.height(8),
                Row(
                  children: [

                    FxText.bodyMedium("৳"+brand.price.toString(),
                        color: theme.colorScheme.onBackground,
                        fontWeight: 700),
                    5.width,
                    FxText.bodyMedium(brand.unitName.toString(),
                        color: theme.colorScheme.onBackground,
                        fontWeight: 700),
                  ],
                ),
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
                          controller.productdetailsName.value=brand.name!;
                          controller.productdetailsPrice.value=brand.price!;
                          controller.productdetailsImage.value=brand.imagePath!;
                          controller.selectedProductId.value=brand.productId!;
                          controller.productdetailsBrand.value=brand.brand!;
                          controller.productdetailsCategory.value=brand.category!;
                         // controller.productdetailsPromotion.value=brand.promotion!;
                          controller.productdetailsUnit.value=brand.unitName!;
                          controller.AllDetailsofProduct();
                         controller.productdetails.close();
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
                            productId: brand.productId,
                            itemId: brand.itemId,
                            quantity: brand.quantity,
                            discountPrice: brand.discountPrice,
                            categoryId: brand.categoryId,
                            brandId: brand.brandId,
                            discountId: brand.discountId,
                            discount: brand.discount,
                            discountType: brand.discountType,
                            discountAmount: brand.discountAmount,
                            promotion: brand.promotion,
                            promotionId: brand.productId,
                            tagId: brand.tagId,
                            tag: brand.tag,
                            unitName: brand.unitName,
                            quantityApplicable: brand.quantityApplicable,
                            maxQuantity: brand.maxQuantity,
                            name: brand.name,
                            brand: brand.brand,
                            price: brand.price,
                            category: brand.category,
                            imagePath: brand.imagePath,
                          );
                         // controller.cartlist.add(s);
                          showGeneralDialog(
                              context: (context),
                              barrierDismissible: false,
                              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                              barrierColor: Colors.white.withOpacity(0.9),
                              transitionDuration:  Duration(
                                  milliseconds: 200
                              ),
                              pageBuilder: (BuildContext buildContext,
                                  Animation animation,
                                  Animation secondaryAnimation) {
                                return Center(
                                  child: Container(
                                      width:Get.width*.90,
                                      height: Get.height*.55,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:<Widget> [
                                          Center(
                                              child: getCustomProduct(brand, context)
                                          ),
                                          5.height,
                                          Row(
                                            children: [
                                              Container(
                                                width: Get.width*0.44,
                                                height: 30,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(backgroundColor:customTheme.oliveGreen),
                                                  onPressed: ()
                                                  {

                                                  },
                                                  child: Text("Cancel")
                                                ),
                                              ),
                                              5.width,
                                              Container(
                                                width: Get.width*0.44,
                                                height: 30,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                                  onPressed: (){


                                                  },
                                                  child: Text("Add"),
                                                ),
                                              )

                                            ],
                                          ),
                                        ],
                                      )
                                  ),
                                );

                              }
                          );




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

  Widget getCustomProduct(BrandSearch brand,context) {
    controller.branddetailsTextEditingController.text=controller.productdetailsQuantity.value.toString();
    String heroKey = FxTextUtils.randomString(10);
    return FxContainer(
    width: Get.width*1,
      height: Get.height*0.50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FxContainer(
            height: Get.height*0.20,
            width: Get.width*0.30,
            color: Colors.white,
            padding: FxSpacing.all(3),
            child: Hero(
              tag: heroKey,
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: Image.network("http://"+brand.imagePath.toString(),
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
          ),
          FxSpacing.width(5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxText.bodyMedium(brand.name.toString(),
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                FxSpacing.height(8),
                FxText.labelSmall(brand.category.toString(),
                    color: theme.colorScheme.onBackground, muted: true),
                FxSpacing.height(8),
                FxText.labelSmall(brand.brand.toString(),
                    color: theme.colorScheme.onBackground, muted: true),
                FxSpacing.height(8),
                Row(
                  children: [
                    FxText.bodyMedium("৳"+brand.price.toString(),
                        color: theme.colorScheme.onBackground,
                        fontWeight: 700),
                    5.width,
                    FxText.bodyMedium(brand.unitName.toString(),
                        color: theme.colorScheme.onBackground,
                        fontWeight: 700),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor:customTheme.oliveGreen),
                        onPressed: (){
                          if(controller.productdetailsQuantity.value>1)
                          {
                            controller.setCount(controller.productdetailsQuantity--);

                            toast(controller.productdetailsQuantity.value.toString());
                          }

                        },
                        child: Icon(Icons.remove,size: 30,),
                      ),
                    ),
                    5.width,
                    Container(
                      width: 60,
                      height: 30,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.red),
                        controller:controller.branddetailsTextEditingController,
                        keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                         focusedBorder:OutlineInputBorder(
                           borderSide: BorderSide(
                           width: 1, color: Colors.blueAccent),
                      ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black54), //<-- SEE HERE
                          ),
                        ),

                      ),

                    ),
                    5.width,
                    Container(
                      width: 60,
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: (){
                          controller.setCount(controller.productdetailsQuantity++);
                          controller.branddetailsTextEditingController.text=controller.productdetailsQuantity.value.toString();

                        },
                        child: Icon(Icons.add,size: 30,),
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


}
/*
CustomBottomNavigation(
animationDuration: Duration(milliseconds: 350),
selectedItemOverlayColor: customTheme.groceryPrimary.withAlpha(28),
backgroundColor: AppTheme.shoppingManagerTheme.colorScheme.background,
selectedIndex: controller.currentIndex.value,
onItemSelected: (index) {
controller.setCurrentIndex(index);
},
items: <CustomBottomNavigationBarItem>[
CustomBottomNavigationBarItem(
title: 'Home'.tr,
icon: Icon(Icons.home),
activeColor: customTheme.oliveGreen,
inactiveColor: AppTheme
    .shoppingManagerTheme.colorScheme.onBackground
    .withAlpha(180)
),
CustomBottomNavigationBarItem(
title: 'Sales'.tr,
icon: Icon(Icons.store),
activeColor: customTheme.oliveGreen,
inactiveColor: AppTheme
    .shoppingManagerTheme.colorScheme.onBackground
    .withAlpha(180)
),
CustomBottomNavigationBarItem(
title: 'Cart'.tr,
icon: Icon(Icons.card_travel),
activeColor: customTheme.oliveGreen,
inactiveColor: AppTheme
    .shoppingManagerTheme.colorScheme.onBackground
    .withAlpha(180)),
CustomBottomNavigationBarItem(
title: 'Profile'.tr,
icon: Icon(Icons.account_circle),
activeColor: customTheme.oliveGreen,
inactiveColor: AppTheme
    .shoppingManagerTheme.colorScheme.onBackground
    .withAlpha(180)
),

],
),*/


class _SimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: FxSpacing.all(16),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FxText.titleLarge(
              "Title",
              fontWeight: 700,
            ),
            FxText.titleMedium(
              "Description...",
              fontWeight: 500,
            ),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                child: FxButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderRadiusAll: 4,
                    elevation: 0,
                    child: FxText.bodyMedium("OK",
                        letterSpacing: 0.3,
                        color: themeData.colorScheme.onPrimary))),
          ],
        ),
      ),
    );
  }
}

