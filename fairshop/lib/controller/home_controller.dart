import 'dart:convert';
import 'dart:io';
import 'package:fairshop/model/brand.dart';
import 'package:fairshop/model/cart.dart';
import 'package:fairshop/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/validators/string_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

import '../model/brand_search.dart';
import '../model/category.dart';
import '../model/category_search.dart';
import '../model/home_slider.dart';
import '../model/page_details.dart';
import '../model/pages.dart';
import '../model/product_details.dart';
import '../pages/home_screen.dart';

class HomeController extends GetxController {
  // DatabaseHelper databaseHelper = DatabaseHelper.instance;
  //var isLoadingItemTypes = false.obs;
  var isExpanded = false.obs;
  var selectedValue = "".obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var agentBankName = Rxn<String>();
  var isExpand = false.obs;
  var selectedAddress = 0.obs;
  var selectedPayment = 0.obs;
  var currentIndex = 0.obs;
  var selectedRole = 0.obs;
  var selectedUser = 0.obs;
  var userType = 1.obs;
  var focusShop = false.obs;
  var selectedshopnametooltip = false.obs;
  var selectedshopnameerror = false.obs;
  var selectedmobiletooltip = false.obs;
  var selectedmobileerror = false.obs;
  var selectedmobiletooltiplogin = false.obs;
  var selectedmobileerrorlogin = false.obs;
  var selectedpasswordtooltiplogin = false.obs;
  var selectedpassworderrorlogin = false.obs;
  var selectedPackage = 0.obs;
  var selectedPackDuration = 0.obs;
  var selectedPackType = 0.obs;
  var ispaymentmethodTabbed = false.obs;
  var image = File('').obs;
  var isImageVisible = false.obs;
  var measurementCount = 0.obs;
  var sizedeclarationCount = 0.obs;
  var selectedPage=0.obs;
  var currentPage=0.obs;
  List<bool> dataExpansionPanel = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;

