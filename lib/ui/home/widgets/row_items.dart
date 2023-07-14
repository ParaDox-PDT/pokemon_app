import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ListViewItems extends StatefulWidget {
  const ListViewItems({super.key, required this.text});
  final String text;

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  bool isTapped=false;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: (){
        isTapped=!isTapped;
        setState(() {

        });
      },
      child: Container(
        margin: EdgeInsets.all(4),
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: 50.h,
        child: Center(child: Text(widget.text,style: TextStyle(color: Colors.black),)),
        color: isTapped?Colors.blue:Colors.grey,
      ),
    );
  }
}
