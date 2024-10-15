import 'package:aplikasi_login/dashboardprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasi Login',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HalamanLogin()),
        GetPage(name: '/dashboard', page: () => HalamanDashboard()),
      ],
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}

class HalamanLogin extends StatelessWidget {
  final username = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;

  void login() {
    if (username.value == 'Samantha' && password.value == '123456') {
      isLoading.value = true;
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;
        Get.offNamed('/dashboard');
      });
    } else {
      Get.snackbar('Login Failed', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 250, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border:
                          Border.all(color: Color.fromARGB(255, 89, 88, 88)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan username",
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 37, 37, 37),
                        ),
                        onChanged: (value) {
                          username.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border:
                          Border.all(color: Color.fromARGB(255, 89, 88, 88)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan Password",
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 37, 37, 37),
                        ),
                        onChanged: (value) {
                          password.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Obx(() => GestureDetector(
                    onTap: isLoading.value ? null : login,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(56, 40, 87, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: isLoading.value
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
