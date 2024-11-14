import 'package:flutter/material.dart';
import 'package:full_plant_app/api/api_service.dart';
import 'package:full_plant_app/constants/constants.dart';
import 'package:full_plant_app/models/woocommerce/register_model.dart';
import 'package:full_plant_app/ui/signup/form_field.dart';
import 'package:full_plant_app/utils/extensions.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late ApiService apiService;
  late CustomerModel customerModel;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
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
                child: Form(
                  key: globalKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CustomFormField(
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود .';
                              }
                              return null;
                            },
                            initialvalue: customerModel.firstName,
                            onchange: (value) {
                              customerModel.firstName = value;
                            },
                            textDirection: TextDirection.rtl,
                            labelname: 'نام',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomFormField(
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود .';
                              }
                              return null;
                            },
                            initialvalue: customerModel.lastName,
                            onchange: (value) {
                              customerModel.lastName = value;
                            },
                            textDirection: TextDirection.rtl,
                            labelname: 'نام خانوادگی',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomFormField(
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود .';
                              } else if (!value!.isValidEmail) {
                                return 'ایمیل نامعتبر است.';
                              }
                              return null;
                            },
                            initialvalue: customerModel.email,
                            onchange: (value) {
                              customerModel.email = value;
                            },
                            textDirection: TextDirection.ltr,
                            labelname: 'ایمیل',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomFormField(
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'این فیلد باید تکمیل شود .';
                              } else if (!value!.isValidPassword) {
                                return 'پسورد ضعیف است.';
                              }
                              return null;
                            },
                            initialvalue: customerModel.password,
                            onchange: (value) {
                              customerModel.password = value;
                            },
                            textDirection: TextDirection.ltr,
                            labelname: 'پسورد',
                            obscure: true,
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
                                  if (globalKey.currentState!.validate()) {
                                    setState(() {
                                      isApiCalled = true;
                                    });
                                    apiService
                                        .createCustomer(customerModel)
                                        .then((retRes) {
                                      setState(() {
                                        isApiCalled = false;
                                      });
                                      if (retRes) {
                                        if (context.mounted) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      const Text('woocommerce'),
                                                  content: const Text(
                                                      'Registeration Successful'),
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
                                                  title:
                                                      const Text('woocommerce'),
                                                  content: const Text(
                                                      'Email Already Registered.'),
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
                                  }
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
                          const SizedBox(
                            height: 30,
                          ),
                          isApiCalled
                              ? const Text(
                                  'لطفا منتظر بمانید...',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              : const Text(''),
                        ],
                      ),
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
