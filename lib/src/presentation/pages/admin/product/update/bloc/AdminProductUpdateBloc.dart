import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'AdminProductUpdateEvent.dart';
part 'AdminProductUpdateState.dart';

class AdminProductUpdateBloc
    extends Bloc<AdminProductUpdateEvent, AdminProductUpdateState> {
  ProductsUseCases productsUseCases;
  AdminProductUpdateBloc(this.productsUseCases)
    : super(AdminProductUpdateState()) {
    on<AdminProductUpdateInitEvent>(_onInitEvent);
    on<AdminProductUpdateReset>(_onResetEvent);
    on<AdminProductUpdateNameChanged>(_onNameChanged);
    on<AdminProductUpdateDescriptionChanged>(_onDescriptionChanged);
    on<AdminProductUpdatePriceChanged>(_onPriceChanged);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
    on<AdminProductUpdateSubmit>(_onSubmit);
  }

  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  Future<void> _onInitEvent(
    AdminProductUpdateInitEvent event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.product?.id,
        idCategory: event.product?.idCategory,
        name: BlocFormItem(value: event.product?.name ?? ''),
        description: BlocFormItem(value: event.product?.description ?? ''),
        price: BlocFormItem(value: event.product?.price.toString() ?? ''),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onResetEvent(
    AdminProductUpdateReset event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    emit(state.resetForm());
  }

  Future<void> _onNameChanged(
    AdminProductUpdateNameChanged event,
    Emitter<AdminProductUpdateState> emit,
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
    AdminProductUpdateDescriptionChanged event,
    Emitter<AdminProductUpdateState> emit,
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

  Future<void> _onPriceChanged(
    AdminProductUpdatePriceChanged event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    final priceValue = event.price.value;
    final priceError = event.price.value.isNotEmpty
        ? null
        : 'Ingrega el precio';
    emit(
      state.copyWith(
        price: BlocFormItem(value: priceValue, error: priceError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPickImage(
    PickImage event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }

  Future<void> _onTakePhoto(
    TakePhoto event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (event.numberFile == 1) {
        emit(state.copyWith(file1: File(image.path), formKey: formKey));
      } else if (event.numberFile == 2) {
        emit(state.copyWith(file2: File(image.path), formKey: formKey));
      }
    }
  }

  Future<void> _onSubmit(
    AdminProductUpdateSubmit event,
    Emitter<AdminProductUpdateState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    List<File> files = [state.file1, state.file2].whereType<File>().toList();
    Resource response = await productsUseCases.update.run(
      state.id,
      state.toProduct(),
      files,
    );
    emit(state.copyWith(response: response, formKey: formKey));
  }
}
