import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favroit_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<Map<String, dynamic>> favoriteProducts = [];

  void toggleFavorite(Map<String, dynamic> product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }

    emit(FavoriteUpdated());
  }

  bool isFavorite(Map<String, dynamic> product) {
    return favoriteProducts.contains(product);
  }

  int get favoriteCount => favoriteProducts.length;
}
