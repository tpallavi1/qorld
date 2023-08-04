import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';

  void setUpWorldTime() async {
    WorldTime inst =
        WorldTime(location: 'Newyork', flag: 'flag', url: 'America/New_York');
    await inst.getTime();
    print(inst.time);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': inst.location,
      'time': inst.time,
      'flag': inst.flag,
      'isDayTime': inst.isDayTime
    });

    setState(() {
      time = inst.time;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
    print("i am init ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
