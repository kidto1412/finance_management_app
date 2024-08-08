part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ListBank listBank = new ListBank();

  // Mengakses daftar bank melalui getter

  @override
  Widget build(BuildContext context) {
    List<String> banks = listBank.getListbank();
    String dropdownValue = banks.first;
    final TextEditingController username = TextEditingController();
    final TextEditingController name = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController balance = TextEditingController();
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/logo_money.png',
                  width: 100,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Welcome, Join using this application to manage your money better',
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
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
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Username',
                style: labelStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
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
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Password',
                style: labelStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Bank',
                style: labelStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: DropdownMenu<String>(
                  initialSelection: banks.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries:
                      banks.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Balance',
                style: labelStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: balance,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Balance',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text('Do you already have an account?'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Get.to(LoginPage());
                    },
                    child: Text('Click here'),
                  )
                ],
              ),
            ),
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
                  onPressed: () async {
                    print(dropdownValue);
                    Get.snackbar("Hi", "I'm modern snackbar",
                        backgroundColor: Colors.green, colorText: Colors.white);
                    await Provider.of<UserProvider>(context, listen: false)
                        .register(
                            name.text,
                            email.text,
                            username.text,
                            password.text,
                            dropdownValue,
                            balance.text.toInt()!);

                    if (userProvider.resultRegister!.value['code'] == "00" &&
                        userProvider.resultAddBakn!.value['code'] == "00") {
                      Get.snackbar('Success', 'User Registered Successfully',
                          backgroundColor: Colors.green,
                          colorText: Colors.white);
                    } else {
                      Get.snackbar('Failed', 'User Registered Successfully',
                          backgroundColor: Colors.red, colorText: Colors.white);
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            userProvider.isLoading == true
                ? Container(
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      )),
    );
  }
}
