part of 'widgets.dart';

class CustomBottomBar extends StatelessWidget {
  // const CustombBar({ Key? key }) : super(key: key);
  final int selectedIndex;
  final Function(int index)? onTap;

  CustomBottomBar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? primaryColor : Colors.grey,
                )),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.monetization_on,
                  color: selectedIndex == 1 ? primaryColor : Colors.grey,
                )),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.account_balance,
                  color: selectedIndex == 2 ? primaryColor : Colors.grey,
                )),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(3);
              }
            },
            child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.person_rounded,
                  color: selectedIndex == 3 ? primaryColor : Colors.grey,
                )),
          ),
        ],
      ),
    );
  }
}
