import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/core/framework/base_notifier.dart';

import 'service_response.dart';

Future<AsyncValue<Response>> convertAsync<Response>(
  MainFunction<Response> f,
) async {
  return (await f()).toAsyncValue();
}

Future<searchProvider<Response>> convert<Response>(
  MainFunction<Response> f,
) async {
  return (await f()).toNotifierState();
}

Future<searchProvider<Response>> convertWithArgument<Response, Argument>(
  MainFunctionWithArgument<Response, Argument> f,
  Argument argument, {
  Function(ServiceResponse<Response>)? then,
}) async {
  var response = await f(argument);
  then?.call(response);
  // if (then != null) {
  //   await then(response);
  // }
  return response.toNotifierState();
}

Future<searchProvider<AlternateResponse>>
    convertWithAlternateResponse<Response, Argument, AlternateResponse>(
        MainFunctionWithArgument<Response, Argument> f, Argument argument,
        {required AlternateFunction<Response, AlternateResponse>
            getAlternateResponse}) async {
  return getAlternateResponse(await f(argument)).toNotifierState();
}

Future<searchProvider<AlternateResponse>>
    convertWithAsyncAlternateResponse<Response, Argument, AlternateResponse>(
  MainFunctionWithArgument<Response, Argument> f,
  Argument argument, {
  required AsyncAlternateFunction<Response, AlternateResponse>
      getAlternateResponse,
}) async {
  return (await getAlternateResponse(await f(argument))).toNotifierState();
}

typedef AsyncAlternateFunction<Response, AlternateResponse>
    = Future<ServiceResponse<AlternateResponse>> Function(
        ServiceResponse<Response>);
typedef AlternateFunction<Response, AlternateResponse>
    = ServiceResponse<AlternateResponse> Function(ServiceResponse<Response>);
typedef MainFunctionWithArgument<Response, Argument>
    = Future<ServiceResponse<Response>> Function(Argument argument);
typedef MainFunction<Response> = Future<ServiceResponse<Response>> Function();
