part of 'widgets.dart';

class NotfoundCard extends StatelessWidget {
  const NotfoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Card(
        child: Center(
          child:
              Container(padding: EdgeInsets.all(10.0), child: Text('Notfound')),
        ),
      ),
    );
  }
}
