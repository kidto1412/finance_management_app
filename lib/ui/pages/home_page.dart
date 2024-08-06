part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: halfScreenHeight,
                color: primaryColor,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 24.0),
                      child: Text(
                        'Today is',
                        style: greyFontStyle,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Friday 26 2024',
                        style: whiteTextStyle.copyWith(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24.0),
                      child: Text(
                        'THIS MONTH\'S',
                        style: greyFontStyle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'RP. 50.0000',
                        style: whiteTextStyle.copyWith(fontSize: 28.0),
                      ),
                    )
                  ],
                ),
              ),
              // Stack(
              //   children: [
              //     Positioned(
              //       top: 10.0,
              //       child: Container(
              //         child: Card(
              //           child: Row(
              //             children: [Text('ello')],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
