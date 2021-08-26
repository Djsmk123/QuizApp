import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}
List result=['2','2','2','2'];
int correctCnt=0;
int incorrectCnt=0;
double percent=0;
class _QuizScreenState extends State<QuizScreen> {
  int qIndex=0;
  int selIndex=0;
  Map<String,dynamic> question= {
    "Which of the following is header file for getch() function?": [
      'iostream.h',
      'string.h',
      'stdlib.h',
          'conio.h'
    ],
    " Which of the following is the correct identifier?": [
      "@var_name",
      "VAR_123",
      "varname@",
      "None of the above",
    ],
    " Which of the following features must be supported by any programming language to become a pure object-oriented programming language?": [
      'Encapsulation',
      'Inheritance',
      'Polymorphism',
      'All of the above',
    ],
    "Which of the following is the correct syntax to read the single character to console in the C++ language?": [
      'Read ch()',
      'Getline vh()',
      'get(ch)',
      'Scanf(ch)',
    ]
  };
  List<String> answer=["conio.h","VAR_123","All of the above","get(ch)"];
  bool isClicked=false;
  bool isCorrect=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF12283C),
        onPressed: isClicked?(){
          if(qIndex==3)
            {
              percent=(correctCnt)/(correctCnt+incorrectCnt);
              Get.toNamed('/ResultScreen');
            }
      else
        {
          setState(() {
            qIndex++;
            isClicked=false;
            isCorrect=false;
          });
        }
        }:(){},
        child: Icon(Icons.navigate_next,size: 30,color: Colors.white,),
      ),
      appBar: AppBar(
        elevation:0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF12283C),
        centerTitle: true,
        title: Text("Questions",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 10 ,
          fontStyle: FontStyle.normal,
          fontSize: 25.sp,
        ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
              Text(question.keys.elementAt(qIndex),overflow:TextOverflow.fade,style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                letterSpacing: 0.6,
                color: Colors.black
              ),
              ),
              Container(
                height: 85.sp,
                child: ListView.builder(
                  itemCount: question.length,
                itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: OutlinedButton(
                      onPressed: isClicked?(){}:() {
                        setState(() {
                          isClicked=true;
                          selIndex=index;
                          result.removeAt(qIndex);
                        });
                        if(question[question.keys.elementAt(qIndex)][index]==answer[qIndex]) {
                          setState(() {
                            isCorrect = true;
                            correctCnt++;
                            result.insert(qIndex, '1');
                            print(result.toString());
                          });
                        }
                       else
                         {
                           setState(() {
                             result.insert(qIndex, '0');
                             incorrectCnt++;
                           });
                         }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(isClicked?(question[question.keys.elementAt(qIndex)][index]==answer[qIndex]?Colors.green:(selIndex==index?Colors.red:Colors.transparent)):Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),)),
                      ),
                      child: Text(question[question.keys.elementAt(qIndex)][index], style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          letterSpacing: 5),),
                    ),
                 );
                },
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 20,
                 alignment: Alignment.center,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                        itemCount: question.length,
                   itemBuilder: (BuildContext context, int index) {
                        return Container(
                        width: 20.w,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:result[index]=='1'?Colors.green:(result[index]=='0'?Colors.red:Colors.grey.shade500),
                          ),
                        );
                     },
                 ),
               ),
             )
              ]
            ),
          ),
        ],
      ),
    );
  }
}
