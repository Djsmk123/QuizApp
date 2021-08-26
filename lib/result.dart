import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_task/Quiz.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: Color(0XFF12283C),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Result",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 10 ,
          fontStyle: FontStyle.normal,
          fontSize: 25.sp,
        ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center ,
        children: [
          SizedBox(height: 20,),
          Center(
            child: CircularPercentIndicator(
              radius: 200.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: percent,
              center: new Text(
                  (percent*100).toString()+"%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor:Color(0XFF12283C),
              progressColor: Colors.green,
            ),
          ),
          SizedBox(height: 20,),
          ResultCard(text:"Correct-Answer",result: correctCnt.toString(),clr:Colors.green.shade600,),
          ResultCard(text: "InCorrect-Answer",result: incorrectCnt.toString(),clr: Colors.red.shade600,),
          ResultCard(text: "UnAttempt", result: (4-(incorrectCnt+correctCnt)).toString(),clr: Colors.grey.shade700,),
          SizedBox(height: 40,),
          Container(
            child: Text(correctCnt>3?"Well Done":(correctCnt>=1?"Better Luck Next Time":"Try Hard Next Time"),
            style:TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color:Color(0XFF12283C),
              letterSpacing: 2
            ),
            ),
          ),
          SizedBox(height: 20,),
          OutlinedButton(
            onPressed:(){
              Get.toNamed("/HomeScreen");
              result.clear();
              for(int i=0; i<4; i++)
                result.insert(i, '2');
               correctCnt=0;
               incorrectCnt=0;
               percent=0.0;
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),)),
            ),
            child: Text("Restart",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 15,
                letterSpacing: 5),),
          ),
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  ResultCard({required this.result, required this.text, required this.clr});
  final String text;
  final result;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: TextStyle(
            letterSpacing:5,
            color: Colors.grey.shade600,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          Text(result,style: TextStyle(
            color:clr,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25
          ),)
        ],
      ),
    );
  }
}
