import 'package:flutter/material.dart';
import 'package:full_plant_app/api/api_service.dart';
import 'package:full_plant_app/constants/constants.dart';
import 'package:full_plant_app/models/woocommerce/register_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late ApiService apiService;
  late CustomerModel customerModel;
  bool isApiCalled = false;

  @override
  void initState() {
    apiService = ApiService();
    customerModel = CustomerModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 25,
              right: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Consts.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Consts.primaryColor,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Consts.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.share,
                      color: Consts.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 130,
              right: 20,
              left: 20,
              child: SizedBox(
                height: size.height * 0.8,
                width: size.width * 0.8,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            initialValue: customerModel.firstName,
                            onChanged: (value) {
                              customerModel.firstName = value;
                            },
                            keyboardType: TextInputType.name,
                            style: const TextStyle(fontSize: 20, height: 2),
                            cursorColor: Consts.primaryColor,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: 'نام',
                              labelStyle: TextStyle(
                                  color: Consts.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              contentPadding: const EdgeInsets.all(15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Consts.primaryColor,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            initialValue: customerModel.lastName,
                            onChanged: (value) {
                              customerModel.lastName = value;
                            },
                            keyboardType: TextInputType.name,
                            style: const TextStyle(fontSize: 20, height: 2),
                            cursorColor: Consts.primaryColor,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              labelText: 'نام خانوادگی',
                              labelStyle: TextStyle(
                                  color: Consts.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              contentPadding: const EdgeInsets.all(15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Consts.primaryColor,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            initialValue: customerModel.email,
                            onChanged: (value) {
                              customerModel.email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 20, height: 2),
                            cursorColor: Consts.primaryColor,
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              labelText: 'ایمیل',
                              labelStyle: TextStyle(
                                  color: Consts.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              contentPadding: const EdgeInsets.all(15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Consts.primaryColor,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            initialValue: customerModel.password,
                            onChanged: (value) {
                              customerModel.password = value;
                            },
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(fontSize: 20, height: 2),
                            cursorColor: Consts.primaryColor,
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                              labelText: 'پسورد',
                              labelStyle: TextStyle(
                                  color: Consts.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              contentPadding: const EdgeInsets.all(15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Consts.primaryColor,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Consts.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {
                                apiService
                                    .createCustomer(customerModel)
                                    .then((retRes) {
                                  if (retRes) {
                                    if (context.mounted) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('woocommerce'),
                                              content: const Text('succesfull'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('ok'))
                                              ],
                                            );
                                          });
                                    }
                                  } else {
                                    if (context.mounted) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('woocommerce'),
                                              content:
                                                  const Text('not successfull'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('ok'))
                                              ],
                                            );
                                          });
                                    }
                                  }
                                });
                              },
                              child: const Text(
                                'ثبت نام',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Consts.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'قبلا اکانت ساختی؟',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
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
    );
  }
}
