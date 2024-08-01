import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/orders_controller.dart';
import 'package:emart_seller/services/store_services.dart';
import 'package:emart_seller/views/orders_screen/order_details.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());
    return Scaffold(
      appBar: appBarWidget(title: orders),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(color: green, onPress: () {}, title: "Confirm Order"),
      ),
      body: StreamBuilder(
        stream: StoreServices.getOrders(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) {
                      var time = data[index]['order_date'].toDate();
                      return Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: ListTile(
                          onTap: () {
                            Get.to(() => OrderDetails(
                                  data: data[index],
                                ));
                          },
                          tileColor: textfieldGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          leading: Image.asset(
                            imgProduct,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          title: boldText(
                              text: "${data[index]['order_code']}",
                              color: purpleColor),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: fontGrey,
                                  ),
                                  10.widthBox,
                                  boldText(
                                      text: intl.DateFormat()
                                          .add_yMd()
                                          .format(time),
                                      color: darkGrey),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.payment,
                                    color: fontGrey,
                                  ),
                                  10.widthBox,
                                  boldText(text: unpaid, color: red),
                                ],
                              )
                            ],
                          ),
                          trailing: boldText(
                              text: "\$${data[index]['total_amount']}",
                              color: purpleColor,
                              size: 16.0),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
