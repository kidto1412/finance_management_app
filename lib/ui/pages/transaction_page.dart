part of 'pages.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController amount = TextEditingController();
  TextEditingController title = TextEditingController();
  int? _selectedBankId;
  int? _selectedCategoryId;
  int userId = localStorage.getItem("userId")!.toInt() ?? 0;

  DateTime? selectedDate;
  String? selectedType;
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionProvider>(context, listen: false)
          .GetTransactionUser(userId);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bankProvider = Provider.of<BankProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);

    late List<Bank>? banks = bankProvider.getAll;
    List<Bank>? userBanks = bankProvider.userBanks ?? [];
    List<String> types = ['DEBIT', 'CREDIT'];
    List<Category> allCategories = categoryProvider.allCategories ?? [];
    List<Category> userCategories = categoryProvider.resultUserCategory ?? [];
    List<Transaction>? transactions = transactionProvider.transactions ?? [];

    return SafeArea(
      child: Stack(
        children: [
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text('List Transaction'),
                  ),
                  transactionProvider.loadTransaction == true
                      ? Center(child: CircularProgressIndicator())
                      : transactions.isEmpty
                          ? NotfoundCard()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: transactions.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Transaction transaction =
                                    transactions[index];
                                return TransactionCard(
                                  bankName: transaction.title,
                                  totalBalance: transaction.amount,
                                );
                              },
                            ),
                  // Container(
                  //   margin: EdgeInsets.all(10.0),
                  //   child: Text('Setting your categories here'),
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Add your other widgets here
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Container(
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  await Provider.of<BankProvider>(context, listen: false)
                      .GetUserBank(userId);

                  await Provider.of<CategoryProvider>(context, listen: false)
                      .GetCategoryUser(userId);

                  _dialogBuilder(
                      context,
                      bankProvider,
                      categoryProvider,
                      transactionProvider,
                      userBanks,
                      userCategories,
                      types,
                      title,
                      selectedType,
                      userId,
                      _selectedBankId,
                      _dateController,
                      amount,
                      validator,
                      'add');
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(0),
                ),
                child: Center(child: Icon(Icons.add)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context,
      BankProvider bankProvider,
      CategoryProvider categoryProvider,
      TransactionProvider transactionProvider,
      List<Bank>? _userBanks,
      List<Category>? userCategories,
      List types,
      TextEditingController title,
      String? type,
      int userId,
      int? _selectedBankId,
      TextEditingController _dateController,
      TextEditingController amount,
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
                    'Title',
                    style: labelStyle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: title,
                    validator: (String? value) {
                      validator(value, 'username');
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Title',
                    ),
                  ),
                ),
                bankProvider.isLoading == true
                    ? CircularProgressIndicator()
                    : Container(
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
                    items: _userBanks?.map<DropdownMenuItem<int>>((Bank bank) {
                      return DropdownMenuItem<int>(
                        value: bank.bankId,
                        child: Text(bank.bankName ?? 'Unknown Bank'),
                      );
                    }).toList(),
                  ),
                ),
                categoryProvider.isLoading == true
                    ? CircularProgressIndicator()
                    : Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Category',
                          style: labelStyle,
                        ),
                      ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: Text('Select Category'),
                    value: _selectedCategoryId,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedCategoryId = newValue;
                      });
                      print('Selected Bank ID: $newValue');
                    },
                    items: userCategories
                        ?.map<DropdownMenuItem<int>>((Category category) {
                      return DropdownMenuItem<int>(
                        value: category.categoryId,
                        child:
                            Text(category.categoryName ?? 'Unknown Category'),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Date',
                    style: labelStyle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _dateController,
                    validator: (String? value) {
                      validator(value, 'username');
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: 'Password',
                      labelText: 'Enter Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(pickedDate);
                        setState(() {
                          _dateController.text =
                              formattedDate; // Set the value to the text field
                          print('date ${_dateController.text}');
                        });
                      }
                    },
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
                    controller: amount,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Amount',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: Text('Select Type Transaction'),
                    value: selectedType,
                    onChanged: (String? newValue) {
                      setState(() {
                        print('selected value ${newValue}');
                        selectedType = newValue;
                      });
                    },
                    items: types.map<DropdownMenuItem<String>>((type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
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
                        print(_dateController);
                        late int? newAmount =
                            unformatBalance(amount.text).toInt();
                        await Provider.of<TransactionProvider>(context,
                                listen: false)
                            .addTransaction(
                                title.text,
                                _dateController.text,
                                userId,
                                _selectedBankId ?? 0,
                                newAmount ?? 0,
                                _selectedCategoryId ?? 0,
                                selectedType.toString());
                        if (transactionProvider.resultAddTrans != null) {
                          if (transactionProvider
                                  .resultAddTrans!.value['code'] ==
                              '00') {
                            Provider.of<TransactionProvider>(context,
                                    listen: false)
                                .GetTransactionUser(userId);
                            Get.snackbar('Success', 'Transaction success');
                          } else {
                            Get.snackbar(
                                'Failed',
                                transactionProvider.resultAddTrans!.message
                                    .toString());
                          }
                        } else {
                          Get.snackbar('Failed', 'Transaction failed');
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
