import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reddit_challenge/config/app_theme.dart';
import 'package:reddit_challenge/core/constants.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/drop_down_menu_button.dart';
import 'package:reddit_challenge/features/home/screens/home/presentation/widgets/profile_avatar_widget.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key, this.onBurgerClicked});

  final Function()? onBurgerClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: grayColor, // Choose your border color here
            width: .1, // Choose your border width here
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onBurgerClicked,
                child: SvgPicture.asset(
                  burgerIconSrc,
                  width: 30,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const DropDownMenuButton()
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/search_icon.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(
                width: 15,
              ),
              const ProfileAvatarWidget()
            ],
          ),
        ],
      ),
    );
  }
}
