import 'dart:ui';

import 'package:colours_app/colours_isle.dart';
import 'package:colours_app/grad_isle.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final fontSize = screenwidth / 9;
    final smallFont = screenwidth / 30;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        //Blurred appbar
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        )),
        backgroundColor: Colors.white.withAlpha(110),
      ),
      drawer: Padding(
        padding: const EdgeInsets.all(16),
        child: Drawer(
            shadowColor: Colors.grey.shade300,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(18, 18))),
            backgroundColor: Colors.grey.shade300,
            elevation: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(18, 18)),
              ),
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: Center(
                      child: Text(
                        "Colours.play",
                        style: TextStyle(
                          fontFamily: 'Product',
                          fontWeight: FontWeight.w500,
                          fontSize: 36,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_outward_rounded,
                        color: Colors.black87),
                    title: const Text("The Gradient Isle",
                        style: TextStyle(
                          fontFamily: 'Product',
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        )),
                    onTap: () {
                      Navigator.pop(context, true);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const GradPage();
                      }));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_outward_rounded,
                        color: Colors.black87),
                    title: const Text("The Colours Isle",
                        style: TextStyle(
                          fontFamily: 'Product',
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        )),
                    onTap: () {
                      Navigator.pop(context, true);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ClrPage();
                      }));
                    },
                  )
                ],
              ),
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Animated neumorphic design
          GestureDetector(
            onTap: () {
              setState(() {
                _isElevated = !_isElevated;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                  boxShadow: _isElevated
                      ? [
                          BoxShadow(
                              offset: const Offset(7, 7),
                              color: Colors.grey.shade500,
                              blurRadius: 15,
                              spreadRadius: 1),
                          const BoxShadow(
                              offset: Offset(-7, -7),
                              color: Colors.white,
                              blurRadius: 15,
                              spreadRadius: 1),
                        ]
                      : null),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Text(
                  "Colours.play",
                  style: TextStyle(
                    fontFamily: 'Product',
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          //First Button
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(6, 6),
                        color: Colors.grey.shade500,
                        blurRadius: 15,
                        spreadRadius: 1),
                    const BoxShadow(
                        offset: Offset(-6, -6),
                        color: Colors.white,
                        blurRadius: 15,
                        spreadRadius: 1),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const GradPage();
                    }));
                  },
                  child: Text(
                    "The Gradient Isle",
                    style: TextStyle(
                      fontFamily: 'Product',
                      fontSize: smallFont,
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //Second Button
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(6, 6),
                        color: Colors.grey.shade500,
                        blurRadius: 15,
                        spreadRadius: 1),
                    const BoxShadow(
                        offset: Offset(-6, -6),
                        color: Colors.white,
                        blurRadius: 15,
                        spreadRadius: 1),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ClrPage();
                    }));
                  },
                  child: Text(
                    "The Colours Isle",
                    style: TextStyle(
                      fontFamily: 'Product',
                      fontSize: smallFont,
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
