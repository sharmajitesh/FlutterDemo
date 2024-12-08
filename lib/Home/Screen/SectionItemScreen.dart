import 'package:HT_ONE/Home/Controller/CollectionWidget.dart';
import 'package:HT_ONE/Home/Model/SectionResponse.dart';
import 'package:HT_ONE/Home/ViewModel/SectionItemViewModel.dart';
import 'package:HT_ONE/Home/Widget/BigNewsItemWidget.dart';
import 'package:HT_ONE/Home/Widget/SmallNewsItemWidget.dart';
import 'package:flutter/material.dart';

import '../Model/AppConfigResponse.dart';
import 'BaseScreen.dart';




class SectionItemScreen extends BaseScreen {
  Section section;
  int position;
  SectionItemScreen({super.key, required this.section, required this.position});
@override
_SectionItemState createState() => _SectionItemState();
}

class _SectionItemState extends State<SectionItemScreen> {
  late Future<SectionResponse?> _sectionData;

  @override
  void initState() {
    super.initState();
    _sectionData = SectionItemViewModel().getSectionData(widget.section?.feedURL??"");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<SectionResponse?>(
        future: _sectionData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Data Not Found"));
          } else {
            final homeResponse = snapshot.data;
            List<SectionItem>? sectionList = homeResponse?.content.sectionItems;
            print("Manoj to section id:::+${sectionList?.length}::${sectionList?.isNotEmpty}");

            if(sectionList?.isNotEmpty==true)
              {

                return ListView.builder(
                  itemCount: sectionList?.length,
                  itemBuilder: (context, index) {
                    SectionItem? sectionItem = sectionList![index];
                    print("Manoj to section id:::+${sectionItem.itemId}::::${sectionItem.headLine}");
                    if (sectionItem!=null) {
                      if(index==0)
                        {
                         return BigNewsItemWidget(sectionItem: sectionItem, position: index);
                        }else
                          {
                          return  SmallNewsItemWidget(sectionItem: sectionItem, position: index);

                          }


                    } else {
                      return const SizedBox();
                    }
                  },
                );

              }else
                {
                  return const Center(child: Text("Data Not Found"));
                }


          }
        },
      ),
    );
  }

}



