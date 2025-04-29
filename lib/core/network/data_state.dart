
 import 'package:dio/dio.dart';

import 'error/error_handle.dart';


abstract class DataState<T>{
  final T ? data;
   final DioException ? error;

   const DataState({this.data,this.error});
 }
 class DataSuccess<T> extends DataState<T>{
  const DataSuccess(T data) : super(data: data);
 }
 class DataFailed<T> extends DataState<T>{
   const DataFailed( error) : super(error: error);
   String get message => getErrorMessage(error!);

 }