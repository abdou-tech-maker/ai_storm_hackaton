// ignore_for_file: file_names

import 'package:ai_storm_hackaton/constantes/constantes.dart';
import 'package:ai_storm_hackaton/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = PersistentTabController(initialIndex: 1);

    // context
    //     .read<ActionCubit>()
    //     .login("patrickloops808@gmail.com", "Patrickloops808@");
  }

  List<PersistentTabConfig> _navBarsItems() => [
        PersistentTabConfig(
          screen: const SizedBox(),
          item: ItemConfig(
            inactiveBackgroundColor: greyTxt,
            inactiveForegroundColor: greyTxt,
            activeForegroundColor: mainColor,
            activeColorSecondary: mainColor,
            inactiveIcon: SvgPicture.asset(
              "assets/images/home.svg",
              colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
            title: "Home",
            textStyle: GoogleFonts.poppins(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 0.7),
            icon: SvgPicture.asset(
              "assets/images/home.svg",
              colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const Home(),
          item: ItemConfig(
            inactiveBackgroundColor: greyTxt,
            inactiveForegroundColor: greyTxt,
            activeForegroundColor: mainColor,
            activeColorSecondary: mainColor,
            inactiveIcon: SvgPicture.asset(
              "assets/images/home.svg",
              colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
            title: "Home",
            textStyle: GoogleFonts.poppins(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 0.7),
            icon: SvgPicture.asset(
              "assets/images/home.svg",
              colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const Home(),
          item: ItemConfig(
            inactiveBackgroundColor: greyTxt,
            inactiveForegroundColor: greyTxt,
            activeForegroundColor: mainColor,
            activeColorSecondary: mainColor,
            title: "Home",
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const Home(),
          item: ItemConfig(
            inactiveBackgroundColor: greyTxt,
            inactiveForegroundColor: greyTxt,
            activeForegroundColor: mainColor,
            activeColorSecondary: mainColor,
            inactiveIcon: SvgPicture.asset(
              "assets/images/home.svg",
              colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
            title: "Home",
            textStyle: GoogleFonts.poppins(
              color: mainColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            icon: SvgPicture.asset(
              "assets/images/products.svg",
              colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const SizedBox(),
          item: ItemConfig(
            inactiveBackgroundColor: greyTxt,
            inactiveForegroundColor: greyTxt,
            activeForegroundColor: mainColor,
            activeColorSecondary: mainColor,
            inactiveIcon: SvgPicture.asset(
              "assets/images/dashboard.svg",
              colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
            title: "Home",
            textStyle: GoogleFonts.poppins(
              color: mainColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            icon: SvgPicture.asset(
              "assets/images/dashboard.svg",
              colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
              height: 20,
              width: 20,
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarOverlap: const NavBarOverlap.none(),
      tabs: _navBarsItems(),
      navBarHeight: 50,
      controller: tabController,
      popAllScreensOnTapAnyTabs: false,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.once,
      backgroundColor: Colors.white,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: NavBarConfig(
          navBarHeight: 55,
          selectedIndex: tabController.index,
          items: [
            ItemConfig(
              inactiveBackgroundColor: greyTxt,
              inactiveForegroundColor: greyTxt,
              activeForegroundColor: mainColor,
              activeColorSecondary: mainColor,
              inactiveIcon: SvgPicture.asset(
                "assets/images/home.svg",
                colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
                height: 22,
                width: 22,
              ),
              title: "Home",
              textStyle: GoogleFonts.poppins(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              icon: SvgPicture.asset(
                "assets/images/home.svg",
                colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
                height: 22,
                width: 22,
              ),
            ),
            ItemConfig(
              inactiveBackgroundColor: greyTxt,
              inactiveForegroundColor: greyTxt,
              activeForegroundColor: mainColor,
              activeColorSecondary: mainColor,
              title: "Order",
              inactiveIcon: SvgPicture.asset(
                "assets/images/order.svg",
                colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
                height: 22,
                width: 22,
              ),
              textStyle: GoogleFonts.poppins(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              icon: SvgPicture.asset(
                "assets/images/order.svg",
                colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
                height: 22,
                width: 22,
              ),
            ),
            ItemConfig(
              inactiveBackgroundColor: greyTxt,
              inactiveForegroundColor: greyTxt,
              activeForegroundColor: ayorColor,
              activeColorSecondary: ayorColor,
              icon: Container(
                width: 78,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.50, 0.00),
                    end: Alignment(0.50, 1.00),
                    colors: [
                      Color(0xFF5323AC),
                      Color(0xFF7440C8),
                      Color(0xFFC799F9)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: SizedBox(
                        width: 53.20,
                        height: 73,
                        child: Image.asset(
                          "assets/images/agent.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              iconSize: 32,
            ),
            ItemConfig(
              inactiveBackgroundColor: greyTxt,
              inactiveForegroundColor: greyTxt,
              activeForegroundColor: mainColor,
              activeColorSecondary: mainColor,
              title: "Store",
              iconSize: 32,
              textStyle: GoogleFonts.poppins(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              icon: SvgPicture.asset(
                "assets/images/store.svg",
                colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
                height: 22,
                width: 22,
              ),
              inactiveIcon: SvgPicture.asset(
                "assets/images/store.svg",
                colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
                height: 22,
                width: 22,
              ),
            ),
            ItemConfig(
              iconSize: 32,
              activeForegroundColor: mainColor,
              activeColorSecondary: mainColor,
              inactiveBackgroundColor: greyTxt,
              inactiveForegroundColor: greyTxt,
              title: "Listing",
              textStyle: GoogleFonts.poppins(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              inactiveIcon: SvgPicture.asset(
                "assets/images/listing.svg",
                colorFilter: const ColorFilter.mode(greyTxt, BlendMode.srcIn),
                height: 25,
                width: 25,
              ),
              icon: SvgPicture.asset(
                "assets/images/listing.svg",
                colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
                height: 25,
                width: 25,
              ),
            ),
          ],
          onItemSelected: (value) {
            tabController.jumpToTab(value);
          },
        ),
        navBarDecoration: const NavBarDecoration(
          padding: EdgeInsets.only(bottom: 3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
        ),
      ),
    );
  }
}
