import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hussain_mustafa_riverpod/models/pokemon.dart';
import 'package:hussain_mustafa_riverpod/pages/page_data.dart';

import '../services/http_services.dart';

// Imagine you have a toy car that you want to give to your little brother. The toy car is special because it needs
//batteries to work. You have some batteries, and you want to make sure the car has batteries when you give it to him.

// In your code, HomePageController(super._state): super(); is like making sure the toy car
// (your controller) has batteries (the state) when you give it to your little brother (the parent class).

// super._state: This is like taking the batteries you have.
// super(): This is like giving the toy car with the batteries to your little brother.
// So, super._state makes sure the controller (toy car) has the initial state
//(batteries) it needs to work properly.

class HomePageController extends StateNotifier<HomePageData> {
  final GetIt _getIt = GetIt.instance;
  late HTTPService _httpService;
  HomePageController(
    super._state,
  ) {
    _httpService = _getIt.get<HTTPService>();
    _setup();
  }
  Future<void> _setup() async {
    loadData();
  }

  Future<void> loadData() async {
    if (state.data == null) {
      Response? res = await _httpService
          .get('https://pokeapi.co/api/v2/pokemon?limit=20&offset=0');
      // print(res?.data);
      if (res != null && res.data != null) {
        PokemonListData data = PokemonListData.fromJson(res.data);
        state = state.copyWith(
          data: data,
        );
        print(state.data?.results?.first);
      }
    } else {}
  }
}
