import 'package:flutter/material.dart';
import 'package:home_islami/utils/app_colors.dart';
import 'package:home_islami/home/model/sura_model.dart';
import 'package:home_islami/home/tabs/quran/sura_details_screen.dart';
import 'package:home_islami/home/tabs/quran/sura_list_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_text_style.dart';

class QuranTab extends StatefulWidget {

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
void addSuraList(){
  for(int i =0; i<114 ; i++){
    SuraModel.suraLIst.add(SuraModel(
        suraEnglishName: SuraModel.suraEnglishList[i],
        suraArabicName:SuraModel.suraArabicList[i],
        numberOfVerses: SuraModel.numberOfVersesList[i],
        fileName: '${i+1}.txt'));
  }
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
    loadLastSura();      //get data in shared prefs
  }

  List<SuraModel> filterList = SuraModel.suraLIst;
  String searchText = '';
  Map<String , String> loadSuraList ={};

/*
suraList => => List => 114
filterList = 114 => result
suraList => 114  => filter => searchText => filterList
 */


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Logo.png'),
        TextField(
          style: TextStyle(color: AppColor.whiteColor),
          cursorColor: AppColor.whiteColor,
          decoration: InputDecoration(
            hintText: 'Sura Name',
            hintStyle: TextStyle(
              color: AppColor.whiteColor
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
                ,borderSide: const BorderSide(
                color: AppColor.primaryDark,
                width: 2
            )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
                  ,borderSide: const BorderSide(
              color: AppColor.primaryDark,
              width: 2
            )
            ),
            prefixIcon: const ImageIcon(AssetImage('assets/images/icon_search.png'),
            color: AppColor.primaryDark,),
          ),
          onChanged: (text) {
           searchText=text;
         filterList= SuraModel.suraLIst.where((suraModel){
           return suraModel.suraArabicName.contains(searchText)||
            suraModel.suraEnglishName.toLowerCase().contains(searchText.toLowerCase());
          }
          ).toList();
         setState(() {

         });
          },

        ),
        const SizedBox(
            height: 10),
      searchText.isNotEmpty?
          SizedBox()
        :
      buildMostRecentlyWidget(),
        const SizedBox(height: 10),
         Text('Sura List',
         style:AppStyles.bold16White),
        const SizedBox(height: 10),
        Expanded(child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) {
            return const Divider(
              color: AppColor.whiteColor,
              thickness: 2,
              indent: 30.5,
              endIndent: 30.5,
            );

          },
            itemBuilder: (context, index) {
             return InkWell(
               onTap: () {
                 ///save last sura
              saveLastSura(suraEnName: filterList[index].suraEnglishName,
                  suraArName: filterList[index].suraArabicName,
                  numOfVerses:filterList[index].numberOfVerses);
               Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
               arguments: filterList[index]);

               },
               child: SuraListWidget(
                   suraModel:filterList[index],
                 index: index,
               ),
             );
            },
        itemCount: filterList.length)
        )
      ],
    ),
    );
  }

  Widget buildMostRecentlyWidget() {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Most Recently',
          style:AppStyles.bold16White),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: AppColor.primaryDark,
              borderRadius: BorderRadius.circular(20)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(loadSuraList['suraEnName'] ?? '',
                  style: AppStyles.bold20Black),
                  Text(loadSuraList['suraArName'] ?? '',
                      style: AppStyles.bold20Black),
                  Text('${loadSuraList['numOfVerses']} Verses'?? '',
                      style: AppStyles.bold14Black),
                ],
              ),
              Image.asset('assets/images/most_recently_image.png'),
            ],
          ),
        ),
      ],
    );
  }

  saveLastSura ({ required String suraEnName , required String suraArName,
  required String numOfVerses})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('suraEnName',suraEnName);
   await prefs.setString('suraArName',suraArName);
   await prefs.setString('numOfVerses',numOfVerses);
   await loadLastSura(); /// reload after pressed
  }
  getlastSura ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    ///store data in map
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numOfVerses = prefs.getString('numOfVerses') ?? '';

    ///map
    return {
      'suraEnName' : suraEnName,
      'suraArName' : suraArName,
      'numOfVerses' : numOfVerses
    };
  }

  loadLastSura ()async{
   loadSuraList = await getlastSura();
   setState(() {

   });
  }
}
