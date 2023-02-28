import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../utils/constants.dart';
import '../utils/constants.dart';

class ApiProvider {
  /* Brand list */
  Future<String> getAllBrand() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_brand}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Search Brand list */
  Future<String> getAllSearchBrand(String brand_id) async {
    var client = http.Client();
    try {
      var response =
          await client.post(Uri.parse("${BASE_URL_SEARCH}"), headers: {
        "Accept": "application/json",
        "$X_API_KEY": "$API_KEY",
        "$X_API_VALUE": "$API_VALUE",
        "$X_API_SECRET": "$API_SECRET"
      }, body: {
        "brand": brand_id
      });

      if (response.statusCode == 200) {

        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Category List */
  Future<String> getAllCategory() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_category}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Search Category list */
  Future<String> getAllCategorySearch(String category_id) async {
    var client = http.Client();
    try {
      var response =
          await client.post(Uri.parse("${BASE_URL_SEARCH}"), headers: {
        "Accept": "application/json",
        "$X_API_KEY": "$API_KEY",
        "$X_API_VALUE": "$API_VALUE",
        "$X_API_SECRET": "$API_SECRET"
      }, body: {
        "category": category_id
      });
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Feature Brand List */
  Future<String> getFeatureBrand() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_feature_brand}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Feature Category List */
  Future<String> getFeatureCategory() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_feature_category}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Discount List */
  Future<String> getAllDiscount() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_discount}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Promotion List */
  Future<String> getAllPromotion() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_promotion}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Products List */
  Future<String> getAllProducts(String category_id) async {
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse("${BASE_URL + endpoint_products}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
        body:
          {
            "category": category_id
          }
      );


      if (response.statusCode == 200) {

        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Home Slider List */
  Future<String> getAllHomeSlider() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_home_feature_slider}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* SideBar List */
  Future<String> getAllSideBar() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_sidebar_menu}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Order Details List */
  Future<String> getAllOrders() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_order_details}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Order Location List */
  Future<String> getAllOrderLocation() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_order_location}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Order Time Period List */
  Future<String> getAllOrderTimePeriod() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_order_time_period}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  /* Portal StoreList */
  Future<String> getAllPortalStore() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse("${BASE_URL + endpoint_order_portal}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }
  /* Pages  */
  Future<String> getAllPages() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse("${BASE_URL+endpoint_page}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {

        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }
  /*Page details*/
  Future<Map<String,dynamic>?> getSinglePageDetails(String Id) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse("${BASE_URL+endpoint_page_details}"), headers: {
        "Accept": "application/json",
        "$X_API_KEY": "$API_KEY",
        "$X_API_VALUE": "$API_VALUE",
        "$X_API_SECRET": "$API_SECRET"
      }, body: {
        "id": Id
      }
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception,err) {
      print(err.toString());
      return null;
    }
  }
  /* Slider  */
  Future<String> getAllSlider() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse("${BASE_URL+endpoint_slider}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }
  Future<String> getProductDetails(String productId) async {
    var client = http.Client();

    try {
      var response = await client.post(
        Uri.parse("${BASE_URL + endpont_product_details}"),
        headers: {
          "Accept": "application/json",
          "$X_API_KEY": "$API_KEY",
          "$X_API_VALUE": "$API_VALUE",
          "$X_API_SECRET": "$API_SECRET"
        },
        body:
          {
            "id":productId
          }
      );
       debugPrint(response.body,wrapWidth: 1024);
      if (response.statusCode == 200) {

        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

}
