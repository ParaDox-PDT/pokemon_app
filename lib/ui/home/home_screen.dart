import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_defualt_project/data/models/valorant_model/valorant_model.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';
import 'package:flutter_defualt_project/data/network/api_repository.dart';
import 'package:flutter_defualt_project/ui/home/widgets/row_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<ValorantModel>>(
        future: apiRepository.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Container(
                    height: 50.h,
                    child: Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...List.generate(
                              10, (index) => ListViewItems(text: "$index"))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7, crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.black,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(int.parse(snapshot.data![index].colors[0],radix: 16)),
                            Color(int.parse(snapshot.data![index].colors[1],radix: 16)),
                            Color(int.parse(snapshot.data![index].colors[2],radix: 16)),
                            Color(int.parse(snapshot.data![index].colors[3],radix: 16)),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(imageUrl: snapshot.data![index].img),
                          SizedBox(height: 6.h,),
                          RichText(text: TextSpan(text: "Name: ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: Colors.black),children: [TextSpan(text: snapshot.data![index].name,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.black))])),
                          RichText(text: TextSpan(text: "Developer Name: ",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: Colors.black),children: [TextSpan(text: snapshot.data![index].developerName,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.black))])),

                        ],
                      ),
                    );
                      },
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("ERROR"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
