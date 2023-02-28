// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../localizations/language.dart';
import '../model/brand_search.dart';
import '../model/product_details.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../utils/custom_navigation_bar.dart';
import '../utils/images.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());
  String heroTag = FxTextUtils.randomString(10);
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  String heroKey = FxTextUtils.randomString(10);
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          color: customTheme.groceryPrimary.withAlpha(68),
          child: ListView(

            padding: EdgeInsets.only(top: 30,left: 10,right: 10),
            children: <Widget>[
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
              Obx(()=>
                Center(
                  child: Hero(
                    tag: heroKey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.network("http://"+controller.productdetailsImage.value),
                      ),
                    ),
                  ),
              ),
              FxSpacing.height(24),
              FxContainer(
                padding: FxSpacing.all(24),
                color: customTheme.card,
                borderRadiusAll: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.titleMedium(controller.productdetailsName.value.toString(),
                        fontWeight: 700),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.bodyMedium(controller.productdetailsCategory.toString(),
                            fontWeight: 500),
                        FxSpacing.height(8),
                        FxText.bodyMedium(controller.productdetailsBrand.toString(),
                            fontWeight: 500),
                        Row(
                          children: [
                            // Space.width(8),
                            FxText.bodyMedium(
                              "\৳"+controller.productdetailsPrice.toString(),
                              fontWeight: 600,
                            ),
                            FxSpacing.width(5),
                            FxText.bodyMedium(controller.productdetailsUnit.toString(),
                              fontWeight: 600,
                            ),
                          ],
                        )
                      ],
                    ),

                    FxSpacing.height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FxContainer(
                                  borderRadiusAll: 4,
                                  onTap: () {
                                    if(controller.productdetailsQuantity.value>1)
                                    {
                                      controller.setCount(controller.productdetailsQuantity--);
                                      toast(controller.productdetailsQuantity.value.toString());
                                    }
                                  },
                                  padding: FxSpacing.all(6),
                                  color: customTheme.groceryPrimary.withAlpha(48),
                                  child: Icon(
                                    MdiIcons.minus,
                                    size: 14,
                                    color: customTheme.groceryPrimary,
                                  ),
                                ),

                                FxSpacing.width(12),
                                FxText.bodyLarge(controller.productdetailsQuantity.toString(),
                                    fontWeight: 600),
                                FxText.bodyLarge(controller.productdetailsPromotion.toString(),
                                    fontWeight: 600),
                                FxSpacing.width(12),
                                FxContainer(
                                  borderRadiusAll: 4,
                                  onTap: () {
                                    controller.setCount(controller.productdetailsQuantity++);

                                  },
                                  padding: FxSpacing.all(6),
                                  color: customTheme.groceryPrimary,
                                  child: Icon(
                                    MdiIcons.plus,
                                    size: 14,
                                    color: customTheme.groceryOnPrimary,
                                  ),
                                ),
                              ],
                            ),
                        ),
                        FxSpacing.width(24),
                        Expanded(
                            child: FxButton(
                              borderRadiusAll: 4,
                              elevation: 0,
                              onPressed: () {

                                Get.toNamed(AppPages.getCartPageRoute());
                              },
                              child: FxText.bodyMedium("Buy Now",
                                  fontWeight: 600,
                                  color: customTheme.groceryOnPrimary),
                              backgroundColor: customTheme.groceryPrimary,
                            ))
                      ],
                    ),
                    FxSpacing.height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.titleMedium("Related", fontWeight: 600),
                        FxText.bodySmall("See All",
                            fontWeight: 600, xMuted: true, letterSpacing: 0),
                      ],
                    ),
                    FxSpacing.height(16),
                    Column(
                      children: buildProducts(),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      bottomNavigationBar: Obx(
            () => BottomAppBar(
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

  List<Widget> buildProducts() {
    List<Widget> list = [];
    for (BrandSearch brandsearch in controller.brandSearch) {
      list.add(getSingleProduct(brandsearch));
    }
    return list;
  }

  Widget getSingleProduct(BrandSearch brandsearch) {
    String heroKey = FxTextUtils.randomString(10);
    return InkWell(
      onTap: () {},
      child: FxContainer(
        color: Colors.white,
        margin: FxSpacing.bottom(16),
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
                        child: Image.asset(Images.img2,
                          width: 72,
                          height: 72,
                        )))),
            FxSpacing.width(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(brandsearch.name.toString(),
                      color: Colors.black87, fontWeight: 600),
                  FxSpacing.height(8),
                  FxText.labelSmall(brandsearch.promotion.toString(),
                      color: Colors.black87, muted: true),
                  FxSpacing.height(8),
                  FxText.bodyMedium("\$" + brandsearch.price.toString(),
                      color: Colors.black87, fontWeight: 700),
                ],
              ),
            ),
            // Space.width(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  MdiIcons.heartOutline,
                  color: customTheme.groceryPrimary,
                  size: 18,
                ),
                50.height,
                InkWell(
                  onTap: () {
                    toast("Add to cart");
                  },
                  child: Icon(
                    MdiIcons.cart,
                    color: customTheme.groceryPrimary,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getSingleProductDetails(BrandSearch productDetails) {
    String heroKey = FxTextUtils.randomString(10);
    return InkWell(
      onTap: () {},
      child:   FxContainer(
        padding: FxSpacing.all(24),
        color: customTheme.card,
        borderRadiusAll: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.titleMedium(controller.productdetailsName.toString(),
                fontWeight: 700),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.titleMedium("",
                          fontWeight: 700),
                      FxSpacing.height(8),
                      Row(
                        children: [
                          FxSpacing.width(8),
                          // Space.width(8),
                          FxText.bodyMedium(
                            "\৳"+controller.productdetailsPrice.toString(),
                            fontWeight: 600,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                FxContainer(
                  onTap: () {

                  },
                  padding: FxSpacing.fromLTRB(8, 6, 8, 6),
                  color: customTheme.groceryPrimary.withAlpha(40),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FxText.bodyMedium("(243 review)",
                          color: customTheme.groceryPrimary,
                          fontWeight: 500,
                          letterSpacing: -0.2),
                      Icon(
                        MdiIcons.chevronRight,
                        size: 14,
                        color: customTheme.groceryPrimary,
                      )
                    ],
                  ),
                )
              ],
            ),

            FxSpacing.height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(()=>
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FxContainer(
                          borderRadiusAll: 4,
                          onTap: () {
                            if(controller.productdetailsQuantity.value>1)
                            {
                              controller.setCount(controller.productdetailsQuantity--);
                              toast(controller.productdetailsQuantity.value.toString());
                            }



                          },
                          padding: FxSpacing.all(6),
                          color: customTheme.groceryPrimary.withAlpha(48),
                          child: Icon(
                            MdiIcons.minus,
                            size: 14,
                            color: customTheme.groceryPrimary,
                          ),
                        ),

                        FxSpacing.width(12),
                        FxText.bodyLarge(controller.productdetailsQuantity.toString(),
                            fontWeight: 600),
                        FxText.bodyLarge(controller.productdetailsPromotion.toString(),
                            fontWeight: 600),
                        FxSpacing.width(12),
                        FxContainer(
                          borderRadiusAll: 4,
                          onTap: () {
                            controller.setCount(controller.productdetailsQuantity++);

                          },
                          padding: FxSpacing.all(6),
                          color: customTheme.groceryPrimary,
                          child: Icon(
                            MdiIcons.plus,
                            size: 14,
                            color: customTheme.groceryOnPrimary,
                          ),
                        ),
                      ],
                    ),
                ),
                FxSpacing.width(24),
                Expanded(
                    child: FxButton(
                      borderRadiusAll: 4,
                      elevation: 0,
                      onPressed: () {

                        Get.toNamed(AppPages.getCartPageRoute());
                      },
                      child: FxText.bodyMedium("Buy Now",
                          fontWeight: 600,
                          color: customTheme.groceryOnPrimary),
                      backgroundColor: customTheme.groceryPrimary,
                    ))
              ],
            ),
            FxSpacing.height(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.titleMedium("Related", fontWeight: 600),
                FxText.bodySmall("See All",
                    fontWeight: 600, xMuted: true, letterSpacing: 0),
              ],
            ),
            FxSpacing.height(16),
            Column(
              children: buildProducts(),
            )
          ],
        ),
      ),
    );
  }
}
