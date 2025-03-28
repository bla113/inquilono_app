import 'package:codominio_app/components/widgets/circular_progress_get_data.dart';
import 'package:codominio_app/controller/auth/profile_controller.dart';
import 'package:codominio_app/screens/auth/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:codominio_app/controller/auth/login_controller.dart';
import 'package:codominio_app/controller/auth/logout_controller.dart';
import 'package:codominio_app/screens/welcome_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';
  String idUser = '';
  String userAppF = '';
  String emailAppF = '';
  String urlavar = '';

  var isLoading = true;
  getProfile() async {
    var accessToken = await getSharedPreferences();
    var userApp = await getNameUserAut();
    var emailApp = await getNameUserAut();

    var response = await getProfileApp(accessToken);
    if (response != null) {
      setState(() {
        name = response['user']['name'];
        email = response['user']['email'];
        urlavar = response['user']['avatar_url'];
        idUser = response['user']['id'].toString();
        emailAppF = emailApp;
        userAppF = userApp;

        isLoading = false;
      });
    }
  }

  Future getNameUserAut() async {
    final username = FlutterSecureStorage();
    String? userName = await username.read(key: 'username');

    return userName;
  }

  Future getEmailUserAut() async {
    final email = FlutterSecureStorage();
    String? emailApp = await email.read(key: 'username');

    return emailApp;
  }

  @override
  void initState() {
    super.initState();

    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(18, 83, 196, 1),
        foregroundColor: Colors.white,
        title: const Text("Perfil"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      icon: Icon(Icons.logout_outlined),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            var accessToken = await getSharedPreferences();
                            var response = await logout(accessToken);

                            if (response == 200) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => WelcomeScreen(),
                                ),
                              );
                            } else {
                              debugPrint('Logout fil from profile');
                            }
                          },

                          child: Text('Cerrar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                      title: Text('Cerrar sesión'),
                      contentPadding: EdgeInsets.all(20.0),
                      content: Text('Esta apunto de Cerrar Sesión'),
                    ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            isLoading
                ? CircularGetData(seconds: 3)
                : ProfilePic(image: urlavar),
            Text(name, style: Theme.of(context).textTheme.titleLarge),
            const Divider(height: 16.0 * 2),
            Info(infoKey: "Usuario", info: userAppF),
            const Info(infoKey: "Condominio", info: "Por Asignar"),
            const Info(infoKey: "Teléfono", info: "(+506) 8888-0108"),
            Info(infoKey: "Correo", info: emailAppF),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 160,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(18, 83, 196, 1),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                EditProfile(idUser: idUser, name: name),
                      ),
                    );
                  },
                  child: const Text("Editar Perfil"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.image,
    this.isShowPhotoUpload = false,
    this.imageUploadBtnPress,
  });

  final String image;
  final bool isShowPhotoUpload;
  final VoidCallback? imageUploadBtnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).textTheme.bodyLarge!.color!,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "http://10.0.2.2:8000/storage/$image",
            ),
          ),
          InkWell(
            onTap: imageUploadBtnPress,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key, required this.infoKey, required this.info});

  final String infoKey, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            infoKey,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          Text(info),
        ],
      ),
    );
  }
}
