import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/common/widgets/custom_text_field.dart';
import 'package:kafo_app/features/sign_up/controller/validators.dart';
import 'package:kafo_app/features/sign_up/screen/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
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
                      ' تسجيل الدخول',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "الإيميل الإلكتروني",
                          hint: "Example@gmail.com",
                          icon: Icons.email_outlined,
                          controller: emailController,
                          validator: Validators.validateEmail,
                        ),

                        SizedBox(height: 16),
                        CustomTextField(
                          label: "الرمز السري",
                          hint: "الرمز السري",
                          icon: Icons.lock_rounded,
                          obscure: true,
                          controller: passwordController,
                          validator: Validators.validatePassword,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 220),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "نسيت كلمة المرور؟",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),

                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  acceptTerms) {}
                            },
                            child: Text('الدخول'),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ليس لديك حساب؟',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),

                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  ),
                                );
                              },
                              child: Text('تسجيل جديد'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Divider(
                                thickness: 1,
                                color: AppColor.primary_400,
                                endIndent: 10,
                              ),
                            ),

                            Text(
                              'أو سجل من خلال',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(width: 5),
                            const Expanded(
                              child: Divider(
                                thickness: 1,
                                color: AppColor.primary_400,
                                endIndent: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        Image.asset('assets/images/Frame 9.png'),
                      ],
                    ),
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
