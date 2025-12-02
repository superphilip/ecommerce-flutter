import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'AdminProductCreateEvent.dart';
part 'AdminProductCreateState.dart';

class AdminProductCreateBloc
    extends Bloc<AdminProductCreateEvent, AdminProductCreateState> {
  ProductsUseCases productsUseCases;
  AdminProductCreateBloc(this.productsUseCases)
    : super(AdminProductCreateState()) {
    on<AdminProductCreateInitEvent>(_onInitEvent);
    on<AdminProductCreateReset>(_onResetEvent);
    on<AdminProductCretateNameChanged>(_onNameChanged);
    on<AdminProductCretateDescriptionChanged>(_onDescriptionChanged);
    on<AdminProductCretatePriceChanged>(_onPriceChanged);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
    on<AdminProductCreateSubmit>(_onSubmit);
  }

  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  Future<void> _onInitEvent(
    AdminProductCreateInitEvent event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(state.copyWith(idCategory: event.category?.id, formKey: formKey));
  }

  Future<void> _onResetEvent(
    AdminProductCreateReset event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(state.resetForm());
  }

  Future<void> _onNameChanged(
    AdminProductCretateNameChanged event,
    Emitter<AdminProductCreateState> emit,
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
    AdminProductCretateDescriptionChanged event,
    Emitter<AdminProductCreateState> emit,
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
    AdminProductCretatePriceChanged event,
    Emitter<AdminProductCreateState> emit,
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
    Emitter<AdminProductCreateState> emit,
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
    Emitter<AdminProductCreateState> emit,
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
    AdminProductCreateSubmit event,
    Emitter<AdminProductCreateState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    if (state.file1 != null && state.file2 != null) {
      List<File> files = [state.file1!, state.file2!];
      Resource response = await productsUseCases.create.run(
        state.toProduct(),
        files,
      );
      emit(state.copyWith(response: response, formKey: formKey));
    } else {
      emit(state.copyWith(
        response: Error('Selecciona las dos imagenes'),
        formKey: formKey,
      ));
    }
  }
}
