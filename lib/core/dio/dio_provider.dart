import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>(
  (_) => Dio(
    BaseOptions(baseUrl: Uri.https('gateway.marvel.com').toString()),
  ),
);
