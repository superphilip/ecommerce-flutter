import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

part 'AdminCategoryListEvent.dart';
part 'AdminCategoryListState.dart';

class AdminCategoryListBloc
    extends Bloc<AdminCategoryListEvent, AdminCategoryListState> {
  CategoriesUseCases categoriesUseCases;
  AdminCategoryListBloc(this.categoriesUseCases) : super(AdminCategoryListState()) {
    on<GetCategories>(_onGetCategories);
    on<DeleteCategory>(_onDeleteCategory);
  }

  Future<void> _onGetCategories(
      GetCategories event, 
      Emitter<AdminCategoryListState> emit
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoriesUseCases.getCategories.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCategory(
      DeleteCategory event, 
      Emitter<AdminCategoryListState> emit
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoriesUseCases.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
