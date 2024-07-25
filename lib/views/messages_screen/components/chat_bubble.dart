import 'package:emart_seller/const/const.dart';

Widget ChatBubble() {
  return Directionality(
    // textDirection:
    //     data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    textDirection: TextDirection.ltr,
    child: Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        // color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
        color: purpleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "${data['msg']}".text.white.size(16).make(),
          normalText(text: "Your message here..."),
          10.heightBox,
          // time.text.color(whiteColor.withOpacity(0.5)).make()
          normalText(text: "10:45PM"),
        ],
      ),
    ),
  );
}
