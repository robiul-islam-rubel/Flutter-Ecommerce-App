
import 'package:flutter/services.dart';
const BASE_URL = 'http://www.poskeeper.com/android-api-ecommerce/';
const BASE_URL_SEARCH="http://www.terminalbd.com/android-api-ecommerce/search";
const X_API_KEY = 'X-API-KEY';
const API_KEY="terminalbd";
const API_VALUE="terminalbd@aps";
const X_API_VALUE='X-API-VALUE';
const X_API_SECRET="X-API-SECRET";
const API_SECRET = '1557993051';



/*Api midpoints Get Method*/
const endpoint_brand = 'all-brand';
const endpoint_category = 'all-category';
const endpoint_feature_brand="feature-brand";
const endpoint_feature_category = 'feature-category';
const endpoint_discount = 'discount';
const endpoint_promotion="promotion";
const endpoint_home_feature_slider = 'home-feature-slider';
const endpoint_sidebar_menu = 'sidebar-menu';
const endpoint_order_location="order-location";
const endpoint_order_time_period="order-time-period";
const endpoint_order_portal="portal-store";
const endpoint_order_details="order-details";
const endpoint_products="product";
const endpoint_page="page-menu";
const endpoint_page_details="page";
const endpoint_slider="home-feature-slider";


/*Api EndPoints Post Method*/
const endpont_order="order";
const endpont_product_details="product-details";
const endpont_search="search";
const endpont_setup="setup";
const endpont_register="user-register";
const endpont_login="user-login";
const endpoint_feature_product="feature-product";
const endpoint_all_feature_product="all-feature-product";
const endpoint_order_list="order-list";
const endpoint_related_product="related-product";
const endpoint_update_register="update-register";









/*Regex's For Validation*/
var regexDouble = FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'));
var regexInteger = FilteringTextInputFormatter.allow(RegExp('^[0-9]*'));
var regexEmail =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


/*Sharedpreferences keys*/
const PREFS_ISLOGIN = 'isLogin';
const PREFS_JWTTOKEN = 'jwtToken';

