import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
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
            customar_name: noteMap['customar_name'],
            time: noteMap['time'],
            price: 'price',
            total_price: noteMap['total_price']);
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
            padding:EdgeInsets.symmetric(vertical: height*.02,horizontal: width*.02),
            child: Container(
              height: height*.3,
              width: width*1,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                CustomText(text: data[index].customar_name??""),
                CustomText(text: data[index].price??""),
                CustomText(text: data[index].total_price??""),
                CustomText(text: data[index].time??""),
              ],),
            ),
          );
        },
      ),
    );
  }
}
