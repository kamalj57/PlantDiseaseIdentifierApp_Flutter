import 'package:flutter/material.dart';
import 'package:login/login.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  String _selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Support Hand'),
            backgroundColor: (Colors.brown[400]),
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
                      value: 'Spanish',
                      child: Text('Spanish'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'French',
                      child: Text('French'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'German',
                      child: Text('German'),
                    ),
                  ];
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/wheatbg1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 280,
                left: (MediaQuery.of(context).size.width - 340) / 2,
                child: Container(
                  height: 280,
                  width: 340,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 134, 84).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: []),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Choose Your Role",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Form(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyApp(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (const Color.fromARGB(
                                      255, 236, 191, 175)),
                                ),
                                child: const Text("Farmer"),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: (const Color.fromARGB(
                                      255, 236, 191, 175)),
                                ),
                                child: const Text("Expertise"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
