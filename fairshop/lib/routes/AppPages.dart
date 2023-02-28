import 'package:fairshop/binding/home_binding.dart';
import 'package:fairshop/binding/login_binding.dart';
import 'package:fairshop/binding/splash_binding.dart';
import 'package:fairshop/pages/all_categories_page.dart';
import 'package:fairshop/pages/home_screen.dart';
import 'package:fairshop/pages/login_screen.dart';
import 'package:fairshop/utils/temp.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/all_brand_page.dart';
import '../pages/cart_screen.dart';
import '../pages/page_details.dart';
import '../pages/product_details_screen.dart';
import '../pages/search_screen.dart';
import '../pages/single_brand.dart';
import '../pages/single_category.dart';
import '../pages/splash_screen.dart';

class AppPages {
  static String INITIAL = '/initial';
  static String LOGIN = '/login';
  static String HOME = '/home';
  static String TEMP = "/temp";
  static String SINGLEBRAND = "/singlebrand";
  static String ALLCATEGORY = "/allcategory";
  static String ALLBRAND="/allbrand";
  static String PAGEDETAILS="/pagedetails";
  static String SINGLECATEGORY="/singlecategory";
  static String PRODUCTDETAILS="/productdetails";
  static String CART="/cart";
  static String SEARCH="/search";


  static String getInitialRoute() => INITIAL;
  static String getLoginRoute() => LOGIN;
  static String getHomeRoute() => HOME;
  static String getTempRoute() => TEMP;
  static String getSingleBrandRoute() => SINGLEBRAND;
  static String getAllCategoryRoute() => ALLCATEGORY;
  static String getAllBrandRoute()=>ALLBRAND;
  static String getPageDetaislRoute()=>PAGEDETAILS;
  static String getSingleCategoryRoute()=>SINGLECATEGORY;
  static String getProdctDetailsRoute()=>PRODUCTDETAILS;
  static String getCartPageRoute()=>CART;
  static String getSearchPageRoute()=>SEARCH;

  static final routes = [
    GetPage(
        name: INITIAL, page: () => SplashScreen(), binding: SplashBinding()),
    GetPage(name: LOGIN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: TEMP, page: () => TempScreen(), binding: HomeBinding()),
    GetPage(
        name: SINGLEBRAND,
        page: () => SingleBrandScreen(),
        binding: HomeBinding()),
    GetPage(
        name: ALLCATEGORY,
        page: () => AllCategoryScreen(),
        binding: HomeBinding()),
    GetPage(
        name: ALLBRAND,
        page: () => AllBrandScreen(),
        binding: HomeBinding()),
    GetPage(
      name: PAGEDETAILS,
      page: ()=>PageDetailsScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: SINGLECATEGORY,
      page: ()=>SingleCategoryScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: PRODUCTDETAILS,
      page: ()=>ProductDetailsScreen(),
      binding: HomeBinding()
    ),
    GetPage(
        name: CART, page:()=> CartScreen(),binding: HomeBinding()
    ),
    GetPage(
      name: SEARCH,
      page: ()=>SearchScreen(),
      binding: HomeBinding()
    )
  ];
}
