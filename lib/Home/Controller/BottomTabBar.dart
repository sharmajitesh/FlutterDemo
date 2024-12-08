import 'package:HT_ONE/Home/Screen/SectionParentScreen.dart';
import 'package:HT_ONE/Home/Screen/PremiumScreen.dart';

import 'package:flutter/material.dart';
import 'package:HT_ONE/Home/Controller/HomeScreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Model/AppConfigResponse.dart';
import '../Screen/BaseScreen.dart';
import '../Screen/SectionItemScreen.dart';
import '../Screen/WebViewScreen.dart';
import '../Widget/CustomAppBar.dart';
import '../provider/AppConfigProvider.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}
class _BottomTabBarState extends State<BottomTabBar> {

  int selectedTabIndex = 0;

  /* static List<Widget> tabs = <Widget>[
    Center(child: SectionParentScreen()),
    Center(child: PremiumScreen()),
    Center(child: Text('Shopping Page', style: TextStyle(fontSize: 24))),
    // Center(child: Text('Messages Page', style: TextStyle(fontSize: 24))),
    // Center(child: Text('Shopping Page', style: TextStyle(fontSize: 24))),
  ];*/

  void _onItemTapped(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
        builder: (context, tabProvider, child) {
          List<BottomNavSection>? bottomNavSections = tabProvider
              .appConfigResponse
              ?.bottomNavSections;


          return Scaffold(
            appBar: CustomAppBar(elevation: 0),
            backgroundColor: Colors.white,
            body: getBottomTabScreen(bottomNavSections![selectedTabIndex], selectedTabIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items:getBottomNavigationBarItems(bottomNavSections, selectedTabIndex),/* <BottomNavigationBarItem>[

               *//* for (var bottomTab in bottomNavSections!)
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: bottomTab.displayName),*//*
                *//* BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.workspace_premium_sharp), label: 'Premium'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping'),
          *//*
              ],*/
              currentIndex: selectedTabIndex,
              selectedItemColor: Color.fromRGBO(0, 177, 205, 100),
              unselectedItemColor:  Color.fromRGBO(68, 93, 120, 100),
              onTap: _onItemTapped,
              elevation: 8.0,
              // backgroundColor: Color.fromRGBO(34, 34, 34, 0.3),
            ),
          );
        }
    );
  }


  SvgPicture iconData(String iconType, bool isSelectedTabIndex) {
    switch (iconType) {
      case 'HOME':
        return SvgPicture.asset(
            isSelectedTabIndex
                ? 'assets/images/ic_active_home.svg' // Active image
                : 'assets/images/ic_home.svg',
            placeholderBuilder: (BuildContext context) =>
                Icon(Icons.home)// Inactive image

        );
      case 'ELECTION':
        return SvgPicture.asset(
            isSelectedTabIndex
                ? 'assets/images/ic_active_election.svg' // Active image
                : 'assets/images/ic_election.svg',
            placeholderBuilder: (BuildContext context) =>
                Icon(Icons.error)

        );
      case 'CRICKET':
        return SvgPicture.asset(
            isSelectedTabIndex
                ? 'assets/images/ic_active_cricket.svg' // Active image
                : 'assets/images/ic_cricket.svg',
            placeholderBuilder: (BuildContext context) =>
                Icon(Icons.sports_cricket)


        );
      case 'PREMIUM':
        return SvgPicture.asset(
            isSelectedTabIndex
                ? 'assets/images/ic_active_premium.svg' // Active image
                : 'assets/images/ic_premium.svg',
            placeholderBuilder: (BuildContext context) =>
                Icon(Icons.workspace_premium)


        );

      case 'HT100':
        return SvgPicture.asset(
            isSelectedTabIndex
                ? 'assets/images/ic_active_ht100.svg' // Active image
                : 'assets/images/ic_ht100.svg',
            placeholderBuilder: (BuildContext context) =>
                Icon(Icons.workspace_premium)


        );
      default:
        return SvgPicture.asset(
            isSelectedTabIndex
                ? 'assets/images/ic_active_generic.svg' // Active image
                : 'assets/images/ic_generic.svg',
            placeholderBuilder: (BuildContext context) =>
                Icon(Icons.error)


        );
    }


  }


  List<BottomNavigationBarItem> getBottomNavigationBarItems(
      List<BottomNavSection>? bottomNavSections, int selectedTabIndex)
  {
    int tabCount = bottomNavSections?.length ?? 0;
    List<BottomNavigationBarItem> bottomNavigationBarItems = [];
    for (int index = 0; index < tabCount; index++) {
      BottomNavSection? bottomTab=bottomNavSections?[index];
      if(bottomTab!=null) {
        bottomNavigationBarItems.add(BottomNavigationBarItem(
            icon: iconData(bottomTab.iconType, selectedTabIndex == index),
            label: bottomTab.displayName));
      }
    }
    return bottomNavigationBarItems;
  }

  BaseScreen getBottomTabScreen(BottomNavSection bottomNavSection , int position)
  {
    print("Manoj::bottomNavSection starting:: ${bottomNavSection.displayName}");
    if (bottomNavSection.isPremium == true) {
      print("Manoj::bottomNavSection:: ${bottomNavSection.displayName}");
      return PremiumScreen(bottomNavSection: bottomNavSection, position: position);
    }else if (bottomNavSection.isWebStoriesSection == true) {
      return  WebViewScreen(webUrl: bottomNavSection.feedUrl??"",position: position);
    }
    else if (bottomNavSection.isHomeTab == true) {

      return SectionParentScreen(bottomNavSection:bottomNavSection,position:position,);

    } else if(bottomNavSection.sections!=null && bottomNavSection.sections!.length>0)
    {
      return SectionParentScreen(bottomNavSection:bottomNavSection,position:position,);
    }
    else
    {
      Section section=Section(feedURL: bottomNavSection.feedUrl??"",
          displayName: bottomNavSection.displayName,
          isHome: false,
          isSectionPhotoVideo: false,
          isWebBasedSection: false,
          sectionID: bottomNavSection.id,
          sectionName: bottomNavSection.sectionName,
          sectionUrl: bottomNavSection.sectionUrl,
          template: bottomNavSection.template??"",
      );

      return SectionItemScreen(section: section,position: position);
    }





  }

}



