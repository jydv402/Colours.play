import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lottie/lottie.dart';

class GradPage extends StatefulWidget {
  const GradPage({super.key});

  @override
  State<GradPage> createState() => _GradPageState();
}

class _GradPageState extends State<GradPage> {
  Random r = Random();

  int clrA = 0xffab68f2;
  int clrB = 0xff90fcda;
  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        title: const Text("The Gradient Isle"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Product',
          fontWeight: FontWeight.w500,
          fontSize: 33,
          color: Colors.black87,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            elevation: 10,
            onPressed: () {
              Navigator.pop(context, "Returned from Gradient Isle");

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.grey.shade400,
                width: MediaQuery.of(context).size.width * 0.6,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(18, 18))),
                content: const Center(
                  child: Text(
                    "Returned to Homepage",
                    style: TextStyle(
                      fontFamily: 'Product',
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                duration: const Duration(milliseconds: 700),
                behavior: SnackBarBehavior.floating,
              ));
            },
            backgroundColor: Colors.deepPurple[500],
            hoverColor: Colors.red,
            child: const Icon(
              Icons.home_filled,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          FloatingActionButton(
            elevation: 10,
            onPressed: () {
              setState(() {
                clrA = r.nextInt(0xffffffff);
                clrB = r.nextInt(0xffffffff);
                //Snackbar
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.grey.shade400,
                  width: MediaQuery.of(context).size.width * 0.6,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(18, 18))),
                  content: const Center(
                    child: Text(
                      "Changed Background Gradient",
                      style: TextStyle(
                        fontFamily: 'Product',
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  duration: const Duration(milliseconds: 400),
                  behavior: SnackBarBehavior.floating,
                ));
              });
            },
            backgroundColor: Colors.deepPurple[500],
            hoverColor: Colors.green[400],
            child: const Icon(
              Icons.restart_alt_sharp,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(clrA), Color(clrB)])),
        child: Stack(children: [
          Center(
            child: Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_96bovdur.json',
              alignment: const Alignment(0, 0),
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 0.65,
            ),
          ),
        ]),
      ),
    );
  }
}
