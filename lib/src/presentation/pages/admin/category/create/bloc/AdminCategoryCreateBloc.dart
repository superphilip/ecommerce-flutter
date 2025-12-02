import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'AdminCategoryCreateEvent.dart';
part 'AdminCategoryCreateState.dart';

class AdminCategoryCreateBloc
    extends Bloc<AdminCategoryCreateEvent, AdminCategoryCreateState> {
  CategoriesUseCases categoriesUseCases;
  AdminCategoryCreateBloc(this.categoriesUseCases)
    : super(AdminCategoryCreateState()) {
    on<AdminCategoryCreateInitEvent>(_onInitEvent);
    on<AdminCategoryCreateReset>(_onResetEvent);
    on<AdminCategoryCretateNameChanged>(_onNameChanged);
    on<AdminCategoryCretateDescriptionChanged>(_onDescriptionChanged);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
    on<AdminCategoryCreateSubmit>(_onSubmit);
  }

  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  Future<void> _onInitEvent(
    AdminCategoryCreateInitEvent event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onResetEvent(
    AdminCategoryCreateReset event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.resetForm());
  }

  Future<void> _onNameChanged(
    AdminCategoryCretateNameChanged event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final nameValue = event.name.value;
    final nameError = _validators.textValidator(nameValue);
    emit(
      state.copyWith(
        name: BlocFormItem(value: nameValue, error: nameError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onDescriptionChanged(
    AdminCategoryCretateDescriptionChanged event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final descriptionValue = event.description.value;
    final descriptionError = _validators.textValidator(descriptionValue);
    emit(
      state.copyWith(
        description: BlocFormItem(
          value: descriptionValue,
          error: descriptionError,
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPickImage(
    PickImage event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
    TakePhoto event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onSubmit(
    AdminCategoryCreateSubmit event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.copyWith(
      response: Loading(),
      formKey: formKey,
    ));
    Resource response = await categoriesUseCases.create.run(state.toCategory(), state.file!);
    emit(state.copyWith(
      response: response,
      formKey: formKey,
    ));
  }
}
