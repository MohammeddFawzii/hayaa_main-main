import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hayaa_main/features/splash/views/splash_view.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  _SettingViewBody createState() => _SettingViewBody();
}

class _SettingViewBody extends State<SettingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 227, 213, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'الاعدادات',
          style: TextStyle(color: Colors.black),
        ).tr(args: ['الاعدادات']),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const ListTile(
                    title: Text("Account Security"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 12,
                    ),
                    leading: Icon(
                      Icons.privacy_tip,
                      color: Colors.blue,
                    ),
                  ),
                  const ListTile(
                    title: Text("Privacy"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 12,
                    ),
                    leading: Icon(
                      Icons.lock,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  ListTile(
                    title: const Text("تغير اللغة").tr(args: ['تغير اللغة']),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 12,
                    ),
                    leading: const Icon(
                      Icons.language,
                      color: Colors.greenAccent,
                    ),
                    onTap: () {
                      if (context.locale.languageCode == "en") {
                        context.setLocale(const Locale("ar", "DZ"));
                      } else {
                        context.setLocale(const Locale("en", "US"));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              color: Colors.white,
              child: const Column(
                children: [
                  ListTile(
                    title: Text("Help"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 12,
                    ),
                    leading: Icon(
                      Icons.question_mark_sharp,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  ListTile(
                    title: Text("feedback"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 12,
                    ),
                    leading: Icon(
                      Icons.email,
                      color: Colors.lightBlue,
                    ),
                  ),
                  ListTile(
                    title: Text("About"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 12,
                    ),
                    leading: Icon(
                      Icons.tag_faces_sharp,
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: const Text("Logout"),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                  size: 12,
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.signOut();
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, SplashView.id);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
