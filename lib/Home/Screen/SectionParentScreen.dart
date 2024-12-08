

import 'dart:ffi';

import 'package:HT_ONE/Home/Controller/HomeScreen.dart';
import 'package:HT_ONE/Home/Model/AppConfigResponse.dart';
import 'package:HT_ONE/Home/Screen/BaseScreen.dart';
import 'package:HT_ONE/Home/Screen/SectionItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/AppConfigProvider.dart';
import 'WebViewScreen.dart';




class SectionParentScreen extends BaseScreen {
  BottomNavSection bottomNavSection;
  int position;
  SectionParentScreen({Key? key, required this.bottomNavSection, required this.position});
  @override
  _SectionParentState createState() => _SectionParentState();
}

class _SectionParentState extends State<SectionParentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    // Initialize TabController with the length of the tabs
   //final appConfigProvider = Provider.of<AppConfigProvider>(context, listen: false);
    BottomNavSection? bottomNavSection = widget.bottomNavSection;//appConfigProvider.appConfigResponse?.bottomNavSections[0];
    print("Manoj::Premium:initState: ${widget.bottomNavSection.feedUrl}::::${widget.bottomNavSection.displayName}");

    int tabCount=bottomNavSection?.sections?.length??0;
    _tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BottomNavSection? bottomNavSection=widget.bottomNavSection;
    List<Section>? bottomNavSections=bottomNavSection?.sections;
    int tabCount=bottomNavSections?.length??0;
    return /*Consumer<AppConfigProvider>(
      builder: (context, tabProvider, child) {*/

         Scaffold(
             backgroundColor: Colors.white,
          appBar: /*AppBar(
            backgroundColor: Colors.white,

            bottom*/ TabBar(

              isScrollable: true,

              tabAlignment: TabAlignment.start,
              controller: _tabController,
              labelColor: const Color.fromARGB(255, 66, 66, 66), // Color for selected tab
              unselectedLabelColor: const Color.fromARGB(255, 117, 117, 117),/*const Color.fromRGBO(117, 117, 117, 100),*/ // Color for unselected tabs
              indicatorColor: const Color.fromARGB(255,66,66,66),
              labelStyle: const TextStyle(fontSize:  15,
                fontFamily: "Lato",  fontWeight: FontWeight.w900, fontStyle: FontStyle.normal),
              unselectedLabelStyle: const TextStyle(fontSize: 15,
                   fontWeight: FontWeight.w700 ),
              tabs: [
                for (var tab in bottomNavSections!) Tab(child: Text(
                  tab.displayName,
                  textAlign: TextAlign.center
                )),
              ],
            ),
          //),
          body: TabBarView(
            controller: _tabController,

            children: List.generate(tabCount, (index) {
              Section section=bottomNavSections[index];
              print("Manoj::section:: ${section.displayName}");
             return getSectionScreen(section,index);


          }),

        ));
     // },
    //);
  }

  BaseScreen getSectionScreen(Section section, int position)
  {
    if (section.isHome==true) {
      return HomeScreen(section: section,position: position);
    }else if (section.isSectionPhotoVideo==true) {
      return SectionItemScreen(section: section,position: position);
    }else if (section.isWebBasedSection==true) {
      return WebViewScreen(webUrl: section.feedURL??"",position: position);
    }
    else
      {
        return SectionItemScreen(section: section,position: position);
      }



  }



}