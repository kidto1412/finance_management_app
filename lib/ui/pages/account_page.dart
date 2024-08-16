part of 'pages.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController balance = TextEditingController();
  final TextEditingController title = TextEditingController();
  int? _selectedBankId;

  @override
  Widget build(BuildContext context) {
    final bankProvider = Provider.of<BankProvider>(context);
    final banks = bankProvider.getAll;
    List userBanks = bankProvider.userBanks ?? [];

    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              userBanks.isEmpty ? NotfoundCard() : CardListBank(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
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
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Bank',
                                        style: labelStyle,
                                      ),
                                    ),
                                    bankProvider.isLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Container(
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
                                                print(
                                                    'Selected Bank ID: $newValue');
                                              },
                                              items: banks
                                                  ?.map<DropdownMenuItem<int>>(
                                                      (Bank bank) {
                                                return DropdownMenuItem<int>(
                                                  value: bank.bankId,
                                                  child: Text(bank.bankName ??
                                                      'Unknown Bank'),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
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
                                          FilteringTextInputFormatter
                                              .digitsOnly,
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
                                        margin: EdgeInsets.only(
                                            top: 18.0, bottom: 10.0),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        height: 55.0,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              backgroundColor: Colors.green,
                                              textStyle: labelButtonStyle1),
                                          onPressed: () async {
                                            //                  await Provider.of<BankProvider>(context, listen: false)
                                            // .addBankUser(name,  balance.text.par)
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
}


// class AccountPage extends StatefulWidget {
//   const AccountPage({super.key});

//   @override
//   State<AccountPage> createState() => _AccountPageState();
// }

// class _AccountPageState extends State<AccountPage> {
//   final TextEditingController balance = TextEditingController();
//   final TextEditingController title = TextEditingController();

//   // ListBank listBank = new ListBank();

//   @override
//   Widget build(BuildContext context) {
//     final bankProvider = Provider.of<BankProvider>(context);
//     final banks = bankProvider.getAll;
//     // if (banks == null || banks.isEmpty) {
//     //   return Center(child: Text('No banks available'));
//     // }
//     String dropdownValue;
//     return SafeArea(
//       child: Stack(
//         children: [
//           Stack(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Content goes here...'),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Container(
//                       margin: EdgeInsets.all(8.0),
//                       width: 50,
//                       height: 50,
//                       child: ElevatedButton(
//                           onPressed: () async {
//                             await Provider.of<BankProvider>(context,
//                                     listen: false)
//                                 .GetALlBank();
//                             showDialog<String>(
//                               context: context,
//                               builder: (BuildContext context) => Dialog(
//                                 child: SingleChildScrollView(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.stretch,
//                                       mainAxisSize: MainAxisSize.min,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         Container(
//                                             padding: EdgeInsets.all(8.0),
//                                             child: Text(
//                                               'Input Bank',
//                                               style: titleStyle,
//                                             )),
//                                         Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10.0),
//                                           child: Text(
//                                             'Bank',
//                                             style: labelStyle,
//                                           ),
//                                         ),
//                                         bankProvider.isLoading == false
//                                             ? Container(
//                                                 padding: EdgeInsets.all(10.0),
//                                                 child: DropdownButton<int>(
//                                                   hint: Text('Select Bank'),
//                                                   value:
//                                                       null, // You can set this to a default value if needed
//                                                   onChanged: (int? value) {
//                                                     // Handle the selection
//                                                     print(
//                                                         'Selected Bank ID: $value');
//                                                   },
//                                                   items: banks!.map<
//                                                       DropdownMenuItem<
//                                                           int>>((Bank bank) {
//                                                     return DropdownMenuItem<
//                                                         int>(
//                                                       value: bank.bankId,
//                                                       child:
//                                                           Text(bank.bankName!),
//                                                     );
//                                                   }).toList(),
//                                                 ),
//                                               )
//                                             : Center(
//                                                 child:
//                                                     CircularProgressIndicator(),
//                                               ),
//                                         Container(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10.0),
//                                           child: Text(
//                                             'Balance',
//                                             style: labelStyle,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: EdgeInsets.all(10.0),
//                                           child: TextFormField(
//                                             validator: (String? value) {
//                                               validator(value, '');
//                                             },
//                                             keyboardType: TextInputType.number,
//                                             inputFormatters: [
//                                               FilteringTextInputFormatter
//                                                   .digitsOnly,
//                                               CurrencyInputFormatter(),
//                                             ],
//                                             controller: balance,
//                                             decoration: InputDecoration(
//                                               border: OutlineInputBorder(),
//                                               hintText: 'Balance',
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(height: 15),
//                                         Container(
//                                             width: double.infinity,
//                                             margin: EdgeInsets.only(
//                                                 top: 18.0, bottom: 10.0),
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 10.0),
//                                             height: 55.0,
//                                             child: ElevatedButton(
//                                               style: ElevatedButton.styleFrom(
//                                                   shape: RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5.0)),
//                                                   backgroundColor: Colors.green,
//                                                   textStyle: labelButtonStyle1),
//                                               onPressed: () async {},
//                                               child: Text(
//                                                 'Add Data',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: CircleBorder(), // Membuat tombol bulat
//                             padding: EdgeInsets.all(
//                                 0), // Menghilangkan padding tambahan
//                           ),
//                           child: Center(child: Icon(Icons.add))),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
