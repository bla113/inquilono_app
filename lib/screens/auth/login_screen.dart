import 'package:codominio_app/constants/icons.svg.dart';
import 'package:codominio_app/controller/auth/login_controller.dart';
import 'package:codominio_app/screens/auth/register_screen.dart';
import 'package:codominio_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FaIcon(
                      FontAwesomeIcons.shieldHalved,
                      size: 150,
                      color: Color.fromRGBO(18, 83, 196, 1),
                    ),
                  ),
                  Text(
                    "Inqulinos",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Bienvenido a CondominioCR",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Ingrese sus credenciales",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF757575)),
                  ),
                  // const SizedBox(height: 16),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  SignInForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: SvgPicture.string(googleIcon),
                        press: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SocalCard(
                          icon: SvgPicture.string(facebookIcon),
                          press: () {},
                        ),
                      ),
                      SocalCard(
                        icon: SvgPicture.string(twitterIcon),
                        press: () {},
                      ),
                    ],
                  ),
                  //const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);

// ignore: must_be_immutable
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isLoading = false;

  TextEditingController emailController = TextEditingController(
    text: 'admin@admin.com',
  );

  TextEditingController passwordController = TextEditingController(
    text: 'password',
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailController,

            onSaved: (email) {},
            onChanged: (email) {},
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Ingrese nombre de usuario",
              labelText: "Correo o Usuario",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Color(0xFF757575)),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              suffix: SvgPicture.string(mailIcon),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Color(0xFFFF7643)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextFormField(
              controller: passwordController,
              onSaved: (password) {},
              onChanged: (password) {},
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Ingrese su contraseña",
                labelText: "Contraseña",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: const TextStyle(color: Color(0xFF757575)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                suffix: SvgPicture.string(lockIcon),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: Color(0xFFFF7643)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });

              var response = await login(
                emailController.text,
                passwordController.text,
              );

              if (response == 200) {
                Navigator.of(
                  // ignore: use_build_context_synchronously
                  context,
                ).push(MaterialPageRoute(builder: (context) => HomePage()));
              } else {
                debugPrint('Problemas para inicar seción');
              }

              setState(() {
                isLoading = false;
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color.fromRGBO(18, 83, 196, 1),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 60),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child:
                isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                      'Ingresar',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                    ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 151, 189, 238),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 60),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Text(
              'Crea Cuenta',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({super.key, required this.icon, required this.press});

  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "No tienes cuenta? ",
          style: TextStyle(color: Color(0xFF757575)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Cerar una",
            style: TextStyle(color: Color(0xFFFF7643)),
          ),
        ),
      ],
    );
  }
}

// Icons
