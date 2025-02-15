import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/date_time_helper/date_time_helper.dart';
import 'package:tractor/src/dbhelper/dbhelper.dart';
import 'package:tractor/src/model/main_model.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              onTap: (){
                // dbClass.deleteData(data[index].id!);
                // setState(() {
                //   data.removeAt(index);
                // });
              },
              child: Container(
                width: width*1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*.02,vertical: height*.02),
                  child: Column(
                    children: [
                    BoldText(text: 'Customar Detail',fontSize: 18,),
                      SizedBox(height: height*.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText(text: "Date : ",fontSize: 16,),
                        CustomText(text: DateTimeHelper.formatDateTime(data[index].date ?? ""),fontSize: 18,color: Colors.blueAccent,),
                      ],
                    ),
                    SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Customar Name : ",fontSize: 15,),
                      CustomText(text: data[index].customar_name??""),
                    ],),
                      SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Time : ",fontSize: 16,),
                      CustomText(text: data[index].time??""),
                    ],),
                      SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Price : ",fontSize: 16,),
                      CustomText(text: data[index].price??""),
                    ],),
                      SizedBox(height: height*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      BoldText(text: "Total Price : ",fontSize: 16,),
                      CustomText(text: data[index].total_price??""),
                    ],),
                      SizedBox(height: height*.01,),
                      Row(
                        children: [
                          BoldText(text: "Descriptions : ",fontSize: 16,),
                        ],),
                      CustomText(text: data[index].description??""),

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
      ),
    );
  }
}
