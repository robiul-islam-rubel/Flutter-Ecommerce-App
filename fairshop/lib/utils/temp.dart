// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../model/brand_search.dart';
import '../theme/app_theme.dart';
import 'images.dart';

// ignore: must_be_immutable
class TempScreen extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());
  String heroTag = FxTextUtils.randomString(10);
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                padding: EdgeInsets.only(top: 8, right: 8, bottom: 5),
                height: 50,
                width: 300,
                child: FxTextField(
                  hintText: "Search",
                  prefixIcon: Icon(
                    FeatherIcons.search,
                    size: 18,
                    color: theme.colorScheme.onBackground.withAlpha(150),
                  ),
                  filled: true,
                  isDense: true,
                  fillColor: customTheme.card,
                  hintStyle: FxTextStyle.bodyMedium(),
                  labelStyle: FxTextStyle.bodyMedium(),
                  style: FxTextStyle.bodyMedium(),
                  textCapitalization: TextCapitalization.sentences,
                  labelText: "Search",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  cursorColor: Colors.black87,
                  focusedBorderColor: Colors.transparent,
                ),
              ),
            ],
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
              ),
            ),
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                FxContainer(
                  padding: FxSpacing.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: buildProducts(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
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
}
