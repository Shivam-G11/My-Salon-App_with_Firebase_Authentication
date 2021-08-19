// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'SignupPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.teal),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Image.asset("assets/img.png"),
                        ),
                      ),
                      SizedBox(width: 20,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shivam",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white,),),
                          Text("cdcc@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white,),)
                        ],
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 37,top: 15,bottom: 15),
                  child: Text("Menu",style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.home,size: 30,),
                    title: Text("Dashboard",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.money,size: 30,),
                    title: Text("Send Money",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.account_balance_wallet,size: 30,),
                    title: Text("Top up Wallet",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.download_sharp,size: 30,),
                    title: Text("Withdraw",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.payments,size: 30,),
                    title: Text("Bill Payments",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.settings,size: 30,),
                    title: Text("Settings",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 37,top: 15,bottom: 15),
                  child: Text("Other Menu",style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.history,size: 30,),
                    title: Text("History Transaction",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: Icon(Icons.help_center,size: 30,),
                    title: Text("Help",style: TextStyle(fontSize: 20),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Container(
                  height: 100,
                ),


                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Divider(thickness: 1.5),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    leading: Icon(Icons.logout,size: 30,),
                    title: Text("Logout",style: TextStyle(fontSize: 20),),
                  ),
                ),



              ],
            ),
          ),

        ),
        appBar: AppBar(
          elevation: 0,
          title: Text("My Salon", style: TextStyle(fontSize: 25,color: Colors.black,fontFamily: "Times New Roman", fontWeight: FontWeight.bold),),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.search,color: Colors.black,),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 110,
                    width: 175,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.cyan),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle,size: 33,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("32",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Text("Completed",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20,),
                  Container(
                    height: 110,
                    width: 175,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.deepOrange),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time_sharp,size: 33,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("24",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("Pending",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 110,
                    width: 175,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.pinkAccent),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cancel_outlined,size: 33,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("16",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Text("Cancelled",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20,),
                  Container(
                    height: 110,
                    width: 175,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.deepPurpleAccent),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bar_chart,size: 33,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("08",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Text("Ongoing",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Appointment List",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Harry Osborn"),
                  trailing: Text("Time: 07:07"),
                  focusColor: Colors.black,

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Patrick Nelson"),
                  trailing: Text("Time: 09:00"),
                  focusColor: Colors.black,

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Peter Parker"),
                  trailing: Text("Time: 15:03"),
                  focusColor: Colors.black,

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

          ],
        ),

        bottomNavigationBar: CurvedNavigationBar(color: Colors.teal,height: 60,
          backgroundColor: Colors.white,
          items: <Widget>[
            Icon(Icons.add, size: 30, color: Colors.white,),
            Icon(Icons.list, size: 30, color: Colors.white,),
            Icon(Icons.compare_arrows, size: 30, color: Colors.white,),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),


      ),
    );

  }
}







