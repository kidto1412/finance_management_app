part of 'pages.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController balance = TextEditingController();
  TextEditingController title = TextEditingController();
  int? _selectedBankId;
  int userId = localStorage.getItem("userId")!.toInt() ?? 0;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BankProvider>(context, listen: false).GetUserBank(userId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bankProvider = Provider.of<BankProvider>(context);
    late List<Bank>? banks = bankProvider.getAll;
    List userBanks = bankProvider.userBanks ?? [];

    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              userBanks.isEmpty
                  ? Expanded(child: NotfoundCard())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: userBanks.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Bank bank = userBanks[index];
                          return CardListBank(
                            bankName: bank.bankName,
                            totalBalance: bank.totalBalance,
                            onTap: () {
                              print(bank.bankId);
                              print(bank.totalBalance);
                              setState(() {
                                _selectedBankId = bank.bankId;
                                balance.text =
                                    formatRupiah(bank.totalBalance!.toInt());
                              });
                              int? currentBankId = bank.bankId;
                              _dialogBuilder(
                                  context,
                                  bankProvider,
                                  banks,
                                  userId,
                                  _selectedBankId,
                                  balance,
                                  currentBankId,
                                  validator,
                                  'edit');
                            },
                          );
                        },
                      ),
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Provider.of<BankProvider>(context, listen: false)
                            .GetALlBank();
                        print(bankProvider.isLoading);
                        bankProvider.isLoading == true
                            ? showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // Prevent closing while loading
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(width: 20),
                                          Text("Loading Banks..."),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : _dialogBuilder(
                                context,
                                bankProvider,
                                banks,
                                userId,
                                _selectedBankId,
                                balance,
                                null,
                                validator,
                                'add');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(0),
                      ),
                      child: Center(child: Icon(Icons.add))),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context,
      BankProvider bankProvider,
      List<Bank>? banks,
      int userId,
      int? _selectedBankId,
      TextEditingController balance,
      int? currentBankId,
      Function validator,
      String action) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: SingleChildScrollView(
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
                      'Input Bank',
                      style: titleStyle,
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Bank',
                    style: labelStyle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: Text('Select Bank'),
                    value: _selectedBankId,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedBankId = newValue;
                      });
                      print('Selected Bank ID: $newValue');
                    },
                    items: banks?.map<DropdownMenuItem<int>>((Bank bank) {
                      return DropdownMenuItem<int>(
                        value: bank.bankId,
                        child: Text(bank.bankName ?? 'Unknown Bank'),
                      );
                    }).toList(),
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
                  child: TextFormField(
                    validator: (String? value) {
                      validator(value, '');
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyInputFormatter(),
                    ],
                    controller: balance,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Balance',
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
                      onPressed: () async {
                        if (action == 'add') {
                          late int? newBalance =
                              unformatBalance(balance.text).toInt();

                          await Provider.of<BankProvider>(context,
                                  listen: false)
                              .addBankUser(
                                  userId, _selectedBankId ?? 0, newBalance!);
                          if (bankProvider.resultAdd!.value['code'] == '00') {
                            await Provider.of<BankProvider>(context,
                                    listen: false)
                                .GetUserBank(userId);
                            Get.snackbar('Success', 'Add Success');
                            Navigator.of(context).pop();
                          } else if (bankProvider.resultAdd!.value['code'] ==
                              '01') {
                            Get.snackbar('Failed',
                                bankProvider.resultAdd!.value['message']);
                          } else {
                            Get.snackbar('Failed',
                                bankProvider.resultAdd!.message.toString());
                          }
                        } else {
                          late int? newBalance =
                              unformatBalance(balance.text).toInt();

                          await Provider.of<BankProvider>(context,
                                  listen: false)
                              .editBankUser(userId, _selectedBankId ?? 0,
                                  newBalance!, currentBankId!);
                          if (bankProvider.resultEdit!.value['code'] == '00') {
                            await Provider.of<BankProvider>(context,
                                    listen: false)
                                .GetUserBank(userId);
                            Get.snackbar('Success', 'Add Success');
                            Navigator.of(context).pop();
                          } else if (bankProvider.resultEdit!.value['code'] ==
                              '01') {
                            Get.snackbar('Failed',
                                bankProvider.resultEdit!.value['message']);
                          } else {
                            Get.snackbar('Failed',
                                bankProvider.resultAdd!.message.toString());
                          }
                        }
                      },
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
      ),
    ).then((_) {
      setState(() {
        // Reset the selected bank ID after the dialog closes if needed
      });
    });
  }
}
