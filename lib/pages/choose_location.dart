import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Newyork', flag: 'us.png', url: 'America/New_York'),
    WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Europe', flag: 'europe.png', url: 'Europe/Berlin')
  ];

  void updateTime(index) async {
    WorldTime inst = locations[index];
    await inst.getTime();

    Navigator.pop(context, {
      'location': inst.location,
      'time': inst.time,
      'flag': inst.flag,
      'isDayTime': inst.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
                child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('photos/${locations[index].flag}'),
              ),
            )),
          );
        },
      ),
    );
  }
}
