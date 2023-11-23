import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calpride/fragments/LSBookingFragment.dart';
import 'package:calpride/fragments/LSHomeFragment.dart';
import 'package:calpride/fragments/LSNearByFragment.dart';
import 'package:calpride/fragments/LSOfferFragment.dart';
import 'package:calpride/fragments/LSProfileFragment.dart';
import 'package:calpride/utils/LSColors.dart';
import 'package:calpride/utils/LSImages.dart';
import 'package:nb_utils/nb_utils.dart';

class LSOnBoardingScreen extends StatefulWidget {
  static String tag = '/LSOnBoardingScreen';

  @override
  LSOnBoardingScreenState createState() => LSOnBoardingScreenState();
}

class LSOnBoardingScreenState extends State<LSOnBoardingScreen> {
  int selectedIndex = 0;

  List<Widget> viewContainer = [];

  LSHomeFragment homeFragment = LSHomeFragment();
  // LSOfferFragment offerFragment = LSOfferFragment();
  // LSNearByFragment nearByFragment = LSNearByFragment();
  LSBookingFragment bookingFragment = LSBookingFragment();
  LSProfileFragment profileFragment = LSProfileFragment();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    viewContainer = [
      homeFragment,
      // offerFragment,
      // nearByFragment,
      bookingFragment,
      profileFragment,
    ];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: viewContainer[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: context.scaffoldBackgroundColor,
                offset: Offset.fromDirection(3, 1),
                spreadRadius: 1,
                blurRadius: 5),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSHome,
                  fit: BoxFit.fitHeight,
                  color: lightGrey,
                  height: 24,
                  width: 24),
              activeIcon: SvgPicture.asset(LSHome,
                  color: LSColorPrimary, height: 24, width: 24),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset(LSChat,
            //       fit: BoxFit.fitHeight,
            //       color: lightGrey,
            //       height: 24,
            //       width: 24),
            //   activeIcon: SvgPicture.asset(LSChat,
            //       color: LSColorPrimary, height: 24, width: 24),
            //   label: 'Chat',
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSBasket,
                  fit: BoxFit.fitHeight,
                  color: lightGrey,
                  height: 24,
                  width: 24),
              activeIcon: SvgPicture.asset(LSBasket,
                  color: LSColorPrimary, height: 24, width: 24),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSUser,
                  fit: BoxFit.fitHeight,
                  color: lightGrey,
                  height: 24,
                  width: 24),
              activeIcon: SvgPicture.asset(LSUser,
                  color: LSColorPrimary, height: 24, width: 24),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme: IconThemeData(color: lightGrey, size: 24),
          selectedIconTheme: IconThemeData(color: LSColorPrimary, size: 24),
          selectedLabelStyle: TextStyle(color: LSColorPrimary),
          // onTap: (int index) {
          //   setState(() {
          //     selectedIndex = index;
          //   });
          // },
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
