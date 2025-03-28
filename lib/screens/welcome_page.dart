import 'package:codominio_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.shieldHalved,
                      size: 200,
                      color: Color.fromRGBO(18, 83, 196, 1),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "App de Seguridad en Condominios",
                description:
                    "La seguridad para su familia,\n es nuestro compromiso!",
                // button: you can pass your custom button,
                btnText: "View File",
                press: () {
                  Navigator.of(
                    // ignore: use_build_context_synchronously
                    context,
                  ).push(
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.blue,
                  letterSpacing: .5,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.bebasNeue(
                textStyle: TextStyle(
                  color: const Color.fromARGB(255, 231, 67, 67),
                  letterSpacing: .5,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 16 * 2.5),
            button ??
                ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: Color.fromRGBO(18, 83, 196, 1),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: FaIcon(FontAwesomeIcons.arrowRight, size: 40),
                ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
