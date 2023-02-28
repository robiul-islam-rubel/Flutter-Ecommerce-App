import 'dart:io';

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:fairshop/utils/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../model/brand.dart';
import '../model/category.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../utils/custom_navigation_bar.dart';
import '../utils/images.dart';

class HomeScreen extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
    TextIconItem("Adminstrative", Icons.admin_panel_settings),
  ];

  List<Brand> brand = [];
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Obx(()=>
          ListView(
            physics: NeverScrollableScrollPhysics(),
          padding: FxSpacing.fromLTRB(0, 30, 0, 20),
          children: <Widget>[
            Container(
              child: Column(
                //clipBehavior: Clip.none,
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
                                          textInputAction: TextInputAction.go,
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
                                InkWell(
                                  onTap: ()
                                  {
                                   Get.toNamed(AppPages.getSearchPageRoute());
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.black54,
                                    child:  Icon(Icons.search,size: 16,color: Colors.white,),
                                  ),
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
                  5.height,
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: PageView(
                          pageSnapping: true,
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                          },
                          children: <Widget>[
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.sliderlist.length,
                                itemBuilder: (context,int index)
                                {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 0),
                                    child: Image.network("http://"+
                                        controller.sliderlist[index].ImagePath.toString(),
                                      height: 240.0,
                                      width: Get.width*1,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                }
                            ),

                        /*    Padding(
                              padding: EdgeInsets.only(right: 0),
                                    child: Image.network("http://"+
                                        controller.sliderlist[0].ImagePath.toString(),
                                      height: 240.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),*/
                   /*       Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Image.network("http://"+
                              controller.sliderlist[1].ImagePath.toString(),
                            height: 240.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                            Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Image.network("http://"+
                                  controller.sliderlist[2].ImagePath.toString(),
                                height: 240.0,
                                fit: BoxFit.fill,
                              ),
                            )
*/

                          ],
                        ),
                      ),

                    ],
                  ),


                ],
              ),
            ),
           /* Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: PageView(
                      pageSnapping: true,
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                       controller.setCurrentPage(page);
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Image.asset(
                            Images.landscapes[0],
                            height: 240.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            Images.landscapes[1],
                            height: 240.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            Images.landscapes[2],
                            height: 240.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicatorAnimated(),
                    ),
                  ),
                ],
              ),
            ),*/

            FxSpacing.height(24),
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.titleMedium("Categories",
                      letterSpacing: 0,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 600),
                  InkWell(
                    onTap: (){
                     Get.toNamed(AppPages.getAllCategoryRoute());
                    },
                    child: FxText.bodySmall("See All",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600,
                        xMuted: true,
                        letterSpacing: 0),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categorylist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                            getSingleCategory(controller.categorylist[index],index),
                              FxSpacing.height(5),
                              Obx(()=>
                               Text(controller.categorylist[index].Name.toString()),
                              ),

                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.titleMedium("Brands",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppPages.getAllBrandRoute());
                    },
                    child: FxText.bodySmall("See All",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600,
                        xMuted: true,
                        letterSpacing: 0),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 120,
                    child: Obx(()=>
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.brandlist.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 14.0,right: 8),
                            child: Column(
                              children: [
                              getSingleBrand(controller.brandlist[index],index)


                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavigation(
          animationDuration: Duration(milliseconds: 350),
          selectedItemOverlayColor: customTheme.groceryPrimary.withAlpha(28),
          backgroundColor: AppTheme.shoppingManagerTheme.colorScheme.background,
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
      ),
      drawer:Drawer(
          child: Container(
        color: theme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: FxSpacing.fromLTRB(16, 16, 16, 12),
              child: Container(
                margin: FxSpacing.top(36),
                child: FxText.titleLarge("Fairshop".toUpperCase(),
                    color: theme.colorScheme.primary, letterSpacing: 0.2,fontSize: 15,),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Obx(()=>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                             controller.dataExpansionPanel[index] = !isExpanded;
                          },
                          animationDuration: Duration(milliseconds: 500),
                          children: <ExpansionPanel>[
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    leading: Icon(Icons.ac_unit_sharp),
                                    title: FxText.bodySmall("Categories",
                                        color: isExpanded
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onBackground,
                                        fontWeight: isExpanded ? 700 : 600),
                                  );
                                },
                                body: SingleChildScrollView(
                                  child: SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.categorylist.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            singleDrawerItem(Icons.file_copy_outlined, controller.categorylist[index].Name.toString(), index),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                isExpanded: controller.dataExpansionPanel[0]
                            ),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    leading: Icon(Icons.ac_unit_sharp),
                                    title: FxText.bodySmall("Package",
                                        color: isExpanded
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onBackground,
                                        fontWeight: isExpanded ? 700 : 600),
                                  );
                                },
                                body: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        singleDrawerItem(Icons.star_outlined, "Starred", 4),
                                        singleDrawerItem(
                                            Icons.lock_clock_outlined, "Snoozed", 5),
                                        singleDrawerItem(FeatherIcons.send, "Sent", 6),
                                        singleDrawerItem(Icons.file_copy_outlined, "Drafts", 7),
                                        singleDrawerItem(Icons.email_outlined, "All Mail", 8),
                                        singleDrawerItem(
                                            Icons.sd_card_alert_outlined, "Spam", 9),

                                      ],
                                    )
                                ),
                                isExpanded: controller.dataExpansionPanel[1]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    leading: Icon(Icons.ac_unit_sharp),
                                    title: FxText.bodySmall("Discount Offer",
                                        color: isExpanded
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onBackground,
                                        fontWeight: isExpanded ? 700 : 600),
                                  );
                                },
                                body: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: FxSpacing.fromLTRB(0, 0, 24, 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        singleDrawerItem(Icons.star_outlined, "Starred", 4),
                                        singleDrawerItem(
                                            Icons.lock_clock_outlined, "Snoozed", 5),
                                        singleDrawerItem(FeatherIcons.send, "Sent", 6),
                                        singleDrawerItem(Icons.file_copy_outlined, "Drafts", 7),
                                        singleDrawerItem(Icons.email_outlined, "All Mail", 8),
                                        singleDrawerItem(
                                            Icons.sd_card_alert_outlined, "Spam", 9),

                                      ],
                                    )),
                                isExpanded: controller.dataExpansionPanel[2]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    leading: Icon(Icons.ac_unit_sharp),
                                    title: FxText.bodySmall("Brand",
                                        color: isExpanded
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onBackground,
                                        fontWeight: isExpanded ? 700 : 600),
                                  );
                                },
                                body: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: controller.brandlist.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                singleDrawerItem(Icons.file_copy_outlined, controller.brandlist[index].Name.toString(), index),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                isExpanded: controller.dataExpansionPanel[3])
                          ],
                        ),
                        Padding(
                          padding:FxSpacing.fromLTRB(16, 20, 16, 0),
                          child: Container(
                            child: FxText.titleLarge("Resources".toUpperCase(),fontSize: 15,
                                color: theme.colorScheme.primary, letterSpacing: 0.2),
                          ),
                        ),
                        Divider(thickness: 1,color: Colors.black12),
                        Container(
                          height: 200,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.pagelist.length,
                            itemBuilder: (contex,int index)
                              {
                                return InkWell(
                                  onTap: (){

                                    controller.pagenumber.value=controller.pagelist[index].id!;
                                    controller.pageheading.value=controller.pagelist[index].menu!;
                                   // toast(controller.pagenumber.toString());
                                    controller.AllPagesbyId();
                                    Get.toNamed(AppPages.getPageDetaislRoute());
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:FxSpacing.fromLTRB(16, 0, 16, 12),
                                        child: FxText.titleLarge(controller.pagelist[index].menu.toString(),fontSize: 15, letterSpacing: 0.2),
                                      ),
                                    ],
                                  ),
                                );
                              }
                          ),
                        ),
                        Divider(thickness: 1,color: Colors.black12),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),//Drawer,
    );
  }
  List<Widget> _buildPageIndicatorAnimated() {
    final int _numPages = 3;
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == controller.currentPage.value ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withAlpha(140),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }



  Widget getSingleBrand(Brand brand,index) {
    String heroTag = FxTextUtils.randomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 92,
        onTap: () {
          controller.selectedBrandIndex.value=index;
          controller.selectedBrandId.value=brand.Id!;
          print("${controller.selectedBrandIndex.value}ffff");

          controller.SingleBrandAllProductList();
          controller.singleBrandProduct.clear();

          Get.toNamed(AppPages.getSingleBrandRoute());
        },
        padding: FxSpacing.all(16),
        color: customTheme.groceryPrimary.withAlpha(28),
        child: Column(
          children: [
            Image.network(
              "http://" + brand.ImagePath.toString(),
              width: 28,
              height: 28,
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

  Widget getSingleCategory(Category category,index) {
    String heroTag = FxTextUtils.randomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 92,
        onTap: () {
          controller.selectedCategoryIndex.value=index;
          controller.selectedCategoryId.value=category.Id!;
          controller.SingleCategoryAllProductList();
          controller.singleCategoryProduct.clear();
          Get.toNamed(AppPages.getSingleCategoryRoute());

        },
        padding: FxSpacing.all(16),
        color: CustomTheme.red.withAlpha(25),
        child: Column(
          children: [
            category.ImagePath.toString().isEmpty
                ? Image.network(
                    "http://www.terminalbd.com/cache/images/d/5/a/5/7/d5a57afca4176c66fda563b1091ca552fa893085.jpeg",
                    width: 28,
                    height: 30,
                  )
                : Image.network(
                    "http://" + category.ImagePath.toString(),
                    width: 28,
                    height: 28,
                  ),
          ],
        ),
      ),
    );
  }

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
                                Column(
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
                                Column(
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


    Widget singleDrawerItem(IconData iconData, String title, int position) {
    return ListTile(
      dense: true,
      leading: Icon(iconData,
          size: 20,
          color: controller.selectedPage.value == position
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground.withAlpha(240)
      ),
      title: FxText.titleSmall(title,
          fontWeight: controller.selectedPage.value== position ? 700 : 600,
          color: controller.selectedPage.value == position
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground.withAlpha(240)),
      onTap: () {
        controller.setSelectedPage(position);
        _scaffoldKey.currentState!.openEndDrawer();

      },
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
class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}
