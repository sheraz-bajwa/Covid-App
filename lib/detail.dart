import 'package:flutter/material.dart';
import 'package:sampleproject/worldstate.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    super.key,
    required this.img,
    required this.name,
    required this.Tcases,
    required this.Tdeath,
    required this.Trecover,
    required this.test,
    required this.critical,
    required this.active,
  });
  String img;
  String name;
  int Tcases, Tdeath, Trecover, active, critical, test;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(widget.img),
          ),
          Card(
            child: Column(
              children: [
                Reuseable(
                    title: 'Total Cases', value: widget.Tcases.toString()),
                Reuseable(
                    title: 'Recovered', value: widget.Trecover.toString()),
                Reuseable(title: 'Death', value: widget.Tdeath.toString()),
                Reuseable(title: 'Active', value: widget.active.toString()),
                Reuseable(title: 'Critical', value: widget.critical.toString()),
                Reuseable(title: 'Tests', value: widget.test.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
