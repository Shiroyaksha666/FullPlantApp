import 'package:flutter/material.dart';
import 'package:full_plant_app/constants/constants.dart';
import 'package:full_plant_app/widgets/textform_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormWidget(
                          name: 'نام',
                          input: TextInputType.name,
                          obscure: false,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormWidget(
                            name: 'نام خانوادگی',
                            obscure: false,
                            input: TextInputType.name),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormWidget(
                            name: 'ایمیل',
                            obscure: false,
                            directionhint: TextDirection.ltr,
                            input: TextInputType.emailAddress),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormWidget(
                            name: 'پسورد',
                            directionhint: TextDirection.ltr,
                            obscure: true,
                            input: TextInputType.visiblePassword)
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
