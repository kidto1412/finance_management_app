part of 'widgets.dart';

class CardListBank extends StatelessWidget {
  String? bankName;
  int? totalBalance;
  Function? onTap;
  CardListBank({this.bankName, this.totalBalance, this.onTap});

  @override
  Widget build(BuildContext context) {
    final formattedBalance = formatRupiah(totalBalance!.toInt());

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bankName ?? ''),
                  Text(formattedBalance.toString()),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  onTap!();
                },
                icon: Icon(Icons.edit_outlined),
                color: Colors.orange,
              ),
              IconButton(
                onPressed: () {
                  onTap!();
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
