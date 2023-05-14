import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class ClrPage extends StatefulWidget {
  const ClrPage({super.key});

  @override
  State<ClrPage> createState() => _ClrPageState();
}

class _ClrPageState extends State<ClrPage> {
  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //Blurred appbar
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
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
        title: const Text("The Colours Isle"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Product',
          fontWeight: FontWeight.w500,
          fontSize: 33,
          color: Colors.black87,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            color: _randomColor.randomColor(
              colorBrightness: ColorBrightness.light,
              colorSaturation: ColorSaturation.random,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Navigator.pop(context, "Returned from Colours Isle");

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
