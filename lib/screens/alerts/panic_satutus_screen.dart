import 'dart:async';
import 'package:codominio_app/components/widgets/circular_progress.dart';
import 'package:codominio_app/screens/panic_screen.dart';

import 'package:flutter/material.dart';

class StatusPanicScreen extends StatefulWidget {
  const StatusPanicScreen({super.key});

  @override
  State<StatusPanicScreen> createState() => _StatusPanicScreenState();
}

class _StatusPanicScreenState extends State<StatusPanicScreen> {
  int timeLeft = 300;
  String seconds = '';
  String minutes = '';
  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          minutes = (timeLeft / 60).floor().toString().padLeft(2, '0');
          seconds = (timeLeft % 60).floor().toString().padLeft(2, '0');
          timeLeft--;
        });
      } else {
        // timer.cancel();
        setState(() {
          timeLeft = 300;
        });
        // Navigate to the next screen or perform any action you want after the countdown
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(18, 83, 196, 1),
        foregroundColor: Colors.white,
        title: const Text("Estado de la alerta"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Spacer(flex: 2),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressPanic(),
                ),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "LA AYUDA ESTÁ EN CAMINO ",
                segundos: seconds,
                minutos: minutes,
                description:
                    "Mantente en un lugar seguro y espera a que llegue la ayuda. ",
                button: Transform.scale(scale: 1.8),

                press: () async {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PanicScreen()),
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
    this.segundos,
    this.minutos,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final String? segundos, minutos;

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
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16 * 2.5),

            ElevatedButton(
              onPressed: press,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: Color.fromRGBO(18, 83, 196, 1),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: Column(
                children: [
                  Text(btnText ?? "Cancelar".toUpperCase()),
                  Text(
                    '$minutos'
                    ':'
                    '$segundos',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

const paymentProcessIllistration = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M280 24c0-13.3-10.7-24-24-24s-24 10.7-24 24l0 80c0 13.3 10.7 24 24 24s24-10.7 24-24l0-80zM185.8 224l140.3 0c6.8 0 12.8 4.3 15.1 10.6L360.3 288l-208.6 0 19.1-53.4c2.3-6.4 8.3-10.6 15.1-10.6zm-75.3-10.9L82.2 292.4C62.1 300.9 48 320.8 48 344l0 40 0 64 0 32c0 17.7 14.3 32 32 32l16 0c17.7 0 32-14.3 32-32l0-32 256 0 0 32c0 17.7 14.3 32 32 32l16 0c17.7 0 32-14.3 32-32l0-32 0-64 0-40c0-23.2-14.1-43.1-34.2-51.6l-28.3-79.3C390.1 181.3 360 160 326.2 160l-140.3 0c-33.8 0-64 21.3-75.3 53.1zM128 344a24 24 0 1 1 0 48 24 24 0 1 1 0-48zm232 24a24 24 0 1 1 48 0 24 24 0 1 1 -48 0zM39 39c-9.4 9.4-9.4 24.6 0 33.9l48 48c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9L73 39c-9.4-9.4-24.6-9.4-33.9 0zm400 0L391 87c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l48-48c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0z"/></svg>
''';
