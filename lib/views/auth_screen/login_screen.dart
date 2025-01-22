import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            normalText(text: welcome, size: 18.0),
            20.heightBox,
            Row(
              children: [
                Image.asset(
                  iclogo,
                  width: 70,
                  height: 70,
                )
                    .box
                    .border(color: white)
                    .rounded
                    .padding(const EdgeInsets.all(8))
                    .make(),
                10.widthBox,
                boldText(text: appname, size: 20.0),
              ],
            ),
            40.heightBox,
            normalText(text: loginTo, size: 18.0, color: lightGrey),
            10.heightBox,
            Obx(
              () => Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                        fillColor: textfieldGrey,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: purpleColor,
                        ),
                        border: InputBorder.none,
                        hintText: emailHint),
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        fillColor: textfieldGrey,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: purpleColor,
                        ),
                        border: InputBorder.none,
                        hintText: passwordHint),
                  ),
                  10.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child:
                          normalText(text: forgotPassword, color: purpleColor),
                    ),
                  ),
                  20.heightBox,
                  SizedBox(
                    width: context.screenWidth - 100,
                    child: controller.isloading.value
                        ? loadingIndicator()
                        : ourButton(
                            title: login,
                            onPress: () async {
                              // Get.to(() => const Home());
                              controller.isloading(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context,
                                      msg: "Login successfully");
                                  controller.isloading(false);
                                  Get.offAll(() {
                                    return const Home();
                                  });
                                } else {
                                  controller.isloading(false);
                                }
                              });
                            },
                          ),
                    // SizedBox(),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .outerShadow
                  .padding(const EdgeInsets.all(8))
                  .make(),
            ),
            10.heightBox,
            Center(
              child: normalText(text: anyProblem, color: lightGrey),
            ),
            const Spacer(),
            Center(
              child: boldText(text: credit),
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
