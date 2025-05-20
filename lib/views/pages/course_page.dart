import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app_1/views/pages/activity_class.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late Activity activity;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Future<Activity> getData() async {
    var url = Uri.https('bored-api.appbrewery.com', '/random');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Activity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: const CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return const Text('No data found');
                  } else {
                    final activity = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Activity: ${activity.activity}"),
                        Text("Type: ${activity.type}"),
                        Text("Participants: ${activity.participants}"),
                        Text("Price: ${activity.price}"),
                        Text("Kid Friendly: ${activity.kidFriendly}"),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
