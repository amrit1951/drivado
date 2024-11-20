import 'package:drivado/utils/colors.dart';
import 'package:drivado/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget userCard(
    {required double screenWidth,
    required String userName,
    required VoidCallback userTap}) {
  return InkWell(
    onTap: userTap,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.user,
                color: primaryColor,
                size: 20,
              ),
              space(width: 15),
              Text(
                userName,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                )),
              )
            ],
          ),
        ),
        Divider(
          color: lightGray,
          thickness: 0.8,
        )
      ],
    ),
  );
}
