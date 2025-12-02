import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

part 'AdminProductListEvent.dart';
part 'AdminProductListState.dart';

class AdminProductListBloc
    extends Bloc<AdminProductListEvent, AdminProductListState> {
  ProductsUseCases productsUseCases;
  AdminProductListBloc(this.productsUseCases) : super(AdminProductListState()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onGetProductsByCategory(
    GetProductsByCategory event,
    Emitter<AdminProductListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await productsUseCases.getProductsByCategory.run(event.idCategory);
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<AdminProductListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await productsUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
