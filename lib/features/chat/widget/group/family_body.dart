import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../group/view/family_month_view.dart';
import '../../group/view/family_news_view.dart';
import '../../group/view/family_race_view.dart';
import '../../group/view/family_weakly_view.dart';

class FamilyBody extends StatefulWidget {
  const FamilyBody({super.key});

  @override
  _FamilyBody createState() => _FamilyBody();
}

class _FamilyBody extends State<FamilyBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          //height: screenHight * 0.12,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.brown, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        elevation: 0.0,
        title: const Text("العائلة",
                style: TextStyle(
                    fontFamily: "Hayah", fontSize: 20, color: Colors.white))
            .tr(args: ['العائلة']),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.question_mark_sharp, color: Colors.white)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: const Text("جديد",
                      style: TextStyle(
                          fontFamily: "Hayah",
                          fontSize: 20,
                          color: Colors.white))
                  .tr(args: ['جديد']),
            ),
            Tab(
              child: const Text("اسبوعي",
                      style: TextStyle(
                          fontFamily: "Hayah",
                          fontSize: 20,
                          color: Colors.white))
                  .tr(args: ['اسبوعي']),
            ),
            Tab(
              child: const Text("شهري",
                      style: TextStyle(
                          fontFamily: "Hayah",
                          fontSize: 20,
                          color: Colors.white))
                  .tr(args: ['شهري']),
            ),
            Tab(
              child: const Text("مسابقة",
                      style: TextStyle(
                          fontFamily: "Hayah",
                          fontSize: 20,
                          color: Colors.white))
                  .tr(args: ['مسابقة']),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        FamilyNewsView(),
        FamilyWeaklyView(),
        FamilyMonthView(),
        FamilyRaceView(),
      ]),
    );
  }
}
