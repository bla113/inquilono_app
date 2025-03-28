import 'package:codominio_app/constants/icons.svg.dart';
import 'package:codominio_app/controller/auth/edit_profile_controller.dart';
import 'package:codominio_app/controller/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  EditProfile({super.key, required this.idUser, required this.name});
  String idUser;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Editar Perfil",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Solo puedes cambiar tu contraseña",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF757575)),
                  ),
                  // const SizedBox(height: 16),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  SignInForm(idUser: idUser, nombre: name),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                  const SizedBox(height: 16),
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
  const SignInForm({super.key, required this.idUser, required this.nombre});
  final String idUser;
  final String nombre;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatpasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.nombre;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,

            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              enabled: false,
              hintText: "Nombre de Usuario",
              labelText: "Usuario",
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
              controller: _passwordController,
              onSaved: (password) {},
              onChanged: (password) {},
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Contraseña nueva",
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextFormField(
              controller: _repeatpasswordController,
              onSaved: (password) {},
              onChanged: (password) {},
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Repetir contraseña",
                labelText: "Repetir contraseña",
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
              // ignore: unused_local_variable
              var accessToken = await getSharedPreferences();
              var response = await editProfileApp(
                accessToken,
                11,
                _passwordController.text,
              );
              if (response != null) {
                debugPrint('Se actualizo correctamente');
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color.fromRGBO(18, 83, 196, 1),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            child: const Text("Actualizar"),
          ),

          const SizedBox(height: 8),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color.fromRGBO(52, 201, 238, 1),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            child: const Text("Regresar"),
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
          "Don’t have an account? ",
          style: TextStyle(color: Color(0xFF757575)),
        ),
        GestureDetector(
          onTap: () {
            // Handle navigation to Sign Up
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Color(0xFFFF7643)),
          ),
        ),
      ],
    );
  }
}
