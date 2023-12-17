import 'package:flutter/material.dart';
import 'package:hayaa_main/core/Utils/app_colors.dart';
import 'package:hayaa_main/core/Utils/app_images.dart';
import 'package:hayaa_main/features/home/widgets/gradient_rounded_container.dart';
import 'package:hayaa_main/features/splash/widgets/gradient_container.dart';

class AgencyHostViewBody extends StatelessWidget {
  const AgencyHostViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            const Text("Hayaa", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                "System Messages",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.04,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Agency Owner",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.04,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date Of Joining The Agency",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.04,
                      color: Colors.black),
                ),
                Text(
                  "12/12/2022",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GradientRoundedContainer(
                        screenHeight: screenHeight * 0.15,
                        screenWidth: screenWidth * 0.4,
                        colorOne: AppColors.app3MainColor,
                        colorTwo: AppColors.appMainColor),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: const Opacity(
                        opacity: 0.3,
                        child: Image(image: AssetImage(AppImages.goldenDollar)),
                      ),
                    ),
                    Positioned(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.1,
                        child: Column(
                          children: [
                            Text(
                              "Tolal Incom ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.04),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.1),
                            ),
                          ],
                        ))
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GradientRoundedContainer(
                        screenHeight: screenHeight * 0.15,
                        screenWidth: screenWidth * 0.4,
                        colorOne: Colors.purpleAccent,
                        colorTwo: Colors.purple),
                    SizedBox(
                      width: screenWidth * 0.2,
                      child: const Opacity(
                        opacity: 0.3,
                        child:
                            Image(image: AssetImage(AppImages.goldenDiamond)),
                      ),
                    ),
                    Positioned(
                        top: screenHeight * 0.02,
                        left: screenWidth * 0.05,
                        child: Column(
                          children: [
                            Text(
                              "Yellow Diamond \n       Balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.04),
                            ),
                            Text(
                              "100",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.1),
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Evry Day Data",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.04,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Table(
              border: TableBorder.all(width: 0.4),
              // Add borders to the table cells
              children: [
                TableRow(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.08,
                      child: Center(
                          child: Text(
                        "Date",
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      )),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                            child: Text(
                          "Hostess time",
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                            child: Text(
                          "Room owner's time",
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                            child: Text(
                          "Number of radio days",
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                            child: Text(
                          "Number of currencies",
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        )),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.06,
                      child: const Center(child: Text("12/12")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.06,
                      child: const Center(child: Text("12/12")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.06,
                      child: const Center(child: Text("12/12")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.06,
                      child: const Center(child: Text("12/12")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                    const TableCell(
                      child: Center(child: Text("0")),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Withdrawal from the agency")),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
