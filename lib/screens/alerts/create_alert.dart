//import 'package:codominio_app/constants/icons.svg.dart';
import 'package:codominio_app/constants/icons.svg.dart';
import 'package:codominio_app/controller/alert/create_alert_controller.dart';
import 'package:codominio_app/controller/auth/login_controller.dart';
//import 'package:codominio_app/screens/alerts/alert_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CreateAlertScreen extends StatefulWidget {
  const CreateAlertScreen({
    super.key,
    required this.titulo,
    required this.icon,
  });

  final String titulo;
  final String icon;

  @override
  State<CreateAlertScreen> createState() => _CreateAlertScreenState();
}

class _CreateAlertScreenState extends State<CreateAlertScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _descripcion = TextEditingController();
  @override
  void initState() {
    super.initState();

    _tituloController.text = widget.titulo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.2),
        child: LogoWithTitle(
          title: "Crear Alerta de ${widget.titulo}",
          icon: alertIconShiedlActive,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    enabled: false,
                    onChanged: (String value) async {
                      debugPrint(value);
                    },
                    //initialValue: titulo,
                    controller: _tituloController,
                    decoration: const InputDecoration(
                      hintText: 'Titulo',

                      filled: true,
                      fillColor: Color(0xFFF5FCF9),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0 * 1.5,
                        vertical: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    onSaved: (passaword) {
                      // Save it
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextFormField(
                      controller: _descripcion,
                      autofocus: true,
                      //initialValue: 'Hay una persona realizando disparos',
                      maxLines: 10,
                      decoration: const InputDecoration(
                        hintText: ' Descripción',
                        filled: true,
                        fillColor: Color(0xFFF5FCF9),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0 * 1.5,
                          vertical: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      onSaved: (descrip) {
                        // Save it
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final token = await getSharedPreferences();
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
                var response = await createAlert(
                  _tituloController.text,
                  _descripcion.text,
                  token,
                );
                if (response == 200) {
                  const snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Alerta creada!',
                      message: 'Pronto llegará la ayuda!',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.help,
                    ),
                  );

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                } else {
                  var snackBar = SnackBar(
                    /// need to set following properties for best effect of awesome_snackbar_content
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Error!',
                      message: 'No se pudo crear la alerta!',

                      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                      contentType: ContentType.failure,
                    ),
                  );

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color.fromRGBO(18, 83, 196, 1),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const StadiumBorder(),
              ),
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoWithTitle extends StatelessWidget {
  final String title, subText, icon;
  final List<Widget> children;

  const LogoWithTitle({
    super.key,
    required this.title,
    required this.icon,
    this.subText = '',
    required this.children,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.1),
                SvgPicture.string(
                  width: 100,
                  icon,
                  colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(228, 5, 72, 1),
                    BlendMode.srcIn,
                  ),
                ),

                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    subText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                      color: Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
                ...children,
              ],
            ),
          );
        },
      ),
    );
  }
}
