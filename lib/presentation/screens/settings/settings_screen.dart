import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routePath = "/SettingsScreen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, size: 35),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Settings",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SizedBox(
                width: 35,
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/porfile.png"),
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selena Gomez",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    " Rabat, England",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, size: 30, color: Colors.white)),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Hii My name is Selena, I'm a community manager from Rabat,England",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications)),
                    Text("Notification"),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                    Text("General"),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.account_circle)),
                    Text("Account"),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                    Text("About"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
