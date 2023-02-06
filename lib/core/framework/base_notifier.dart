import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseNotifier<T> extends StateNotifier<searchProvider<T>> {
  BaseNotifier({
    searchProvider<T> state = const searchProvider(),
  }) : super(state);
  void init(bool reInit) {
    if (_initialized && !reInit) return;
    _initialized = true;
    onInit();
  }

  bool _initialized = false;

  void onInit() {}

  void setLoading() {
    state = const searchProvider(status: NotifierStatus.loading);
  }

  void setIdle() {
    state = const searchProvider(status: NotifierStatus.idle);
  }

  void setData(T data) {
    state = searchProvider(status: NotifierStatus.done, data: data);
  }

  void setError(String message) {
    state = searchProvider(
      status: NotifierStatus.error,
      message: message,
    );
  }
}

class searchProvider<T> {
  final T? data;
  final NotifierStatus status;
  final String? message;
  const searchProvider({
    this.data,
    this.status = NotifierStatus.idle,
    this.message,
  });

  bool get isDone => status == NotifierStatus.done;
  bool get isLoading => status == NotifierStatus.loading;
  bool get isIdle => status == NotifierStatus.idle;
  bool get isError => status == NotifierStatus.error;

  Widget when({
    required Widget Function(T data) done,
    required Widget Function(String? message) error,
    required Widget Function() loading,
    Widget Function()? idle,
  }) {
    switch (status) {
      case NotifierStatus.loading:
        {
          return loading();
        }
      case NotifierStatus.idle:
        {
          if (idle == null) {
            return const SizedBox();
          }
          return idle();
        }
      case NotifierStatus.done:
        {
          return done(data as T);
        }
      case NotifierStatus.error:
        {
          return error(message);
        }
    }
  }
}

enum NotifierStatus { loading, idle, done, error }

searchProvider<T> notifyData<T>({required T? value}) {
  return searchProvider<T>(
    status: NotifierStatus.done,
    data: value,
  );
}

searchProvider<T> notifyError<T>({required String error}) {
  return searchProvider<T>(
    status: NotifierStatus.error,
    message: error,
  );
}

typedef FutureNotifierState<T> = Future<searchProvider<T>>;

extension Hook on WidgetRef {
  searchProvider<R> useProvider<R, T extends BaseNotifier<R>>(
    StateNotifierProvider<T, searchProvider<R>> provider, {
    bool reInit = false,
  }) {
    useEffect(() {
      final timer = Timer(
        Duration.zero,
        () {
          read(provider.notifier).init(reInit);
        },
      );
      return () => timer.cancel();
    }, []);
    return watch(provider);
  }

  searchProvider<R> useProviderFamily<R, T extends BaseNotifier<R>, V>(
    StateNotifierProviderFamily<T, searchProvider<R>, V> provider,
    V value, {
    bool reInit = false,
  }) {
    useEffect(() {
      final timer = Timer(
        Duration.zero,
        () {
          read(provider(value).notifier).init(reInit);
        },
      );
      return () => timer.cancel();
    }, []);
    return watch(provider(value));
  }
}
