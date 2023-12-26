import 'package:flutter/material.dart';
import 'package:chatt/screens/food.dart';
import 'package:chatt/screens/HallServicePage.dart';
import 'package:chatt/screens/guestlist.dart';
import 'package:chatt/screens/flowerbirth.dart';
class birthdayServicePage extends StatefulWidget {
  @override
  _birthdayServicePageState createState() => _birthdayServicePageState();
}
class _birthdayServicePageState extends State<birthdayServicePage> {
 String selectedService = '';

  List<Map<String, dynamic>> serviceOptions = [
    {'text': 'تنسيق الزهور', 'icon': Icons.local_florist},
    {'text': 'قائمة الطعام', 'icon': Icons.fastfood},
    {'text': 'القاعة', 'icon': Icons.location_city},
    {'text': 'قائمة الحضور', 'icon': Icons.person},
    // Add more service options if needed
  ];

  void navigateToFoodPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodManagementPage(),
      ),
    );
  }

  void navigateToFlowerPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlowerColorPage3(),
      ),
    );
  }

  void navigateToHallPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HallServicePage(),
      ),
    );
  }

  void navigateToGuestPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GuestListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5BA581),
        title: Text(' أعياد الميلاد '),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.green],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: serviceOptions.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedService = item['text'];
                    });
                    if (item['text'] == 'تنسيق الزهور') {
                      navigateToFlowerPage();
                    } else if (item['text'] == 'قائمة الطعام') {
                      navigateToFoodPage();
                    } else if (item['text'] == 'القاعة') {
                      navigateToHallPage();
                    } else if (item['text'] == 'قائمة الحضور') {
                      navigateToGuestPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the content
                    children: [
                      Icon(
                        item['icon'],
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        item['text'],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF5BA581),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
