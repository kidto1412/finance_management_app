part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Input data transaction',
                          style: titleStyle,
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Name',
                        style: labelStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: title,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Email',
                        style: labelStyle,
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(10.0),
                    //   child: InputDatePickerFormField(
                    //     firstDate: DateTime.now(),
                    //     lastDate: ,

                    //   ),
                    // ),X
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Email',
                        style: labelStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 18.0, bottom: 10.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 55.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              backgroundColor: Colors.green,
                              textStyle: labelButtonStyle1),
                          onPressed: () async {},
                          child: Text(
                            'Add Data',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          margin: EdgeInsets.only(top: 28.0),
                          child: Text(
                            'THIS MONTH\'S',
                            style: greyFontStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'RP. 50.0000',
                            style: whiteTextStyle.copyWith(
                                fontSize: 28.0, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24.0),
                    width: double.infinity,
                    height: halfScreenHeight,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Current Transaction'),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See All',
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Test'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Test'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Test'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Test'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Test'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Test'),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: halfScreenHeight - 50, // Adjust this value as needed
                left: 16.0,
                right: 16.0,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.money),
                        Text('Hello', style: TextStyle(fontSize: 18)),
                        Spacer(flex: 2),
                        Text('50000', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
