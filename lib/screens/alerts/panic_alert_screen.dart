//import 'package:codominio_app/components/widgets/panic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFBFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 8.2),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                // Header Image
                // AspectRatio(
                //   aspectRatio: 2.12,
                //   child: Container(
                //     width: double.infinity,
                //     margin: const EdgeInsets.all(20),
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 20,
                //       vertical: 16,
                //     ),
                //     decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 180, 224, r238),
                //       borderRadius: BorderRadius.circular(20),
                //     ),

                //     child: AspectRatio(
                //       aspectRatio: 1.02,
                //       child: Container(
                //         padding: const EdgeInsets.all(20),
                //         decoration: BoxDecoration(
                //           color: const Color.fromARGB(
                //             255,
                //             245,
                //             242,
                //             242,
                //           ).withOpacity(0.1),
                //           borderRadius: BorderRadius.circular(12),
                //         ),

                //         child: SvgPicture.string(
                //           dangerIcon,

                //           colorFilter: const ColorFilter.mode(
                //             Color.fromRGBO(186, 228, 245, 1),
                //             BlendMode.srcIn,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // Main Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
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
                          'Preciona en llamar para solicitar ayuda !',
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
                      const SizedBox(height: 29),
                      Center(
                        child: AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 242, 242),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            child: SvgPicture.string(
                              alertWarning,

                              colorFilter: const ColorFilter.mode(
                                Color.fromRGBO(243, 22, 33, 1),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Security Number Section
                      const SizedBox(height: 100),
                      const Text(
                        'Matén precionado por 3 segundos para solicitar ayuda...',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2F2F2F),
                          fontFamily: 'Satoshi',
                        ),
                      ),

                      // First Row of Emergency Contacts
                      const SizedBox(height: 41),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onLongPress: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  231,
                                  62,
                                  76,
                                ),
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 70),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                              ),
                              onPressed: () {},

                              child: Icon(Icons.call, size: 50),
                            ),
                          ),
                          const SizedBox(width: 9),
                        ],
                      ),

                      // Second Row of Emergency Contacts
                      const SizedBox(height: 14),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: EmergencyContactItem(
                      //         icon: '', //, // Replace with actual image path
                      //         label: 'Ambulance',
                      //       ),
                      //     ),
                      //     const SizedBox(width: 9),
                      //     Expanded(
                      //       child: EmergencyContactItem(
                      //         icon: '', //
                      //         // Replace with actual image path
                      //         label: 'Auxiliary Police',
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),

                // Bottom Navigation Bar
                const SizedBox(height: 43),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const dangerIcon =
    '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
  <path fill-rule="evenodd" d="M11.484 2.17a.75.75 0 0 1 1.032 0 11.209 11.209 0 0 0 7.877 3.08.75.75 0 0 1 .722.515 12.74 12.74 0 0 1 .635 3.985c0 5.942-4.064 10.933-9.563 12.348a.749.749 0 0 1-.374 0C6.314 20.683 2.25 15.692 2.25 9.75c0-1.39.223-2.73.635-3.985a.75.75 0 0 1 .722-.516l.143.001c2.996 0 5.718-1.17 7.734-3.08ZM12 8.25a.75.75 0 0 1 .75.75v3.75a.75.75 0 0 1-1.5 0V9a.75.75 0 0 1 .75-.75ZM12 15a.75.75 0 0 0-.75.75v.008c0 .414.336.75.75.75h.008a.75.75 0 0 0 .75-.75v-.008a.75.75 0 0 0-.75-.75H12Z" clip-rule="evenodd" />
</svg>
''';
const ambulanceIcon =
    '''<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 3.75v4.5m0-4.5h-4.5m4.5 0-6 6m3 12c-8.284 0-15-6.716-15-15V4.5A2.25 2.25 0 0 1 4.5 2.25h1.372c.516 0 .966.351 1.091.852l1.106 4.423c.11.44-.054.902-.417 1.173l-1.293.97a1.062 1.062 0 0 0-.38 1.21 12.035 12.035 0 0 0 7.143 7.143c.441.162.928-.004 1.21-.38l.97-1.293a1.125 1.125 0 0 1 1.173-.417l4.423 1.106c.5.125.852.575.852 1.091V19.5a2.25 2.25 0 0 1-2.25 2.25h-2.25Z" />
</svg>

''';
const alertWarning =
    '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 32c14.2 0 27.3 7.5 34.5 19.8l216 368c7.3 12.4 7.3 27.7 .2 40.1S486.3 480 472 480L40 480c-14.3 0-27.6-7.7-34.7-20.1s-7-27.8 .2-40.1l216-368C228.7 39.5 241.8 32 256 32zm0 128c-13.3 0-24 10.7-24 24l0 112c0 13.3 10.7 24 24 24s24-10.7 24-24l0-112c0-13.3-10.7-24-24-24zm32 224a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"/></svg>


''';
