import 'dart:convert';

import 'package:civid_tracker/models/countries_list_model.dart';
import 'package:civid_tracker/screens/CountriesRecords.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {

  List<CountryListModel> countryList = [] ;
  
  Future<CountryListModel> getCountryList ()async{

    var response =await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries')) ;
    var data = json.decode(response.body);
    print(data);
    if(response.statusCode ==200){
      setState(() {
        for(Map i in data){
          countryList.add(CountryListModel.fromJson(i));
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryList () ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: countryList.length,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>CountiresRecords(
                        name:countryList[index].country.toString() ,
                      )));
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image(
                              height: 40,
                              width: 40,
                              image: NetworkImage(countryList[index].countryInfo.flag.toString()),
                            ),
                            SizedBox(width: 15,),
                            Text(countryList[index].country.toString() ,),
                          ],
                        ),

                        Divider()
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
