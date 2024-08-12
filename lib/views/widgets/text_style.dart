import 'package:emart_seller/const/const.dart';

Widget normalText(
    {dynamic text, Color color = Colors.white, double size = 14.0}) {
  return "$text".toString().text.color(color).size(size).make();
}

Widget boldText(
    {dynamic text, Color color = Colors.white, double size = 14.0}) {
  return "$text".toString().text.color(color).size(size).bold.make();
}
