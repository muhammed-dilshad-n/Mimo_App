import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/settings/settings_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoriesScreen extends HookWidget {
  static const routePath = "/CategoriesScreen";

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTaped = useState(true);

    void onTaped() {
      isTaped.value = !isTaped.value;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(6),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/porfile.png"),
            ),
          ),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 65,
            ),
            Text(
              "Categories",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF373F4A),
                    borderRadius: BorderRadius.circular(8)),
                width: 400,
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundImage:
                          AssetImage("assets/images/profile(2).png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '"The memory is a shield and life helper."',
                          style: TextStyle(
                              fontFamily: "AlexBrush",
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Muhammed Dilshad N",
                          style: TextStyle(
                              color: Color(
                                0xff666A6D,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Card(
                    child: Container(
                      width: 180,
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF373F4A),
                      ),
                      child: Center(
                        child: FloatingActionButton(
                          shape: CircleBorder(),
                          backgroundColor: Colors.white,
                          onPressed: onTaped,
                          child: Icon(
                            Icons.add,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        if (!isTaped.value)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.1, sigmaY: 2.1),
            child: Center(
              child: Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF373F4A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 25, top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title emoji ',
                            hintStyle: TextStyle(
                                fontSize: 25,
                                color:
                                    const Color.fromARGB(250, 118, 124, 131))),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title',
                            hintStyle: TextStyle(
                                fontSize: 25,
                                color:
                                    const Color.fromARGB(250, 118, 124, 131))),
                      ),
                      Text(
                        "0 task",
                        style: TextStyle(
                            fontSize: 25,
                            color: const Color.fromARGB(250, 118, 124, 131)),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              SizedBox(
                                height: 53,
                              ),
                              IconButton(
                                  onPressed: () {
                                    onTaped();
                                  },
                                  icon: Icon(Icons.close_rounded)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
