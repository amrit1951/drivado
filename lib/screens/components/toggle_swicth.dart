import 'package:drivado/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final ValueChanged<bool> onToggleChanged;

  const CustomToggleButton({required this.onToggleChanged});

  @override
  // ignore: library_private_types_in_public_api
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isUsersSelected = true; // Initial state for the toggle.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration:
          BoxDecoration(color: gray, borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: gray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isUsersSelected = true;
                  });
                  widget.onToggleChanged(isUsersSelected); // Notify the parent.
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isUsersSelected ? white : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Users',
                    style: TextStyle(
                      fontSize: 16,
                      color: isUsersSelected ? primaryColor : Colors.grey,
                      fontWeight:
                          isUsersSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isUsersSelected = false;
                  });
                  widget.onToggleChanged(isUsersSelected); // Notify the parent.
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: isUsersSelected ? Colors.transparent : white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Sub - company',
                    style: TextStyle(
                      fontSize: 16,
                      color: isUsersSelected ? Colors.grey : primaryColor,
                      fontWeight:
                          isUsersSelected ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
