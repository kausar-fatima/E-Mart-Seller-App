import 'package:emart_seller/const/const.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreens = [
      const HomeScreen(),
      const ProductsScreen(),
      const OrdersScreen(),
      const ProfileScreen()
    ];

    var bottomNavbar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: dashboard,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProducts,
          color: darkGrey,
          width: 24,
        ),
        label: products,
      ),
      BottomNavigationBarItem(
          icon: Image.asset(
            icOrders,
            color: darkGrey,
            width: 24,
          ),
          label: orders),
      BottomNavigationBarItem(
          icon: Image.asset(
            icGeneralSettings,
            color: darkGrey,
            width: 24,
          ),
          label: settings),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          items: bottomNavbar,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: dashboard, color: fontGrey, size: 18.0),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: navScreens.elementAt(
                controller.navIndex.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
