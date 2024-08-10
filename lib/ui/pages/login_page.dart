part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                      Get.to(RegisterPage());
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
                  try {
                    await Provider.of<UserProvider>(context, listen: false)
                        .login(username.text, password.text);
                    if (userProvider.userLoggedIn!.value['code'] == '00') {
                      Get.snackbar('Success', "Login Successfully",
                          backgroundColor: Colors.green);
                      Get.to(HomePage());
                    } else {
                      Get.snackbar('false', "Login failed",
                          backgroundColor: Colors.red);
                    }
                  } catch (e) {}
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            userProvider.isLoading == true
                ? CircularProgressIndicator()
                : SizedBox()
          ],
        ),
      )),
    );
  }
}
