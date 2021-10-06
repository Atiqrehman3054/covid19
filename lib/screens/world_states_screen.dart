import 'dart:convert';

import 'package:civid_tracker/components/my_records.dart';
import 'package:civid_tracker/models/worlds_states_model.dart';
import 'package:civid_tracker/screens/coyntry_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class WorldStateScreen extends StatefulWidget {
  @override
  _WorldStateScreenState createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen> {

  Future<WorldRecordsModel> getWolrdsStates() async{
    
    var response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/all')) ;

    var data = json.decode(response.body);
    print(data);
    if(response.statusCode == 200){
      return WorldRecordsModel.fromJson(data);
    }
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Center(child: Text('Salman_Task()',style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Worlds States', style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              StreamBuilder<WorldRecordsModel>(
                  stream: getWolrdsStates().asStream() ,
                  builder: (context , snapshot){
                    
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }else{
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              MyRecrods(title: 'Active cases', value: snapshot.data.active.toString()),
                              MyRecrods(title: 'Today cases', value: snapshot.data.todayCases.toString()),
                              MyRecrods(title: 'Deaths cases', value: snapshot.data.deaths.toString()),
                              MyRecrods(title: 'Recovered cases', value: snapshot.data.recovered.toString()),
                              MyRecrods(title: 'Active cases', value: snapshot.data.active.toString()),
                              MyRecrods(title: 'Active cases', value: snapshot.data.active.toString()),
                              MyRecrods(title: 'Active cases', value: snapshot.data.active.toString()),

                            ],
                          ),
                        ),
                      ) ;
                    }
                   
              }),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>CountryListScreen()));
                },
                child: Container(
                  color: Colors.green,
                  height: 45,
                  child: Center(child:
                  Text('Country Tracker'),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
