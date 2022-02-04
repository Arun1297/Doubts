import 'package:flutter/material.dart';

void main() {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,

      title: 'Kindacode.com',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myProducts = List<dynamic>.generate(20, (index) => "Product${index}");
  // var tap ;
  int selectedIndex = -1;
  bool _isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
     body:
      Container(
          height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // the number of items in the list
                  itemCount: myProducts.length,
// display each item of the product list
                  itemBuilder: (context, index) {
                    return
                       Visibility(
                         visible: selectedIndex == index ? true : false,
                         child:
                         GestureDetector(
                          // key: ValueKey(myProducts[index]['name']),
                          onTap: ()
                          {

                            setState(() {
                              selectedIndex=index;
                          });
                          },
                          child: Container(
                            width: 153.94,
                            color: Colors.blue,
                            // In many cases, the key isn't mandatory
                            // key: UniqueKey(),
                            margin: EdgeInsets.all(25),
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(myProducts[index])),
                          ),
                      // ),
                    ),
                       );
                  }),
            ),
          // ),
        // )
    );
  }
}