  //var dataExpansionPanel =List<bool>.empty(growable: true).obs;
  var selectedoption = ''.obs;
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);


  //var itemTypesList = List<ItemTypes>.empty(growable: true).obs;
  var isLoadingFinish = false.obs;
  List<DropdownMenuItem<String>> menuItemsCategory = [];
  var items = ["Apple", "Banana", "Cat", "Dog", "Fog"].obs;

  //List<DropdownMenuItem<Depots>> menuItemDepo=[];
  var catItemList = [].obs;
  var orderCount = 0.obs;
  List<DropdownMenuItem<String>> menuItemsProducts = [];
  var productList = [].obs;
  var selectedProductName = Rxn<String>();

  List<DropdownMenuItem<String>> menuItemsAgentBankCode = [];
  var agentBankCodeList = [].obs;
  var selected = [].obs;

  List<DropdownMenuItem<String>> menuItemBranch = [];
  var BranchNameList = [].obs;
  var selectedBranchName = Rxn<String>();
  var selectedBarCode = Rxn<String>();
  var selectedBrandId = 0.obs;
  var selectedCategoryId = 0.obs;
  var selectedBrandIndex=0.obs;
  var selectedCategoryIndex=0.obs;

  List<DropdownMenuItem<String>> menuItemsNourishBankCode = [];
  var nourishBankCodeList = [].obs;

  List<DropdownMenuItem<String>> menuItemsbanks = [];

  var title = "".obs;
  var subtitle = "".obs;
  var description = "".obs;
  var selectedCountry = Rxn<String>();
  var selectedCategory = Rxn<String>();
  var selectedBrand = Rxn<String>();
  var selectedUnit = Rxn<String>();
  var productdetailsName="".obs;
  var productdetailsPrice="".obs;
  var productdetailsImage="".obs;
  var productdetailsPromotion="".obs;
  var productdetailsQuantity=1.obs;
  var productdetailsCategory="".obs;
  var productdetailsBrand="".obs;
  var productdetailsUnit="".obs;

  var pageheading="".obs;
  var totalbil=0.obs;
  var productId=0.obs;
  var dummyIndex=0.obs;


  /* TextEditingControllers */
  var salesNameController = TextEditingController();
  var salesCategoryController = TextEditingController();
  var salesBrandController = TextEditingController();

  var loginemailController = TextEditingController();
  var loginpasswordController = TextEditingController();
  var registernameController = TextEditingController();
  var registeremailController = TextEditingController();
  var registerpasswordController = TextEditingController();
  var registershopnameController = TextEditingController();
  var registermobileController = TextEditingController();
  var forgetpasswordController = TextEditingController();
  var resetpasswordController = TextEditingController();
  var againresetpasswordController = TextEditingController();
  var countryController = TextEditingController();
  var registermobilecodeController = TextEditingController();
  var registeraddressController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var imagePickerController = TextEditingController();
  var purchasePriceController = TextEditingController();
  var salesPriceController = TextEditingController();
  var discountPriceController = TextEditingController();
  var barCode = TextEditingController();
  var branddetailsTextEditingController = TextEditingController();
  var textEditingController = TextEditingController();
  var tempList = ["Dhaka", "Bangladesh", "India", "Thiland"].obs;
  var productInfoList = [].obs;
  List<TextIconItem> textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
    TextIconItem("Adminstrative", Icons.admin_panel_settings),
  ];
  var paymentInfoList = [].obs;
  var timeList = ["All time", "Yesterday", "This week", "7 days ago"].obs;
  String time = "All time";
  String searchValue = '';
  var isExpand1 = false.obs;
  String? jwtToken = "";
  var newProductList = [].obs;
 // var products = <Product>[].obs;
  var singleBrandProduct=<BrandSearch>[].obs;
  var brandSearch=<BrandSearch>[].obs;
  var pageDetails=<PageDetails>[].obs;
  var categorylist =<Category> [].obs;
  var productdetails=<ProductDetails>[].obs;
  var brandlist=<Brand>[].obs;
  var cartlist=<Cart>[].obs;
  var categorySearch =<CategorySearch> [].obs;
  var sliderlist=<HomeSlider>[].obs;
  var pagenumber=556.obs;
  var pagelist=<Pages>[].obs;
  var singleCategoryProduct=<CategorySearch>[].obs;
  var selectedProductId=0.obs;
  var selectedBrandid=0.obs;
  var selectedIndex=0.obs;
  var isTaped=false.obs;
  @override
  Future<void> onInit() async {
    AllBrand();
    AllCateogry();
    //AllCategorySearch();
    AllPages();
    AllPagesbyId();
    AllSlider();
    SingleCategoryAllProductList();
    //AllDetailsofProduct();
    super.onInit();
  }
  void AllBrand() async {
    await ApiProvider().getAllBrand().then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((data) {
          brandlist.add(Brand.fromJson(data));
        });
      }
    });
  }

  void AllCateogry() async {
    await ApiProvider().getAllCategory().then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((data) {
          categorylist.add(Category.fromJson(data));
        });
      }
    });
  }

  void SingleBrandAllProductList() {
    ApiProvider().getAllSearchBrand(selectedBrandId.value.toString()).then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((data) {
          singleBrandProduct.add(BrandSearch.fromJson(data));
        });
      }
    });
  }


  void AllCategorySearch() {
    ApiProvider().getAllCategorySearch(selectedCategoryId.value.toString()).then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((data) {
          categorylist.add(Category.fromJson(data));
        }
        );
      }
    });
  }
  void AllPages() async {
    await ApiProvider().getAllPages().then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((element) {
          pagelist.add(Pages.fromJson(element));
        }
        );
      }
    }
    );
  }
  void AllPagesbyId() async {
    await ApiProvider().getSinglePageDetails(pagenumber.value.toString()).then((value) {
      if (value != null) {
        try {
            pageDetails.add(PageDetails.fromJson(value));
        } on Exception catch (e,err) {


        }
      }
    }
    );
  }
  void AllSlider() async {
    await ApiProvider().getAllSlider().then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((element) {
          sliderlist.add(HomeSlider.fromJson(element));
        }
        );
      }
    }

    );

  }
  void SingleCategoryAllProductList() async {
    await ApiProvider().getAllCategorySearch(selectedCategoryId.value.toString()).then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((element) {
          singleCategoryProduct.add(CategorySearch.fromJson(element));
        }
        );
      }
    }


    );

  }
  void AllDetailsofProduct() async {
    await ApiProvider().getProductDetails("45208").then((value) {
      if (value != null) {
        Iterable? jsonListData = jsonDecode(value);
        jsonListData?.forEach((element) {
          productdetails.add(ProductDetails.fromJson(element));
        }
        );
      }
    }

    );

  }

  void dispose() {}
  @override
  void onClose() {
    super.onClose();
  }

  void setProductDetailsName(var value)
  {
    this.productdetailsName.value=value;
  }
  void setCount(var value)
  {
    this.productdetailsQuantity.value=value;
  }
  void setProductDetailsPrice(var value)
  {
    this.productdetailsPrice.value=value;
  }
  void setProductDetailsImage(var value)
  {
    this.productdetailsImage.value=value;
  }
  void setCurrentPage(var value)
  {
    this.currentPage.value=value;
  }
  void setSingleCategoryId(var value)
  {
    this.selectedCategoryId.value=value;
  }

  void setCurrentIndex(var value) {
    this.currentIndex.value = value;
  }
  void setSelectedPage(var value)
  {
    this.selectedPage.value=value;
  }

  void setSelectedBrandId(var value) {
    this.selectedBrandId.value = value;
  }

  void setSelectedCategoryId(var value) {
    this.selectedCategoryId.value = value;
  }

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeEndDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "Password length must between 8 and 20";
    }
    return null;
  }

  String? validateEmail(String text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (FxStringValidator.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  String addPrefix(String url) {
    return 'https://$url';
  }
}
