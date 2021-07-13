import 'dart:ui';

import 'package:flutter/material.dart';

class DetailStories extends StatelessWidget {
  const DetailStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/imageStories.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Color(0xFF8C8C8C).withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Do You Want To Live A Happy Life? Smile.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sometimes there’s no reason to smile, but I’ll smile anyway because of life. Yes, I’m one of those people who always smiles.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFEBEAEA),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
