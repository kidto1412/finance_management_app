part of 'pages.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Content goes here...'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), // Membuat tombol bulat
                            padding: EdgeInsets.all(
                                0), // Menghilangkan padding tambahan
                          ),
                          child: Center(child: Icon(Icons.add))),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
