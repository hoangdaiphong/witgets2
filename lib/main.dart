import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  // Container Widget
  // runApp(const ContainerWidget());

  // Wrap Widget
  // runApp(const WrapWidget());

  // Expanded Widget
  // runApp(const ExpandedWidget());

  // Stack Widget
  runApp(const StackWidget());

  // Text Widget
  // runApp(const TextWidget());

  // Scaffold Widget
  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: ScaffoldWidget(),
  // ));

  // Button Widgets
  // runApp(ButtonWidget());

  // Radio Button Widget
  // runApp(MaterialApp(home: RadioButtonWidget()));
  // runApp(MaterialApp(
  //     debugShowCheckedModeBanner: false, home: RadioButtonWidget()));

  // GridView Widget
  // runApp(const GridViewWidget());
  // runApp(const GridWiewWidgetRemake());

  // SnackBar Widget
  // runApp(SnackBarWidget());
  // runApp(SnackBarWidget2());
}

// --------------------------- Container Widget ---------------------------
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Container(
            child: Text('My app', style: TextStyle(color: Colors.green)),
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.lightGreen),
            transform: Matrix4.rotationZ(-pi / 10)));
  }
}

// --------------------------- Wrap Widget ---------------------------
class WrapWidget extends StatefulWidget {
  const WrapWidget({super.key});

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('WRAP WIDGET ')),
        body: Center(
            child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 50,
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                children: <Widget>[
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer(),
              MyContainer()
            ])),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        width: 50,
        height: 50,
        color: Colors.red);
  }
}

// --------------------------- Expanded Widget ---------------------------
class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({super.key});

  @override
  State<ExpandedWidget> createState() => ExpandedWidgetState();
}

class ExpandedWidgetState extends State<ExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('WRAP WIDGET ')),
          body: Center(
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyContainer2(),
                  Expanded(flex: 1, child: MyContainer2()),
                  Expanded(flex: 2, child: MyContainer2())
                ]),
          )),
    );
  }
}

class MyContainer2 extends StatelessWidget {
  const MyContainer2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        width: 50,
        height: 50,
        color: Colors.red);
  }
}

// --------------------------- Stack Widget ---------------------------
class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(width: 150, height: 150, color: Colors.red),
              Container(width: 120, height: 120, color: Colors.green),
              Container(width: 90, height: 90, color: Colors.blue),
              Positioned(
                  bottom: -10,
                  right: -10,
                  child: Container(width: 60, height: 60, color: Colors.purple))
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------- Text Widget ---------------------------
class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('HelloWorld ' * 5,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  wordSpacing: 10,
                  letterSpacing: 5,
                  backgroundColor: Colors.amber,
                  decorationColor: Colors.blue,
                  height: 3,
                  leadingDistribution: TextLeadingDistribution.even)),
        ),
      ),
    );
  }
}

// --------------------------- Scaffold Widget ---------------------------
class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('SCAFFLOD DEMO'),
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.face),
                )),
        actions: [
          Icon(Icons.male),
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.female)))
        ],
      ),
      drawer: Drawer(
        child: ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      endDrawer: Drawer(
        child: ElevatedButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Text('Hello',
              style: TextStyle(color: Colors.blue, fontSize: 20))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.share, color: Colors.white), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(color: Colors.blue, height: 50)),
    );
  }
}

// --------------------------- Button Widgets ---------------------------
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Calcutator', home: ButtonWidgets());
  }
}

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    var myButtonStyle = ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(Colors.green),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        padding: MaterialStateProperty.all(EdgeInsets.all(10)));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text('Text Button', style: TextStyle(fontSize: 40)),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber)),
              ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.cloud_upload, size: 50),
                  style: myButtonStyle),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100, minHeight: 100),
                child: OutlinedButton(
                    onPressed: () {},
                    child:
                        Text('Outlined Button', style: TextStyle(fontSize: 40)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        animationDuration: Duration(microseconds: 50000))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------- Radio Button Widget ---------------------------
class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  int _gioiTinh = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text('Radio Demo')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                  title: Text('Male', style: TextStyle(color: Colors.white)),
                  leading: Radio(
                      value: 0,
                      groupValue: _gioiTinh,
                      onChanged: setGioiTinh,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.blue.withOpacity(.32);
                        }
                        return Colors.blue;
                      }))),
              ListTile(
                  title: Text('Female', style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.female, color: Colors.white),
                  leading: Radio(
                      value: 1,
                      groupValue: _gioiTinh,
                      onChanged: setGioiTinh,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.orange.withOpacity(.32);
                        }
                        return Colors.orange;
                      }))),
              RadioListTile(
                  title: Text('Unknow', style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('I know', style: TextStyle(color: Colors.white)),
                  secondary: Icon(Icons.female, color: Colors.amber),
                  value: 2,
                  groupValue: _gioiTinh,
                  onChanged: setGioiTinh,
                  tileColor: Color.fromARGB(30, 12, 64, 107),
                  shape: Border.all(
                      width: 5, color: Color.fromARGB(50, 102, 78, 7)))
            ]));
  }

  void setGioiTinh(Object? value) {
    setState(() {
      _gioiTinh = int.parse(value.toString());
    });
  }
}

// --------------------------- Grid Widget1 ---------------------------
//*---------------
class GridWiewWidgetRemake extends StatelessWidget {
  const GridWiewWidgetRemake({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GridView Demo',
      home: GridViewDemo3(),
    );
  }
}

class GridViewDemo3 extends StatelessWidget {
  const GridViewDemo3({super.key});

  @override
  Widget build(BuildContext context) {
    List<MaterialColor> color = [
      Colors.amber,
      Colors.green,
      Colors.purple,
      Colors.yellow,
      Colors.pink
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          for (int i = 0; i < 5; i++)
            for (int i = 0; i < 5; i++) Container(color: color[i])
        ],
      ),
    );
  }
}

//*---------------
class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GridView Demo',
      // home: GridViewDemo(),
      home: GridViewDemo2(),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView(
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 100, crossAxisSpacing: 10, mainAxisSpacing: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // childAspectRatio: .5,
          // mainAxisExtent: 250
        ),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.purple),
          Container(color: Colors.yellow),
          for (var i = 0; i < 50; i++)
            Image.network('https://loremflickr.com/320/240?lock=$i')
        ],
      ),
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // body: GridView.count(
      //   crossAxisCount: 3,
      //   children: [
      //     Container(color: Colors.red),
      //     Container(color: Colors.green),
      //     Container(color: Colors.purple),
      //     Container(color: Colors.yellow),
      //     Container(color: Colors.pink)
      //   ],
      // ),
      // Thường sẽ dùng builder vừa cuộn vừa load
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Container(color: Colors.pink);
        },
      ),
    );
  }
}

// --------------------------- SnackBar Widget ---------------------------
class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySnackBarDemo(),
    );
  }
}

class MySnackBarDemo extends StatelessWidget {
  const MySnackBarDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: (() {
          var mySnackBar = SnackBar(
              content: Text('My name is ...'),
              duration: Duration(microseconds: 1000000),
              backgroundColor: Colors.brown);
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
        }),
      ),
    );
  }
}

// --------------------------- SnackBar Widget2 ---------------------------
class SnackBarWidget2 extends StatelessWidget {
  SnackBarWidget2({super.key});
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_alarm),
          onPressed: () {
            var mySnackBar = SnackBar(content: Text('My name is ...'));
            _messengerKey.currentState!.showSnackBar(mySnackBar);
          },
        ),
      ),
    );
  }
}
