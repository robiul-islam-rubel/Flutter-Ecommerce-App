import 'dart:ui';

class ColorSchema{

  Color? appBar=Color(0XFF333333);
  Color? bottomBar;

  ColorSchema.fromJson(Map<String,dynamic> json)
  {
    this.appBar=json['appBar']!=null?Color(json["appBar"]):null;
    this.bottomBar=json['bottomBar'];
  }

}