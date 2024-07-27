import 'package:emart_seller/const/const.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      hint: normalText(text: "Choose catrgory", color: fontGrey),
      items: [],
      onChanged: (value) {},
      value: null,
      isExpanded: true,
    ),
  )
      .box
      .white
      .padding(
        EdgeInsets.symmetric(horizontal: 4),
      )
      .roundedSM
      .make();
}
