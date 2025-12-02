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

part 'AdminCategoryUpdateEvent.dart';
part 'AdminCategoryUpdateState.dart';

class AdminCategoryUpdateBloc
    extends Bloc<AdminCategoryUpdateEvent, AdminCategoryUpdateState> {
  CategoriesUseCases categoriesUseCases;
  AdminCategoryUpdateBloc(this.categoriesUseCases)
    : super(AdminCategoryUpdateState()) {
    on<AdminCategoryUpdateInitEvent>(_onInitEvent);
    on<AdminCategoryUpdateReset>(_onReset);
    on<AdminCategoryUpdateNameChanged>(_onNameChanged);
    on<AdminCategoryUpdateDescriptionChanged>(_onDescriptionChanged);
    on<PickImageUpdate>(_onPickImage);
    on<TakePhotoUpdate>(_onTakePhoto);
    on<AdminCategoryUpdateSubmit>(_onSubmit);
  }

  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  Future<void> _onInitEvent(
    AdminCategoryUpdateInitEvent event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    emit(state.copyWith(
      id: event.category?.id,
      name: BlocFormItem(value: event.category?.name ?? ''),
      description: BlocFormItem(value: event.category?.description ?? ''),
      formKey: formKey,
    ));
  }

  Future<void> _onReset(
    AdminCategoryUpdateReset event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    emit(state.resetForm());
  }


  Future<void> _onNameChanged(
    AdminCategoryUpdateNameChanged event,
    Emitter<AdminCategoryUpdateState> emit,
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
    AdminCategoryUpdateDescriptionChanged event,
    Emitter<AdminCategoryUpdateState> emit,
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
    PickImageUpdate event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      emit(state.copyWith(file: File(file.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
    TakePhotoUpdate event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      emit(state.copyWith(file: File(file.path), formKey: formKey));
    }
  }

  Future<void> _onSubmit(
    AdminCategoryUpdateSubmit event,
    Emitter<AdminCategoryUpdateState> emit,
  ) async {
    emit(state.copyWith(
      response: Loading(),
      formKey: formKey,
    ));
    Resource response = await categoriesUseCases.update.run(state.id, state.toCategory(), state.file);
    emit(state.copyWith(
      response: response,
      formKey: formKey,
    ));
  }
}