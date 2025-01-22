import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/orders_controller.dart';
import 'package:emart_seller/views/orders_screen/order_details.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
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
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) {
                      // Convert the timestamp to DateTime
                      DateTime orderDate =
                          (data[index]['order_date'] as Timestamp).toDate();

                      // Format the DateTime object
                      String formattedDate =
                          intl.DateFormat.yMd().add_jm().format(orderDate);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 4),
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
                                  // Icon(
                                  //   Icons.calendar_month,
                                  //   color: fontGrey,
                                  // ),
                                  // 10.widthBox,
                                  boldText(
                                      text: formattedDate, color: darkGrey),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
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
