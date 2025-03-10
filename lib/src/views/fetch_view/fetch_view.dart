import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/controller/components/custom_button.dart';
import 'package:tractor/src/date_time_helper/date_time_helper.dart';
import 'package:tractor/src/dbhelper/dbhelper.dart';
import 'package:tractor/src/model/main_model.dart';
import 'package:tractor/src/views/update_view/update_view.dart';

class FetchView extends StatefulWidget {
  const FetchView({super.key});

  @override
  State<FetchView> createState() => _FetchViewState();
}

class _FetchViewState extends State<FetchView> {
  @override
  DbClass dbClass=DbClass.instance;
  List<MainModel> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData()
  async{
    try
    {
      var fetchDataList = await dbClass.read();
      if(fetchDataList.isEmpty)
        {
          print("No data found in the database.");
        }
      data= fetchDataList.map((noteMap){
        return MainModel(
            id: noteMap['id'],
            customar_name: noteMap['customar_name'],
            time: noteMap['time'],
            price: noteMap['price'].toString(),
            total_price: noteMap['total_price'].toString(),
            date: noteMap['date'],
            description: noteMap['description']
        );
      }).toList();
      setState(() {});
    }
    catch(e) {
      print('error$e');
    }
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xFFEFEFEF),
        centerTitle: true,
        title: BoldText(text: 'Customar Detail'),
      ),
      body: data.isEmpty?Center(child: BoldText(text: "No Data Found"),):
      ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
          return Padding(
            padding:EdgeInsets.symmetric(vertical: height*.02,horizontal: width*.03),
            child: GestureDetector(
             onLongPress: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: BoldText(text: 'Are you sure to want these changes',fontSize: 15,),
                      actions: [
                        Row(children: [
                          Expanded(child: CustomButton(onTap: ()
                          {
                            Navigator.pop(context);
                            dbClass.deleteData(data[index].id!);
                            setState(() {
                              data.removeAt(index);
                              ElegantNotification.error(
                                width: 360,
                                isDismissable: false,
                                animationCurve: Curves.easeOut, // Smooth transition
                                animationDuration: Duration(milliseconds: 500), // Slow animation
                                stackedOptions: StackedOptions(
                                  key: 'top',
                                  type: StackedType.same,
                                  itemOffset: Offset(0, 5), // Smooth offset
                                ),
                                position: Alignment.topCenter,
                                animation: AnimationType.fromTop,
                                title: BoldText(text: 'Deleted',color: Colors.red,fontSize: 16,),
                                description: CustomText(text: 'Data Deleted successfully!'),
                                onDismiss: () {},
                                onNotificationPressed: () {},
                              ).show(Get.overlayContext ?? Get.context!);
                            });
                          },
                            text: 'Delete',
                            color: Colors.red,)),
                          SizedBox(width: width*.05,),
                          Expanded(child: CustomButton(
                              onTap: (){
                                Navigator.pop(context);
                                Navigator.push(context, CupertinoPageRoute(builder: (context)=>UpdateView(
                                  id: data[index].id!,
                                  customar_name: data[index].customar_name ?? "",
                                  time: data[index].time ?? "",
                                  price: data[index].price ?? "",
                                  total_price: data[index].total_price ?? "",
                                  date: data[index].date ?? "",
                                  description: data[index].description ?? "",
                                )
                                )
                                ).then((updated){
                                  if(updated==true){
                                    fetchData();
                                  }
                                });
                              },
                              text: 'Update')),
                        ],)
                      ],
                    );
                  }
              );
             },
              child: Container(
                width: width*1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.shade900,  // Deep Purple
                      Colors.blue.shade700,    // Royal Blue
                      Colors.cyan.shade500,    // Vibrant Cyan
                      Colors.green.shade400,   // Fresh Green
                      Colors.yellow.shade300,  // Warm Yellow
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Customar Detail",
                              textStyle: GoogleFonts.merriweather(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white
                              ),
                             speed:Duration(microseconds: 90000)
                            ),
                          ],
                          totalRepeatCount: 100,
                          pause: const Duration(milliseconds: 1000),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:width*.2),
                        child: Divider(),
                      ),
                      SizedBox(height: height*.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText(text: "Date : ",fontSize: 16,color: Colors.white,),
                        BoldText(text: DateTimeHelper.formatDateTime(data[index].date ?? ""),fontSize: 18,color: Colors.black,),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Customar Name : ",fontSize: 15,color: Colors.white,),
                      CustomText(text: data[index].customar_name??"",color: Colors.white,),
                    ],),
                      Divider(),
                      SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Time : ",fontSize: 15,color: Colors.white),
                      CustomText(text: data[index].time??"",color: Colors.white),
                    ],),
                      Divider(),
                      SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Price : ",fontSize: 15,color: Colors.white),
                      CustomText(text: data[index].price??"",color: Colors.white),
                    ],),
                      Divider(),
                      SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Total Price : ",fontSize: 15,color: Colors.white),
                      CustomText(text: data[index].total_price??"",color: Colors.white),
                    ],),
                      Divider(),
                      SizedBox(height: height*.01,),
                      Row(
                        children: [
                          BoldText(text: "Descriptions : ",fontSize: 15,color: Colors.white),
                        ],),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: data[index].description??"",color: Colors.white),
                        ],
                      ),

                    // CustomText(text: DateTimeHelper.formatDateTime(data[index].date ?? "")),
                    // CustomText(text: data[index].customar_name??""),
                    // CustomText(text: data[index].price??""),
                    // CustomText(text: data[index].total_price??""),
                    // CustomText(text: data[index].time??""),
                  ],),
                ),
              ),
            ),
          );
        },
      ).animate().shimmer(duration: Duration(seconds: 3)),
    );
  }
}
