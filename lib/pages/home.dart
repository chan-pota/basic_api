
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/workout.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
      title: Text('Workout'),
        gradient: LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red])
    ),
    
      body: Container(
        decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 233, 146, 246), Color.fromARGB(255, 123, 117, 235)
                    //Color.fromARGB(255, 229, 143, 255),
                    //Color.fromARGB(255, 78, 174, 252)
                  ],
                )),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: FutureBuilder(
            builder: (context, snapshot){
                var data = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return Mybox(data[index]['title'], data[index]['subtitle'], data[index]['url'], data[index]['detail']);
                  },
                  itemCount: data.length,
                );
            },
            future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )
        ),
      ),

    );
  }

  Widget Mybox(String title, String subtitle, String url, String detail){
    return Container(
          //color: Colors.teal[100],
          height: 140,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          decoration: 
            BoxDecoration(
            boxShadow: [BoxShadow(
                color: Color.fromARGB(255, 110, 110, 226),
                offset: Offset(2,2),
                blurRadius: 3.0,
            )],
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                // 0.1,
                // 0.4,
                0.1,
                0.9,
              ],
              colors: [
                // Colors.yellow,
                // Colors.red,
                Color.fromARGB(255, 255, 238, 253),
                Color.fromARGB(255, 57, 110, 255),
               
              ],
            ),
            //color: Colors.teal[100],
            borderRadius: BorderRadius.circular(10),
            image : DecorationImage(
              //colorFilter: ColorFilter.mode(Color.fromARGB(255, 33, 33, 33).withOpacity(0.25), BlendMode.darken),
              image: NetworkImage(url),
              fit: BoxFit.cover,
              opacity: 0.1,
            ),
            
            ),
            
      
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // แนวตั้ง
          crossAxisAlignment: CrossAxisAlignment.start, // แนวนอน
          children: [
          Text(title, 
                style: TextStyle(color : Color.fromARGB(255, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.bold,
                   shadows: [Shadow( color: Color.fromARGB(255, 13, 13, 13), offset: Offset(2, 2), blurRadius: 2)]
                  )
                ),
          SizedBox(height: 10),
          Text(subtitle,
                style: TextStyle(color : Color.fromARGB(255, 255, 255, 255))
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 134, 60, 212)),
            onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Workout(detail: detail)));
              }, child: Text("Read more", style: TextStyle(color: Color.fromARGB(255, 253, 242, 255))))
          
          ],)
    );
  }



}