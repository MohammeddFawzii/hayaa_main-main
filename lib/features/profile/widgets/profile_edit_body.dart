import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/Utils/app_images.dart';
import '../../../models/user_model.dart';

class ProfileEditBody extends StatefulWidget {
  const ProfileEditBody({super.key});

  @override
  _ProfileEditBody createState() => _ProfileEditBody();
}

class _ProfileEditBody extends State<ProfileEditBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHight = MediaQuery.of(context).size.height;
    return StreamBuilder<QuerySnapshot>(
      stream: _auth.currentUser!.email == null
          ? _firestore
              .collection('user')
              .where('email', isEqualTo: _auth.currentUser!.phoneNumber)
              .snapshots()
          : _firestore
              .collection('user')
              .where('email', isEqualTo: _auth.currentUser!.email)
              .snapshots(),
      builder: (context, snapshot) {
        UserModel userModel = UserModel(
            "email",
            "name",
            "gende",
            "photo",
            "id",
            "phonenumber",
            "devicetoken",
            "daimond",
            "vip",
            "bio",
            "seen",
            "lang",
            "country",
            "type",
            "birthdate",
            "coin",
            "exp",
            "level");

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
        final masseges = snapshot.data?.docs;
        for (var massege in masseges!.reversed) {
          userModel.bio = massege.get('bio');
          userModel.birthdate = massege.get('birthdate');
          userModel.coin = massege.get('coin');
          userModel.country = massege.get('country');
          userModel.daimond = massege.get('daimond');
          userModel.coin = massege.get('coin');
          userModel.devicetoken = massege.get('devicetoken');
          userModel.email = massege.get('email');
          userModel.exp = massege.get('exp');
          userModel.gender = massege.get('gender');
          userModel.id = massege.get('id');
          userModel.lang = massege.get('lang');
          userModel.level = massege.get('level');
          userModel.name = massege.get('name');
          userModel.phonenumber = massege.get('phonenumber');
          userModel.photo = massege.get('photo');
          userModel.seen = massege.get('seen');
          userModel.type = massege.get('type');
          userModel.vip = massege.get('vip');
          userModel.docID = massege.id;
        }
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        userModel.photo), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  title: Text(
                    userModel.name,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit_calendar))
                  ],
                ),
                backgroundColor: Colors.transparent,
                body: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 220.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  CachedNetworkImageProvider(userModel.photo),
                              radius: 60,
                            ),
                            Text(
                              userModel.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.male,
                                  color: Colors.white,
                                ),
                                Text(
                                  "22",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "ID: ${userModel.id}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text("|",
                                      style: TextStyle(color: Colors.white)),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "مصر",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text("|",
                                      style: TextStyle(color: Colors.white)),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "المشجعون",
                                    style: TextStyle(color: Colors.white),
                                  ).tr(args: ['المشجعون']),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              ListTile(
                                title: const Text("جينس").tr(args: ['جينس']),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 12,
                                    )),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListTile(
                                title: const Text(
                                  "الشارات",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ).tr(args: ['الشارات']),
                                subtitle: const Text("لا توجد اي شارات")
                                    .tr(args: ['لا توجد اي شارات']),
                                trailing: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("رؤية المزيد")
                                        .tr(args: ['رؤية المزيد']),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 12,
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListTile(
                                title: const Text("السيارات")
                                    .tr(args: ['السيارات']),
                                trailing: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("ادارة").tr(args: ['ادارة']),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 12,
                                        )),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add,
                                              size: 12,
                                            )),
                                      ),
                                      const Text(
                                        "يشتري",
                                        style: TextStyle(
                                            color: Colors.greenAccent),
                                      ).tr(args: ['يشتري'])
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  const Text("لا توجد سيارات")
                                      .tr(args: ['لا توجد سيارات'])
                                ],
                              ),
                              const SizedBox(
                                height: 19,
                              ),
                              ListTile(
                                title: const Text("هدية").tr(args: ['هدية']),
                                subtitle:
                                    const Text("لا توجد هدايا متاحة حاليا").tr(
                                        args: ['لا توجد هدايا متاحة حاليا']),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text("معلومة عني")
                                        .tr(args: ['معلومة عني'])
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              ListTile(
                                title: const Text("انقر لاضافة بطاقة")
                                    .tr(args: ['انقر لاضافة بطاقة']),
                                subtitle:
                                    const Text("دع الاخرين يعرفون من تكون").tr(
                                        args: ['دع الاخرين يعرفون من تكون']),
                                leading: const Icon(Icons.info_outline),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 12,
                                    )),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
