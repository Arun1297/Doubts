import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: MyHomePage(
        title: "hii from main page",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title = "MyHomePage";

  MyHomePage({title = "example"}) {
    title = title;
    print(title);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myProducts = List<dynamic>.generate(20, (index) => "Product${index}");
  // var tap ;
  int selectedIndex = -1;
  bool _isvisible = false;

  Widget switchWidget(int numb) {
    switch (numb) {
      case 1:
        return Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: Center(child: Text("hi")),
          ),
        );
      case 2:
        return Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.black,
            child: Center(child: Text("hi2")),
          ),
        );
      case 3:
        return Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(child: Text("hi3")),
          ),
        );

      default:
        return Center(
          child: Container(
              width: 200,
              height: 200,
              color: Colors.blueAccent,
              child: Center(child: Text("default container"))),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(DateFormat.Hm().format(DateTime.now()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Container(
        height: 250,
        child: ListView.builder(
            physics: _isvisible
                ? NeverScrollableScrollPhysics()
                : AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            // the number of items in the list
            itemCount: myProducts.length,
// display each item of the product list
            itemBuilder: (lcontext, index) {
              return Visibility(
                visible: (!_isvisible || selectedIndex == index) ? true : false,
                child: GestureDetector(
                  // key: ValueKey(myProducts[index]['name']),
                  onTap: () {
                    setState(() {
                      _isvisible = true;
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: 250,
                    width: (!_isvisible || selectedIndex == index)
                        ? !_isvisible
                            ? 125
                            : MediaQuery.of(context).size.width
                        : 123.94,
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
    );
  }
}
