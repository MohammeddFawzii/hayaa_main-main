import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hayaa_main/features/setting/views/setting_view.dart';
import '../../../core/Utils/app_colors.dart';
import '../../../models/user_model.dart';
import '../../Badges/Badgespage.dart';
import '../../VIP/view/vip_view.dart';
import '../../chat/group/view/family_view.dart';
import '../../friend_list/view/visitor_view.dart';
import '../../friend_list/widget/friend_list_body.dart';
import '../../recharge_coins/views/recharge_view.dart';
import '../../salery/view/salery_view.dart';
import '../../store/ListViewStore.dart';
import '../../user_leve/FirstList.dart';
import '../views/profile_edit_view.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({
    super.key,
  });
  @override
  _ProfileViewBody createState() => _ProfileViewBody();
}

class _ProfileViewBody extends State<ProfileViewBody> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          return StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('user')
                .doc(userModel.docID)
                .collection('friends')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                );
              }
              final masseges = snapshot.data?.docs;
              userModel.sizeFirends = masseges!.length.toInt();
              return StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('user')
                    .doc(userModel.docID)
                    .collection('following')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    );
                  }
                  final masseges = snapshot.data?.docs;
                  userModel.sizefollowing = masseges!.length.toInt();
                  return StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('user')
                        .doc(userModel.docID)
                        .collection('fans')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                      final masseges = snapshot.data?.docs;
                      userModel.sizefans = masseges!.length.toInt();
                      return StreamBuilder<QuerySnapshot>(
                        stream: _firestore
                            .collection('user')
                            .doc(userModel.docID)
                            .collection('visitor')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }
                          final masseges = snapshot.data?.docs;
                          for (var massege in masseges!.reversed) {
                            userModel.sizevisitors = masseges.length;
                          }
                          return Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.appInformationColors100,
                                  AppColors.appInformationColors700
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                stops: [0.0, 0.8],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 190.0, bottom: 30),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                userModel.photo),
                                        radius: 50,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            userModel.name,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text("ID: ${userModel.id}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, SettingView.id);
                                              },
                                              icon: const Icon(Icons
                                                  .arrow_forward_ios_rounded))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FriendListBody(
                                                                  userModel)));
                                                },
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      userModel.sizeFirends
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                    const Text("اصدقاء",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                        )).tr(args: ['اصدقاء'])
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FriendListBody(
                                                                  userModel)));
                                                },
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        userModel.sizefollowing
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 22)),
                                                    const Text("تمت المتابعة",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                        )).tr(args: [
                                                      'تمت المتابعة'
                                                    ])
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FriendListBody(
                                                                  userModel)));
                                                },
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        userModel.sizefans
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 22)),
                                                    const Text("المعجبون",
                                                            style: TextStyle(
                                                                fontSize: 22))
                                                        .tr(args: ['المعجبون'])
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, VisitorView.id);
                                                },
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        userModel.sizevisitors
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 22)),
                                                    const Text("عدد الزوار",
                                                            style: TextStyle(
                                                                fontSize: 22))
                                                        .tr(args: [
                                                      'عدد الزوار'
                                                    ])
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0, top: 3.0),
                                          child: ListTile(
                                            title: const Text(
                                              "اعادة الشحن",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['اعادة الشحن']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.wallet,
                                              color: Colors.yellow,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, RechargeView.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: ListTile(
                                            title: const Text(
                                              "ماسات",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['دخل']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.diamond_outlined,
                                              color: Colors.blue,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, SaleryView.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: ListTile(
                                            title: const Text(
                                              "مستوي المستخدم",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['مستوي المستخدم']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.stars_sharp,
                                              color: Colors.purpleAccent,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, FirstList.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: ListTile(
                                            title: const Text(
                                              "الوكالات",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['الوكالات']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.favorite,
                                              color: Colors.greenAccent,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: ListTile(
                                            title: const Text(
                                              "مركز VIP",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['مركز VIP']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.spa_outlined,
                                              color: Colors.brown,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, VipView.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8.0),
                                          child: ListTile(
                                            title: const Text(
                                              "الشارات",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['الشارات']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.badge,
                                              color: Colors.orange,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Badges.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8),
                                          child: ListTile(
                                            title: const Text(
                                              "مركز تجاري",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['مركز تجاري']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.storefront_sharp,
                                              color: Colors.greenAccent,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, ListViewStore.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8),
                                          child: ListTile(
                                            title: const Text(
                                              "مظهري",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['مظهري']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.backpack,
                                              color: Colors.greenAccent,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8),
                                          child: ListTile(
                                            title: const Text(
                                              "العائلة",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['العائلة']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.home_sharp,
                                              color: Colors.purple,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, FamilyView.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8),
                                          child: ListTile(
                                            title: const Text(
                                              "خدمة العملاء",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['خدمة العملاء']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.support_agent,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, left: 8),
                                          child: ListTile(
                                            title: const Text(
                                              "الاعدادات",
                                              style: TextStyle(fontSize: 19),
                                            ).tr(args: ['الاعدادات']),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.grey,
                                              size: 12,
                                            ),
                                            leading: const Icon(
                                              Icons.settings,
                                              color: Colors.grey,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, SettingView.id);
                                            },
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        });
  }
}
