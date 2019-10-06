import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState.initial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Started) {}
  }
}
