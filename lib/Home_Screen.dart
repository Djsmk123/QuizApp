import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync:this, duration: Duration(milliseconds: 450));
  }
  Future<void> _handleOnPressed() async {
    setState(()  {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
    await Future.delayed(Duration(milliseconds: 500));
    Get.toNamed('/QuizScreen');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
         automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF12283C),
        centerTitle: true,
        title: Text("Quiz App",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 10 ,
          fontStyle: FontStyle.normal,
          fontSize: 25.sp,
        ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.sp,),
          Container(
              alignment: Alignment.center,
              height: 50.h,
              child:Image.asset("images/quiz.png")
          ),
          SizedBox(height: 20.sp,),
      IconButton(
        iconSize:40.sp,
        splashColor: Colors.indigoAccent,
        icon: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        color: Color(0XFF12283C),
        progress: _animationController,
      ),
      onPressed: () => _handleOnPressed(),
    ),
          SizedBox(height: 10.sp,),
          Text("Start",style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
              letterSpacing: 5
          ),),

        ],
      ),
    );
  }
}
