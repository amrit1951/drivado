import 'package:drivado/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';

class CompanyCard extends StatefulWidget {
  final VoidCallback onCompanyTap;
  final String companyName;
  const CompanyCard({required this.onCompanyTap, required this.companyName});
  @override
  // ignore: library_private_types_in_public_api
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  bool isExpanded = false; // Controls the collapse/expand state.

  final List<String> userEmails = [
    'abc@drivado.com',
    'jkl@drivado.com',
    'pqr@drivado.com',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onCompanyTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              // padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.apartment, size: 24),
                  space(width: 15),
                  Expanded(
                      child: Text(
                    widget.companyName,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    )),
                  )),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 0.8,
                          color: lightGray,
                        ),
                        space(width: 20),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isExpanded)
            Divider(
              color: lightGray,
              thickness: 0.8,
            ),
          if (isExpanded)
            Container(
              decoration: BoxDecoration(color: lightGray),
              child: Column(
                children: [
                  space(height: 5),
                  emailCard(
                      emailOnTap: () {},
                      icon: Icons.person_add,
                      iconColor: red,
                      email: 'Add user',
                      emailColor: red),
                  ...userEmails.map((email) {
                    return Column(
                      children: [
                        emailCard(
                            emailOnTap: () {},
                            icon: Icons.person_outline,
                            iconColor: Colors.grey,
                            email: email,
                            emailColor: Colors.grey)
                      ],
                    );
                  }),
                  space(height: 5),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget emailCard(
      {required VoidCallback emailOnTap,
      required icon,
      required Color iconColor,
      required String email,
      required Color emailColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        space(),
        InkWell(
          onTap: emailOnTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.88,
            decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
                space(width: 15),
                Text(
                  email,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: emailColor,
                  )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
