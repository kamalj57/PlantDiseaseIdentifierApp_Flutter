import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/display.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final myitems = [
    Container(
      child: Card(
        elevation: 50,
        child: Image.asset('images/framer1.png'),
      ),
    ),
    Container(
      child: Card(
        elevation: 50,
        child: Image.asset('images/agri2.jpg'),
      ),
    ),
    Container(
      child: Card(
        elevation: 50,
        child: Image.asset('images/agri3.png'),
      ),
    ),
    Container(
      child: Card(
        elevation: 50,
        child: Image.asset('images/agri4.jpeg'),
      ),
    ),
  ];

  int myCurrentIndex = 0;
  File? _image;
  final ImagePicker picker = ImagePicker();
  Future getImage(bool isCamera) async {
    XFile? image;
    if (isCamera) {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }
    print(image?.path);
    setState(() {
      _image = image != null ? File(image.path) : null;
    });
  }

  String _selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    print(_image);
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        elevation: 30,
        backgroundColor: Colors.grey.shade800,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'English',
                  child: Text('English'),
                ),
                const PopupMenuItem<String>(
                  value: 'Tamil',
                  child: Text('Tamil'),
                ),
                const PopupMenuItem<String>(
                  value: 'Hindi',
                  child: Text('Hindi'),
                ),
                const PopupMenuItem<String>(
                  value: 'Telugu',
                  child: Text('Telugu'),
                ),
              ];
            },
          ),
          IconButton(
            onPressed: () {
              _showPopup(context);
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
              ),
              items: myitems,
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedSmoothIndicator(
              activeIndex: myCurrentIndex,
              count: myitems.length,
              effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 15,
                dotColor: Colors.black,
                activeDotColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sample Image to Analyze",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _image != null
                      ? Image.file(
                          _image!,
                          height: 200,
                          width: 330,
                          fit: BoxFit.cover,
                        )
                      : Container(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_image != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayScreen(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Please select an image first."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text("Analyze"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: (Colors.greenAccent),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Post",
            icon: Icon(Icons.feed),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("+91 9345437715"),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text(
                "About Us",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.info),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Sign out",
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        elevation: 10.0,
        child: Icon(Icons.camera_alt_outlined),
        onPressed: () {
          showImageSourceSelectionSheet(context);
        },
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: [
              Text("Our Services available for"),
              Divider(),
              SizedBox(height: 30),
              Image.asset(
                'images/applehealthy.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 5),
              Text("COTTON"),
              Divider(),
            ],
          ),
        );
      },
    );
  }

  void showImageSourceSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  getImage(true); // Open the camera
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  getImage(false); // Choose from gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
