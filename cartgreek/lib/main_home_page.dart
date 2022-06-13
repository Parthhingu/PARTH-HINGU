import 'package:cartgreek/constants/localfiles.dart';
import 'package:cartgreek/constants/text_styles.dart';
import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/model/enum.dart';
import 'package:cartgreek/page/booking/booking_page.dart';
import 'package:cartgreek/page/drawer/drawer_page.dart';
import 'package:cartgreek/page/home_page/home_page.dart';
import 'package:cartgreek/page/pakages/pakages_page.dart';
import 'package:cartgreek/page/profile/profile_page.dart';
import 'package:cartgreek/widgets/y_margin.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  BottomBarType bottomBarType = BottomBarType.home;
  double value = 0;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerPage(
            onTap: () {
              setState(() {
                value = 0;
              });
            },
          ),
          Transform.translate(
            offset: Offset(value == 0 ? 0 : 200, value == 0 ? 0 : 10),
            child: Transform.scale(
              scale: value == 0 ? 1 : 0.9,
              alignment: FractionalOffset.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(value == 1 ? 16.0 : 0.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryTextColor.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    bottomBarType == BottomBarType.home
                        ? HomePage(
                            onTap: () {
                              setState(() {
                                value = 1;
                              });
                            },
                          )
                        : bottomBarType == BottomBarType.packages
                            ? const PakagesPage()
                            : bottomBarType == BottomBarType.bookings
                                ? const BookingPage()
                                : bottomBarType == BottomBarType.profile
                                    ? const ProfilePage()
                                    : const ProfilePage(),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: _getBottomBarUI(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBottomBarUI() {
    Widget getBottomUI(BottomBarType type) {
      return InkWell(
        onTap: () {
          setState(() {
            bottomBarType = type;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              type == BottomBarType.home
                  ? Localfiles.home
                  : type == BottomBarType.packages
                      ? Localfiles.sale
                      : type == BottomBarType.bookings
                          ? Localfiles.clock
                          : type == BottomBarType.profile
                              ? Localfiles.user
                              : Localfiles.home,
              height: 24,
              width: 24,
              color: bottomBarType == type
                  ? AppTheme.primaryColor
                  : AppTheme.secondaryTextColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                type == BottomBarType.home
                    ? 'Home'
                    : type == BottomBarType.packages
                        ? 'Packages'
                        : type == BottomBarType.bookings
                            ? 'Bookings'
                            : type == BottomBarType.profile
                                ? 'Profile'
                                : 'Profile',
                style: TextStyles(context).getDescriptionStyle().copyWith(
                      color: bottomBarType == type
                          ? AppTheme.primaryColor
                          : AppTheme.secondaryTextColor,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bottomBarType == type
                      ? AppTheme.primaryColor
                      : AppTheme.whiteColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(value == 1 ? 16.0 : 0.0),
      ),
      height: 68 + MediaQuery.of(context).padding.bottom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            height: 1,
            color: AppTheme.primaryTextColor.withOpacity(0.2),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8,
                bottom: MediaQuery.of(context).padding.bottom + 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getBottomUI(BottomBarType.home),
                getBottomUI(BottomBarType.packages),
                getBottomUI(BottomBarType.bookings),
                getBottomUI(BottomBarType.profile),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
