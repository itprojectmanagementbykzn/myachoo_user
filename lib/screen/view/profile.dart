import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/routes/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Obx(
      () => !(controller.currentUser.value == null)
          ? _LoginUser()
          : LogoutUser(),
    );
  }
}

class LogoutUser extends StatelessWidget {
  const LogoutUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.transparent,
              constraints: BoxConstraints(
                maxWidth: 400.0,
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/logo.png",
                      width: Get.width / 3,
                    ),
                  ),
                  /*Text(
                    "Pos App",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: Get.width - 100,
                    child: InkWell(
                      onTap: () => homeController.signInWithGoogle(),
                      child: Card(
                        color: homeIndicatorColor,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: homeIndicatorColor,
                                radius: 12,
                                child: Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Sign in with Google",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginUser extends StatelessWidget {
  const _LoginUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(top: 20),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Image.asset(
                      "assets/logotr.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  //   ),
                  // ),
                  Obx(
                    () => Text(
                      _controller.currentUser.value?.emailAddress ?? '',//-Email Address Will be Phone Number beacause
                      //--I didn't change it,TODO: need to change emailAddress to phone number
                      //--instance variable of AuthUser Object
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //-----Point For Admin To Test On Their Own----//
                  Obx(
                    () => Text(
                      "Your points: ${_controller.currentUser.value?.points ?? 0}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Center(
              child: GestureDetector(
                onTap: _controller.logout,
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    color: homeIndicatorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
           //Delete
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    _controller.deleteAccount();
                  },
                  child: Text("Delete Account",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        wordSpacing: 2,
                        color: Colors.white,
                      ))),
            ),
        ],
      ),
    );
  }
}

class _AdminPanel extends StatelessWidget {
  const _AdminPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          child: Text(
            "Admin Feature",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.changeCat("");
            Get.toNamed(uploadItemScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upload Item"),
                    Icon(Icons.upload),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(mangeItemScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Item"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(advertisementUrl);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Advertisement"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(categoriesUrl);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Categories"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(statusUrl);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Status"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(tagsUrl);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Tags"),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(purchaseScreen);
          },
          child: Container(
            height: 60,
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Orders  🎁"),
                    CircleAvatar(
                        backgroundColor: Colors.orange,
                        minRadius: 20,
                        maxRadius: 20,
                        child: Text(
                          "${controller.purchcasesCashOn().length + controller.purchcasesPrePay().length}",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
