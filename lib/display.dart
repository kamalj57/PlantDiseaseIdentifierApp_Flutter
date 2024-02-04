import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

String _selectedLanguage = "English";

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Analyse"),
          centerTitle: true,
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
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.5,
            decoration: const BoxDecoration(color: Color(0xA07E9451)),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 1020,
                    child: _buildShow(),
                  ),
                  Positioned(
                    bottom: 800,
                    child: _buildPrevent(),
                  ),
                  Positioned(bottom: 470, child: _buildContact())
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildShow() {
    return SizedBox(
      width: 308.11,
      height: 336.50,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 308.11,
              height: 336.50,
              decoration: ShapeDecoration(
                color: Color(0x8794D2B1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            left: 16.16,
            top: 254.67,
            child: Text(
              'Plant Name           Potato Plant',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          const Positioned(
            left: 11.75,
            top: 204.35,
            child: Text(
              'Disease Name       Alternaria solani\n                                   Early blight',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 11.76,
            top: 26.15,
            child: Container(
              width: 280.03,
              height: 156.82,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('images/cottondisease.jpg'),
                  fit: BoxFit.contain,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
          Positioned(
            left: 16.16,
            top: 281.99,
            child: SizedBox(
              width: 267.49,
              child: Text(
                'Caused By           Soil-borne fungal\n                                 pathogen                   ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrevent() {
    return Container(
      width: 306.75,
      height: 194.65,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 306.75,
              height: 194.65,
              decoration: ShapeDecoration(
                color: Color(0xFF79A17C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 22.38,
            top: 59.59,
            child: Text(
              'Early blight can be minimized by \nmaintaining optimum growing \nconditions, including proper \nfertilization, irrigation, and \nmanagement of other pests.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 20.38,
            top: 23.27,
            child: Text(
              'Prevention Methods',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContact() {
    return Container(
      width: 306.75,
      height: 305.85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 306.75,
              height: 305.85,
              decoration: ShapeDecoration(
                color: Color(0xFF79A17C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
          Positioned(
            left: 20.38,
            top: 13.87,
            child: Text(
              'Ask Experts',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 16.95,
            top: 43.49,
            child: Container(
              width: 273.44,
              height: 95.05,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 273.44,
                      height: 100,
                      decoration: ShapeDecoration(
                        color: Color(0xF4EEF4F1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 11.11,
                    top: 11.66,
                    child: Text(
                      'Thiru M.NAGUL\nDesignation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 180,
                    top: 45,
                    child: Container(
                      width: 87,
                      height: 35,
                      child: Positioned(
                        left: 0,
                        top: 0,
                        child: ElevatedButton(
                          onPressed: () async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: "8946055211",
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("Cannot launch Url");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xF475CE9F), // Background color
                            onPrimary: Colors.black, // Text color
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone, // Phone icon
                                size: 20,
                              ),
                              SizedBox(
                                  width:
                                      8), // Add spacing between the icon and text
                              Text('Call'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16.95,
            top: 151.43,
            child: Container(
              width: 273.44,
              height: 95.05,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 273.44,
                      height: 130,
                      decoration: ShapeDecoration(
                        color: Color(0xF4EEF4F1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 11.11,
                    top: 11.66,
                    child: Text(
                      'Thiru KAMALESH J\n Designation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 180,
                    top: 45,
                    child: Container(
                      width: 87,
                      height: 35,
                      child: Positioned(
                        left: 0,
                        top: 0,
                        child: ElevatedButton(
                          onPressed: () async {
                            final Uri url = Uri(
                              scheme: 'tel',
                              path: "9080710235",
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              print("Cannot launch Url");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xF475CE9F),
                            onPrimary: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text('Call'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
