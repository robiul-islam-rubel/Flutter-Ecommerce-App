
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../model/brand.dart';
import '../model/category.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../utils/custom_navigation_bar.dart';
import '../utils/images.dart';
import '../utils/widget.dart';

class AllCategoryScreen extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());

  List<Brand> brand = [];
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
    TextIconItem("Adminstrative", Icons.admin_panel_settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          //clipBehavior: Clip.none,
          children: <Widget>[
            30.height,
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
            Container(
              height: Get.height*0.78,
              padding: FxSpacing.fromLTRB(20,20,20,0),
              child: GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: FxSpacing.zero,
                  mainAxisSpacing: 20,
                  childAspectRatio: 4 / 4,
                  crossAxisSpacing: 20,
                  children: List.generate(controller.categorylist.length, (index) {
                    return getSingleCategory(controller.categorylist[index]);
                  }
                  )
              ),
            ),

          ],
        ),
        bottomNavigationBar: Obx(
          () => CustomBottomNavigation(
            animationDuration: Duration(milliseconds: 350),
            selectedItemOverlayColor: customTheme.groceryPrimary.withAlpha(28),
            backgroundColor:
                AppTheme.shoppingManagerTheme.colorScheme.background,
            selectedIndex: controller.currentIndex.value,
            onItemSelected: (index) {
              controller.setCurrentIndex(index);
            },
            items: <CustomBottomNavigationBarItem>[
              CustomBottomNavigationBarItem(
                  title: 'Home',
                  icon: Icon(Icons.home),
                  activeColor: customTheme.oliveGreen,
                  inactiveColor: AppTheme
                      .shoppingManagerTheme.colorScheme.onBackground
                      .withAlpha(180)),
              CustomBottomNavigationBarItem(
                  title: 'Sales',
                  icon: Icon(Icons.store),
                  activeColor: customTheme.oliveGreen,
                  inactiveColor: AppTheme
                      .shoppingManagerTheme.colorScheme.onBackground
                      .withAlpha(180)),
              CustomBottomNavigationBarItem(
                  title: 'Cart',
                  icon: Icon(Icons.card_travel),
                  activeColor: customTheme.oliveGreen,
                  inactiveColor: AppTheme
                      .shoppingManagerTheme.colorScheme.onBackground
                      .withAlpha(180)),
              CustomBottomNavigationBarItem(
                  title: 'Profile',
                  icon: Icon(Icons.account_circle),
                  activeColor: customTheme.oliveGreen,
                  inactiveColor: AppTheme
                      .shoppingManagerTheme.colorScheme.onBackground
                      .withAlpha(180)),
            ],
          ),
        ));
  }

  Widget getBannerWidget() {
    return FxContainer(
      color: customTheme.groceryPrimary.withAlpha(28),
      padding: FxSpacing.all(10),
      margin: FxSpacing.horizontal(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.bodyLarge("Enjoy the special offer\nup to 60%",
              color: customTheme.groceryPrimary,
              fontWeight: 600,
              letterSpacing: 0),
          FxSpacing.height(8),
          FxText.bodySmall("at 15 - 25 March 2021",
              color: theme.colorScheme.onBackground.withAlpha(100),
              fontWeight: 500,
              letterSpacing: -0.2),
        ],
      ),
    );
  }

  Widget getSingleCategory(Category category) {
    String heroTag = FxTextUtils.randomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 92,
        onTap: () {

          Get.toNamed(AppPages.getSingleCategoryRoute());
        },
        padding: FxSpacing.all(16),
        color: CustomTheme.red.withAlpha(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "http://" + category.ImagePath.toString(),
              width: 80,
              height: 80,
            ),
            FxSpacing.height(4),
            FxText.labelSmall(
              category.Name.toString(),
              color: theme.colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }

/*  Widget getSingleCategory(Category category) {
    String heroTag = FxTextUtils.randomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 92,
        onTap: () {
          Get.toNamed(AppPages.getTempRoute());
        },
        padding: FxSpacing.all(16),
        color: CustomTheme.red.withAlpha(25),
        child: Column(
          children: [
           Image.network(
                    "http://" + category.ImagePath.toString(),
                    width: 80,
                    height: 80,
                  ),
          ],
        ),
      ),
    );
  }*/

  Widget drawerMenus(BuildContext context) {
    return InkWell(
      onTap: () {
        showAlignedDialog(
          context: context,
          followerAnchor: Alignment.topLeft,
          isGlobal: true,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween(begin: Offset(-1, 0), end: Offset(0, 0))
                  .animate(animation),
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
                child: child,
              ),
            );
          },
          builder: (context) {
            return Center(
              child: Container(
                height: Get.height * 0.50,
                color: Colors.white,
                child: Padding(
                  padding: FxSpacing.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FxText.titleMedium("Navigation", fontWeight: 500),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                child: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: FxSpacing.top(16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      _QuickActionWidget(
                                        iconData: Icons.shopping_cart,
                                        actionText: 'Brand',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.category,
                                        actionText: 'Category',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.local_offer,
                                        actionText: 'Offer',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      _QuickActionWidget(
                                        iconData: Icons.branding_watermark,
                                        actionText: 'Feature Brand',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.category_outlined,
                                        actionText: 'Feature Category',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons
                                            .production_quantity_limits_rounded,
                                        actionText: 'Best Selling Product',
                                      ),
                                    ],
                                  ),
                                ),
                                /* Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      _QuickActionWidget(
                                        iconData: Icons.phone_outlined,
                                        actionText: 'Postpaid',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.play_arrow_outlined,
                                        actionText: 'G Play',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.umbrella_outlined,
                                        actionText: 'Insurance',
                                      ),
                                    ],
                                  ),
                                )*/
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.menu),
    );
  }
}

class _QuickActionWidget extends StatelessWidget {
  CustomTheme customTheme = CustomTheme();

  final IconData iconData;
  final String actionText;

  _QuickActionWidget(
      {Key? key, required this.iconData, required this.actionText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: FxSpacing.y(12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: customTheme.oliveGreen.withAlpha(28),
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: customTheme.oliveGreen,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: FxSpacing.top(4),
            child: FxText.bodySmall(actionText, fontWeight: 600),
          )
        ],
      ),
    );
  }
}
