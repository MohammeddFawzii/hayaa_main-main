import 'package:flutter/material.dart';

import '../../core/Utils/app_images.dart';

class HeadMoll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 19.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('\$3.99', AppImages.car1, 'Car','20 days', context),
                _buildCard('\$3.99', AppImages.car1, 'Car','20 days', context),
                _buildCard('\$3.99', AppImages.car1, 'Car','20 days', context),
                _buildCard('\$3.99', AppImages.car1, 'Car','20 days', context),
                _buildCard('\$3.99', AppImages.car1, 'Car','20 days', context),
                _buildCard('\$3.99', AppImages.car1, 'Car','20 days', context),
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget _buildCard(String price, String imgPath, String category,String days, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          // Add your onTap logic here
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    days,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Text(
                price,
                style: TextStyle(
                  color: Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              // Add the button and days here
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your red button logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('يشتري'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your white button logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    child: Text('ارسال'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
