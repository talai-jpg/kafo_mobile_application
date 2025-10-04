import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/common/widgets/custom_text_field.dart';
import 'package:kafo_app/features/navigation/screen/nav_screen.dart';
import 'package:kafo_app/features/sign_up/controller/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: AppColor.primary_400,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
                border: Border.all(color: Colors.black, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.containerShadow,
                    blurRadius: 4,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حساب جديد',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'سجل معلوماتك لإنشاء حساب جديد',
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: AppColor.containerShadow,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "الأسم كامل",
                          hint: "الأسم كامل",
                          icon: Icons.person,
                          controller: nameController,
                          validator: Validators.validateName,
                        ),
                        SizedBox(height: 13),
                        CustomTextField(
                          label: "الإيميل الإلكتروني",
                          hint: "Example@hotmail.com",
                          icon: Icons.email_outlined,
                          controller: emailController,
                          validator: Validators.validateEmail,
                        ),
                        SizedBox(height: 13),
                        CustomTextField(
                          label: "رقم الجوال",
                          hint: "9665501xxxxxx+",
                          icon: Icons.phone,
                          controller: phoneController,
                          validator: Validators.validatePhone,
                        ),
                        SizedBox(height: 13),
                        CustomTextField(
                          label: "الرمز السري",
                          hint: "الرمز السري",
                          icon: Icons.lock_rounded,
                          obscure: true,
                          controller: passwordController,
                          validator: Validators.validatePassword,
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: acceptTerms,
                        onChanged: (value) {
                          setState(() {
                            acceptTerms = value!;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "أوافق على",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextSpan(
                              text: "الشروط والأحكام",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && acceptTerms) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationScreen(
                                userName: nameController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('التسجيل'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'لديك حساب بالفعل؟',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: Text('سجل دخولك'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
