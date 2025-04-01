//import 'package:codominio_app/controller/alert/get_alert_controller.dart';

import 'package:codominio_app/constants/icons.svg.dart';
import 'package:codominio_app/controller/alert/get_alert_type_controller.dart';
import 'package:codominio_app/controller/alert/serarch_alert_controller.dart';
import 'package:codominio_app/controller/auth/login_controller.dart';
import 'package:codominio_app/screens/alerts/create_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlertScreeAPI extends StatefulWidget {
  const AlertScreeAPI({super.key});

  @override
  State<AlertScreeAPI> createState() => _AlertScreeAPIState();
}

class _AlertScreeAPIState extends State<AlertScreeAPI> {
  List tipoAlerta = [];
  bool isLoading = false;
  getAlertApi() async {
    isLoading = true;
    var accessToken = await getSharedPreferences();

    var response = await getAlertApiApp(accessToken);

    if (response != null) {
        isLoading = false;
      setState(() {
        tipoAlerta.addAll(response);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getAlertApi();

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(18, 83, 196, 1),
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text("Alertas"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Builder(
          builder: (context) {
            return Column(
              children: [
              
                Form(
                  child: TextFormField(
                    onEditingComplete: () {},
                    onChanged: (value) async {
                       isLoading=true;
                      var accessToken = await getSharedPreferences();
                      var response = await searchAlertApiApp(
                        accessToken,
                        value,
                      );
                      if (response != null) {
                        isLoading=false;

                        setState(() {
                          tipoAlerta=[];
                          tipoAlerta.addAll(response);
                        });
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintStyle: const TextStyle(color: Color(0xFF757575)),
                      fillColor: const Color.fromARGB(255, 255, 254, 254),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search product",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                ListView.builder(
                  itemCount: tipoAlerta.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ProfileMenu(
                      text: tipoAlerta[index]['titulo'],
                      categoria: tipoAlerta[index]['categoria'],
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => CreateAlertScreen(
                                  icon: alertIconActive,
                                  titulo: tipoAlerta[index]['titulo'],
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
                 isLoading? CircularProgressIndicator.adaptive():  
                 const SizedBox(height: 2),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://i.postimg.cc/0jqKB6mS/Profile-Image.png",
            ),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.string(cameraIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(18, 83, 196, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AlertScreeAPI()));
        },
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(text: 'Tod  ', style: TextStyle(fontSize: 24)),
              TextSpan(
                text: 'Alertas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onEditingComplete: () {},
        onChanged: (value) async {
          var accessToken = await getSharedPreferences();
          var response = await searchAlertApiApp(accessToken, value);
          if (response != null) {
           
          }
        },
        decoration: InputDecoration(
          filled: true,
          hintStyle: const TextStyle(color: Color(0xFF757575)),
          fillColor: const Color.fromARGB(255, 255, 254, 254),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    this.press,
    required this.categoria,
  });

  final String text;
  final String categoria;

  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Color.fromRGBO(18, 83, 196, 1),
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.warning,
              size: 100,
              color: Color.fromRGBO(241, 12, 12, 1),
            ),

            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: text,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, color: Color(0xFF757575)),
          ],
        ),
      ),
    );
  }
}

const cameraIcon =
    '''<svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M10 12.0152C8.49151 12.0152 7.26415 10.8137 7.26415 9.33902C7.26415 7.86342 8.49151 6.6619 10 6.6619C11.5085 6.6619 12.7358 7.86342 12.7358 9.33902C12.7358 10.8137 11.5085 12.0152 10 12.0152ZM10 5.55543C7.86698 5.55543 6.13208 7.25251 6.13208 9.33902C6.13208 11.4246 7.86698 13.1217 10 13.1217C12.133 13.1217 13.8679 11.4246 13.8679 9.33902C13.8679 7.25251 12.133 5.55543 10 5.55543ZM18.8679 13.3967C18.8679 14.2226 18.1811 14.8935 17.3368 14.8935H2.66321C1.81887 14.8935 1.13208 14.2226 1.13208 13.3967V5.42346C1.13208 4.59845 1.81887 3.92664 2.66321 3.92664H4.75C5.42453 3.92664 6.03396 3.50952 6.26604 2.88753L6.81321 1.41746C6.88113 1.23198 7.06415 1.10739 7.26604 1.10739H12.734C12.9358 1.10739 13.1189 1.23198 13.1877 1.41839L13.734 2.88845C13.966 3.50952 14.5755 3.92664 15.25 3.92664H17.3368C18.1811 3.92664 18.8679 4.59845 18.8679 5.42346V13.3967ZM17.3368 2.82016H15.25C15.0491 2.82016 14.867 2.69466 14.7972 2.50917L14.2519 1.04003C14.0217 0.418041 13.4113 0 12.734 0H7.26604C6.58868 0 5.9783 0.418041 5.74906 1.0391L5.20283 2.50825C5.13302 2.69466 4.95094 2.82016 4.75 2.82016H2.66321C1.19434 2.82016 0 3.98846 0 5.42346V13.3967C0 14.8326 1.19434 16 2.66321 16H17.3368C18.8057 16 20 14.8326 20 13.3967V5.42346C20 3.98846 18.8057 2.82016 17.3368 2.82016Z" fill="#757575"/>
</svg>
''';
