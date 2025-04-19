// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const IncomeAppBar({super.key, this.addBalanceButton, this.height});

  final Widget? addBalanceButton;
  final double? height;

  @override
  State<IncomeAppBar> createState() => _IncomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 200);
}

class _IncomeAppBarState extends State<IncomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/purple_stars.png',
            fit: BoxFit.fill,
            colorBlendMode: BlendMode.srcATop,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              AppBar(
                title: Text(
                  'Morning, Oussama',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.31,
                    letterSpacing: -0.45,
                  ),
                ),
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withAlpha(33),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/bell.svg',
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'assets/images/avatar.svg',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
