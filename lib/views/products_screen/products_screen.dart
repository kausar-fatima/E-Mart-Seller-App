import 'package:emart_seller/const/const.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () async {
          await controller.getCategories();
          controller.populateCategoryList();
          Get.to(() => AddProduct());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: appBarWidget(title: products),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
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
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  data: data[index],
                                ));
                          },
                          leading: Image.network(
                            data[index]['p_imgs'][0],
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          title: boldText(
                              text: "${data[index]['p_name']}",
                              color: fontGrey),
                          subtitle: Row(
                            children: [
                              normalText(
                                  text: "${data[index]['p_price']}",
                                  color: darkGrey),
                              10.widthBox,
                              normalText(
                                  text: data[index]['is_featured'] == true
                                      ? "Featured"
                                      : '',
                                  color: green),
                            ],
                          ),
                          trailing: VxPopupMenu(
                            arrowSize: 0.0,
                            menuBuilder: () {
                              return Column(
                                children:
                                    List.generate(popupMenuTitles.length, (i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          popupMenuIcons[i],
                                          color: data[index]['featured_id'] ==
                                                      currentUser!.uid &&
                                                  i == 0
                                              ? green
                                              : darkGrey,
                                        ),
                                        10.widthBox,
                                        normalText(
                                            text: data[index]['featured_id'] ==
                                                        currentUser!.uid &&
                                                    i == 0
                                                ? 'Remove feature'
                                                : popupMenuTitles[i],
                                            color: darkGrey),
                                      ],
                                    ).onTap(() {
                                      switch (i) {
                                        case 0:
                                          if (data[index]['is_featured'] ==
                                              true) {
                                            controller
                                                .removeFeatured(data[index].id);
                                            VxToast.show(context,
                                                msg: "Removed");
                                          } else {
                                            controller
                                                .addFeatured(data[index].id);
                                            VxToast.show(context, msg: "Added");
                                          }

                                          break;
                                        case 1:
                                          break;
                                        case 2:
                                          controller
                                              .removeProduct(data[index].id);
                                          VxToast.show(context,
                                              msg: "Product removed");
                                          break;
                                        default:
                                      }
                                    }),
                                  );
                                }),
                              ).box.white.rounded.width(200).make();
                            },
                            clickType: VxClickType.singleClick,
                            child: Icon(Icons.more_vert_rounded),
                          ),
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
