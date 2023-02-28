import 'package:fairshop/model/brand_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/dashed_divider/dashed_divider.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/home_controller.dart';
import '../routes/AppPages.dart';
import '../theme/app_theme.dart';
import '../utils/images.dart';

class CartScreen extends GetView<HomeController> {
  ThemeData theme = AppTheme.shoppingTheme;
  CustomTheme customTheme = AppTheme.customTheme;
  String heroTag = FxTextUtils.randomString(10);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Cart"),
     ),

     body: controller.cartlist.length==0?Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [Center(child:Text("Your Cart is Empty"))],):Column(
     children: [
       Container(
         height:420,
         child: Obx(()=>
          ListView.builder(
             itemCount: controller.cartlist.length,
             itemBuilder: (context,int index)
               {
                 return FxContainer(
                   margin: FxSpacing.all(8),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       FxContainer(
                         color: customTheme.groceryPrimary.withAlpha(32),
                         padding: FxSpacing.all(8),
                         child: Hero(
                           tag: heroTag,
                           child: ClipRRect(
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                             child: Image.network("http://"+controller.cartlist[index].imagePath.toString(),
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
                             FxText.bodyMedium(controller.cartlist[index].name.toString(),
                                 color: theme.colorScheme.onBackground, fontWeight: 600),
                             FxSpacing.height(8),
                             FxText.labelSmall(controller.cartlist[index].brand.toString(),
                                 color: theme.colorScheme.onBackground, muted: true),
                             FxSpacing.height(8),
                             FxText.bodyMedium("৳"+controller.cartlist[index].price.toString(),
                                 color: theme.colorScheme.onBackground,
                                 fontWeight: 700),
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

                               ],
                             ),


                           ],
                         ),
                       ),
                       InkWell(
                         onTap:(){
                           controller.cartlist.removeAt(index);
                      },
                           child: Icon(Icons.close,color: Colors.red,size: 20,)
                       )
                       // Space.width(8),

                     ],
                   ),
                 );
               }
           ),
         ),

       ),
       10.height,
       _billingWidget(),
       Padding(
         padding: const EdgeInsets.only(left: 8.0,right: 8),
         child: FxButton.block(

             onPressed: () {

             },
             backgroundColor: theme.colorScheme.primary,
             elevation: 0,
             borderRadiusAll: 4,
             child: Row(
               children: [
                 Expanded(
                   child: Center(
                     child: FxText.bodyMedium(
                       'Checkout',
                       fontWeight: 600,
                       color: theme.colorScheme.onPrimary,
                     ),
                   ),
                 ),
               ],
             )
         ),
       ),
     ],
   ),
   );
  }
  Widget _billingWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 8,right: 8,bottom: 8) ,
      child: FxContainer(
        padding:EdgeInsets.only(left: 8,right: 8,bottom: 8) ,
        borderRadiusAll: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.bodyMedium(
              'Billing Information',
              muted: true,
              fontWeight: 700,
            ),
            FxSpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Order Total',
                  fontWeight: 600,
                ),
                FxText.bodyMedium(
                  '\$' +"400",
                  fontWeight: 700,
                ),
              ],
            ),
            FxSpacing.height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Tax',
                  fontWeight: 600,
                ),
                FxText.bodyMedium(
                  '\$' +"70",
                  fontWeight: 700,
                ),
              ],
            ),
            FxSpacing.height(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Offer',
                  fontWeight: 600,
                ),
                FxText.bodyMedium(
                  '- \$' + "30",
                  fontWeight: 700,
                ),
              ],
            ),
            FxSpacing.height(12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  child: FxDashedDivider(
                    dashSpace: 4,
                    dashWidth: 8,
                    color: theme.colorScheme.onBackground.withAlpha(180),
                    height: 1.2,
                  ),
                )
              ],
            ),
            FxSpacing.height(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyMedium(
                  'Grand Total',
                  fontWeight: 700,
                ),
                FxText.bodyMedium(
                  '\$' + "440",
                  fontWeight: 800,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}