import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finance_management/models/models.dart';

part 'authService.dart';
part 'bankService.dart';
part 'transactionService.dart';

final dio = Dio();
String baseUrl = "http://192.168.1.6:2000/";
