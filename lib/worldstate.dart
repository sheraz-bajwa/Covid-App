import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sampleproject/roundbutton.dart';
import 'package:sampleproject/Countries_wise.dart';
import 'package:sampleproject/services/model.dart';
import 'package:sampleproject/services/state_services.dart';
import 'package:sampleproject/splashscreen.dart';
import 'package:shimmer/shimmer.dart';

class WorldState extends StatefulWidget {
  const WorldState({super.key});

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    // TODO: implement setState
    _controller.dispose();
  }

  final _colorList = <Color>[
    const Color(0xff4285f4),
    Color.fromARGB(255, 70, 255, 14),
    Color.fromARGB(255, 255, 6, 6),
  ];

  @override
  Widget build(BuildContext context) {
    stateservices Stateservices = stateservices();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
                future: Stateservices.fetchWorldStatesRecords(),
                builder: (context, AsyncSnapshot<Covid> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SpinKitDualRing(
                        color: Colors.amberAccent,
                        size: 50,
                        controller: _controller,
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: PieChart(
                            emptyColor: Colors.white,
                            dataMap: {
                              'Total': double.parse(
                                  snapshot.data!.cases!.toString()),
                              'Recover': double.parse(
                                  snapshot.data!.recovered.toString()),
                              'Death': double.parse(
                                  snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            centerTextStyle: TextStyle(color: Colors.white),
                            animationDuration: Duration(seconds: 10),
                            chartType: ChartType.ring,
                            chartRadius: 200,
                            colorList: _colorList,
                            legendOptions: LegendOptions(
                              legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Column(
                              children: [
                                Reuseable(
                                  title: 'Total',
                                  value: snapshot.data!.cases!.toString(),
                                ),
                                Reuseable(
                                  title: 'Recover',
                                  value: snapshot.data!.recovered.toString(),
                                ),
                                Reuseable(
                                  title: 'Death',
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                Reuseable(
                                  title: 'Active',
                                  value: snapshot.data!.active.toString(),
                                ),
                                Reuseable(
                                  title: 'Critical',
                                  value: snapshot.data!.critical.toString(),
                                ),
                                Reuseable(
                                  title: 'Tests',
                                  value: snapshot.data!.tests.toString(),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Round(
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Countries_wise_Cases()),
                              );
                            },
                            title: 'Track Country',
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}

class Reuseable extends StatelessWidget {
  String title;
  String value;

  Reuseable({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 61, 61, 61),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
