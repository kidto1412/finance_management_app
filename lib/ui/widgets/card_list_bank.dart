part of 'widgets.dart';

class CardListBank extends StatelessWidget {
  String? bankName;
  int? totalBalance;
  CardListBank({this.bankName, this.totalBalance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('asda'),
                  Text('asda'),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined),
                color: primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
