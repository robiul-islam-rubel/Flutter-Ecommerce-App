import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

class CartProvider with ChangeNotifier{
  int _counter=0;
  int get counter=>_counter;
  double _totalPrice=0.0;
  double get totalPrice=>_totalPrice;


  void _setPrefItems() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("cart_item", _counter);
    prefs.setDouble("total_price",_totalPrice);
    notifyListeners();
  }
  void _getPrefItems() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter=prefs.getInt('cart_item')??0;
   _totalPrice=prefs.getDouble("total_price")??0.0;
    notifyListeners();
  }
  void addCounter()
  {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }
  void removeCounter()
  {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }
  void getCounter()
  {
    _counter--;
    return
    _setPrefItems();
    notifyListeners();
  }
}