import 'package:flutter/material.dart';
import 'package:hayaa_main/core/Utils/app_colors.dart';
import 'package:hayaa_main/core/Utils/app_images.dart';
import 'package:hayaa_main/features/agencies/models/host_model.dart';
import 'package:hayaa_main/features/agencies/widgets/hostes_list_Iitem.dart';

class AgencyAgentViewBody extends StatefulWidget {
  const AgencyAgentViewBody({
    super.key,
  });

  @override
  State<AgencyAgentViewBody> createState() => _AgencyAgentViewBodyState();
}

class _AgencyAgentViewBodyState extends State<AgencyAgentViewBody> {
  List<HostModel> hosts = [
    HostModel(
        hostId: "090932092", hostImage: AppImages.UserImage, hostName: "Momen"),
    HostModel(
        hostId: "090932sd92",
        hostImage: AppImages.UserImage,
        hostName: "Momen"),
    HostModel(
        hostId: "0909xc092", hostImage: AppImages.UserImage, hostName: "Momen"),
    HostModel(
        hostId: "090ad2092", hostImage: AppImages.UserImage, hostName: "Momen"),
    HostModel(
        hostId: "090932092", hostImage: AppImages.UserImage, hostName: "Momen"),
    HostModel(
        hostId: "090dsd32092",
        hostImage: AppImages.UserImage,
        hostName: "Momen"),
    HostModel(
        hostId: "090sad32092",
        hostImage: AppImages.UserImage,
        hostName: "Momen"),
    HostModel(
        hostId: "090sad32092",
        hostImage: AppImages.UserImage,
        hostName: "Momen"),
    HostModel(
        hostId: "090sad32092",
        hostImage: AppImages.UserImage,
        hostName: "Momen"),
  ];
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Welcome Agent",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: screenWidth * 0.3,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Setting",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.3,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Joining Requests",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.3,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add Hosts",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "The Agency's Total Monthly Income",
            style: TextStyle(fontSize: screenWidth * 0.05),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.7,
            decoration: const BoxDecoration(
              color: AppColors.app3MainColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(children: [
              SizedBox(
                width: screenWidth * 0.3,
                child: const Image(
                  image: AssetImage(AppImages.daimond),
                ),
              ),
              Text(
                "9999",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: screenWidth * 0.07),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Download Monthly Report ",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: hosts.length,
                  itemBuilder: (context, index) {
                    return HostsListItem(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        hostModel: hosts[index]);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
