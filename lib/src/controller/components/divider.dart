import 'package:flutter/cupertino.dart';

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    return Container(
      height: height*002,
      
    );
  }
}
