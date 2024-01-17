import 'package:flutter/material.dart';
import 'package:reddit_challenge/config/app_theme.dart';

class DropDownMenuButton extends StatefulWidget {
  const DropDownMenuButton({super.key});

  @override
  State<DropDownMenuButton> createState() => _DropDownMenuButtonState();
}

List<String> list = <String>['Home', 'popular', 'Watch'];

class _DropDownMenuButtonState extends State<DropDownMenuButton>
    with SingleTickerProviderStateMixin {
  String dropdownValue = list.first;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation =
        Tween<double>(begin: 0, end: 0.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: grayColor.withOpacity(.1),
      ),
      child: PopupMenuButton<String>(
        color: Colors.black.withOpacity(.3),
        offset: const Offset(
          0,
          50,
        ), // Adjust the vertical offset to move the menu to the bottom
        constraints: const BoxConstraints(minWidth: double.infinity),
        onSelected: (String value) {
          setState(() {
            dropdownValue = value;
          });
          _toggleMenu();
        },
        onCanceled: () {
          _toggleMenu();
        },
        itemBuilder: (BuildContext context) {
          return list.map((String item) {
            return PopupMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  color: Colors.white, // Set text color
                ),
              ),
            );
          }).toList();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dropdownValue,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              RotationTransition(
                turns: _animation,
                child: const Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
