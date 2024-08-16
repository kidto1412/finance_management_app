import 'dart:convert';
import 'dart:io';
// import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:finance_management/models/models.dart';
import 'package:get/get_connect/http/src/response/response.dart';

part 'authService.dart';
part 'bankService.dart';
part 'transactionService.dart';
part 'categoryService.dart';

final dio = Dio(BaseOptions(baseUrl: baseUrl));
String baseUrl = "http://10.0.2.2:2000/";
