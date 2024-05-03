import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_to_do_list/const/colors.dart';
import 'package:flutter_to_do_list/screen/add_note_screen.dart';
import 'package:flutter_to_do_list/widgets/stream_note.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      appBar: AppBar(
        backgroundColor: custom_green,
        title: Text(
          'ToDo List',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
            ));
          },
          backgroundColor: custom_green,
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  // onChanged: (value) {
                  // },
                ),
              ),
              Stream_note(false),
              Text(
                'Completed Tasks:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Stream_note(true),
            ],
          ),
        ),
      ),
    );
  }
}
