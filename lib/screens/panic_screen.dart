import 'package:codominio_app/controller/alert/panic_alert_controller.dart';
import 'package:codominio_app/controller/auth/login_controller.dart';
import 'package:codominio_app/screens/alerts/panic_satutus_screen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PanicScreen extends StatefulWidget {
  const PanicScreen({super.key});

  @override
  State<PanicScreen> createState() => _PanicScreenState();
}

class _PanicScreenState extends State<PanicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(18, 83, 196, 1),
        foregroundColor: Colors.white,
        title: const Text("Emergencia"),
        actions: [
          IconButton(icon: const Icon(Icons.logout_outlined), onPressed: () {}),
        ],
      ),
      backgroundColor: const Color(0xFFFCFBFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 8.2),
            child: Column(
              children: [
                // Header Image

                // Main Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Emergency Title
                      const Center(
                        child: Text(
                          'Tienes una emergencia?',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2F2F2F),
                            fontFamily: 'Satoshi',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Instruction Text
                      const SizedBox(height: 9),
                      const Center(
                        child: Text(
                          ' Presione el botón debajo y la ayuda\n le llegará pronto. ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F2F2F),
                            fontFamily: 'Satoshi',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      // Emergency Button
                      const SizedBox(height: 50),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // debugPrint('SOS button pressed!');
                          },
                          onLongPress: () async {
                            var accessToken = await getSharedPreferences();
                            var response = await createPanicAlert(accessToken);
                            if (response == 200) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => StatusPanicScreen(),
                                ),
                              );
                            } else {
                              debugPrint('Panic Alert failed');
                            }
                          },

                          style: ElevatedButton.styleFrom(
                            elevation: 10,

                            backgroundColor: const Color.fromARGB(
                              255,
                              240,
                              24,
                              24,
                            ),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(
                              100,
                            ), // Ensure padding for circular shape
                          ),
                          child: Text(
                            'SOS',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ),
                      ),

                      // Security Number Section
                      const SizedBox(height: 120),
                      const Text(
                        'Numeros de Seguridad',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2F2F2F),
                          fontFamily: 'Satoshi',
                        ),
                      ),

                      const Text(
                        'Lista de Seguridad',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFC3C3C3),
                          fontFamily: 'Satoshi',
                        ),
                      ),

                      // First Row of Emergency Contacts
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(16, 16, 16, 0.2),
                                    blurRadius: 12,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 7,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(11),

                                    child: FaIcon(
                                      FontAwesomeIcons.personMilitaryPointing,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: TextButton(
                                      onPressed: () => ("tel://21213123123"),
                                      child: Text(
                                        'Policia',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF2F2F2F),
                                          fontFamily: 'Satoshi',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(16, 16, 16, 0.2),
                                    blurRadius: 12,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 5,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(11),
                                    child: FaIcon(
                                      FontAwesomeIcons.hospitalUser,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Ambulancia',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF2F2F2F),
                                          fontFamily: 'Satoshi',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Second Row of Emergency Contacts
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(16, 16, 16, 0.2),
                                    blurRadius: 12,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 7,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(11),
                                    child: FaIcon(
                                      FontAwesomeIcons.fireFlameCurved,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Bomberos',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF2F2F2F),
                                          fontFamily: 'Satoshi',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(16, 16, 16, 0.2),
                                    blurRadius: 12,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 7,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(11),
                                    child: FaIcon(
                                      FontAwesomeIcons.personMilitaryPointing,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: TextButton(
                                      onPressed: () => ("tel://21213123123"),
                                      child: Text(
                                        'Guardia',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF2F2F2F),
                                          fontFamily: 'Satoshi',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Bottom Navigation Bar
                const SizedBox(height: 43),
                // Container(
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Color.fromRGBO(0, 0, 0, 0.14),
                //         blurRadius: 6,
                //         offset: Offset(0, -4),
                //       ),
                //     ],
                //   ),
                //   padding: const EdgeInsets.fromLTRB(78, 13, 78, 24),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       // Home Tab (Active)
                //       Expanded(
                //         child: Column(
                //           children: [
                //             Image.asset(
                //               'assets/images/home_icon.png', // Replace with actual image path
                //               width: 34,
                //               height: 34,
                //               fit: BoxFit.contain,
                //             ),
                //             const Text(
                //               'Home',
                //               style: TextStyle(
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w700,
                //                 color: Color(0xFF6D55F5),
                //                 fontFamily: 'Satoshi',
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),

                //       // Profile Tab (Inactive)
                //       Expanded(
                //         child: Column(
                //           children: [
                //             Image.asset(
                //               'assets/images/profile_icon.png', // Replace with actual image path
                //               width: 31,
                //               height: 31,
                //               fit: BoxFit.contain,
                //             ),
                //             const SizedBox(height: 4),
                //             const Text(
                //               'Profile',
                //               style: TextStyle(
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w700,
                //                 color: Color(0xFFD7D7D7),
                //                 fontFamily: 'Satoshi',
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
