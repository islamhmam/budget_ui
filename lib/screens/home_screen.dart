// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:budget_test/screens/radial_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
List <double> heights=[
  .2,
  .9,
  .5,
  .1,
  .9,
  .5,
  .7
];
List <String> days=[
  'Sa','Su','Mo','Tu','We','Th','Fr',

];
class _HomeScreenState extends State<HomeScreen> {
  @override
  double? screenWidth;
  double? screenHeight;
  Widget build(BuildContext context) {
    screenWidth =MediaQuery.of(context).size.width;
    screenHeight =MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            leading: IconButton(
                onPressed: (){},
                icon: Icon(Icons.settings)),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Budget test'),
            ),
            actions: [
                  IconButton(onPressed:
                      (){},
                      icon: Icon(Icons.add,
                      size: 30,
                        color: Colors.white,
                      ),
                  )
            ],
          ),
          SliverList(

            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if(index==0){
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                            color: Colors.grey,
                            offset:Offset(0,0),
                            blurRadius:3.r,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,

                    ),
                    padding: EdgeInsets.all(10.r),
                    margin: EdgeInsets.all(20.r),
                    child: Column(
                      children: [
                        Text('Days Expenses',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            barBuilder(heights[0],'SA'),
                            barBuilder(heights[1],'Su'),
                            barBuilder(heights[2],'Mo'),
                            barBuilder(heights[3],'Tu'),
                            barBuilder(heights[4],'We'),
                            barBuilder(heights[5],'Th'),
                            barBuilder(heights[6],'Fr'),
                          ],
                        ),
                      ],
                    ),
                  );
                }else{
                  print('2');
                  return herozBarBuilder( heights[index-1],days[index-1]);
                }
              },
              childCount:heights.length+1,
            ),

          ),
        ],
      ),
    );
  }


  barBuilder(double height,String day) =>Column(
    children: [
      Text('\$${height * 100}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15.sp,
        ),
      ),
      SizedBox(height: 2.h,),
      Container(
        width: screenWidth! * .05,
        height: height*100.h,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(7.r),

        ),

      ),
      SizedBox(height: 2.h,),
      Text(day,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15.sp,
        ),),
    ],
  );

  Widget herozBarBuilder( double height ,String day) =>InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>RadialScreen(day, height),
      ));
    },
    child: Container(
      margin: EdgeInsets.only(top: 10.r, left: 20.r,right: 20.r,bottom: 20.r),
      padding: EdgeInsets.all(20.r),
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2,5),
            blurRadius: 5
          ),
        ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(day,
               style: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: 15.sp,
               ),),
             Text('\$${height*100}',
               style: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontSize: 15.sp,
               ),),
           ],
          ),
          SizedBox(height: 10.h,),
          LayoutBuilder(
              builder: (context, constraints) {
                double max=constraints.maxWidth;
                double width=height*max;

                return Stack(
                  children: [
                    Container(
                      height: 18.h,
                      width: max,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 18.h,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                    ),
                  ],
                );
              },
          ),

        ],
      ),
    ),
  );
}
