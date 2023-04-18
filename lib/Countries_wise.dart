import 'package:flutter/material.dart';
import 'package:sampleproject/detail.dart';
import 'package:sampleproject/services/state_services.dart';
import 'package:shimmer/shimmer.dart';

class Countries_wise_Cases extends StatefulWidget {
  const Countries_wise_Cases({super.key});

  @override
  State<Countries_wise_Cases> createState() => _Countries_wise_CasesState();
}

class _Countries_wise_CasesState extends State<Countries_wise_Cases> {
  final SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    stateservices Stateservices = stateservices();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(color: Colors.white),
                //keyboardType: TextInputType.text,
                controller: SearchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Search Country',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    //fillColor: Colors.grey.shade200,
                    filled: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter text';
                  }
                  return null;
                },
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: Stateservices.CountriesRecord(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                        ),
                                        title: Container(
                                          height: 10,
                                          width: double.infinity,
                                          color: Colors.white,
                                        ),
                                        subtitle: Container(
                                          height: 10,
                                          width: double.infinity,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey.shade600);
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String Name = snapshot.data![index]['country'];

                              if (SearchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                    Tcases: snapshot
                                                        .data![index]['cases'],
                                                    Tdeath: snapshot
                                                        .data![index]['deaths'],
                                                    Trecover:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                    img: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                  )),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Image.network(
                                          snapshot.data![index]['countryInfo']
                                              ['flag'],
                                          height: 50,
                                          width: 50,
                                        ),
                                        title: Text(
                                          snapshot.data![index]['country'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        subtitle: Text(
                                          snapshot.data![index]['cases']
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              } else if (Name.toLowerCase().contains(
                                  SearchController.text.toLowerCase())) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(
                                                    Tcases: snapshot
                                                        .data![index]['cases'],
                                                    Tdeath: snapshot
                                                        .data![index]['deaths'],
                                                    Trecover:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                    img: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                  )),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Image.network(
                                          snapshot.data![index]['countryInfo']
                                              ['flag'],
                                          height: 50,
                                          width: 50,
                                        ),
                                        title: Text(
                                          snapshot.data![index]['country'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        subtitle: Text(
                                          snapshot.data![index]['cases']
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                Container();
                              }
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
