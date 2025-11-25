import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'ProfileUpdateEvent.dart';
part 'ProfileUpdateState.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  ProfileUpdateBloc(this.authUseCases) : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onInitEvent);
    on<ProfileUpdateNameChanged>(_onNameChanged);
    on<ProfileUpdateLastNameChanged>(_onLastNameChanged);
    on<ProfileUpdatePhoneChanged>(_onPhoneChanged);
    on<ProfileUpdatePickImage>(_onPickImage);
    on<ProfileUpdateTakePhoto>(_onTakePhoto);
    on<ProfileUpdateFormSubmit>(_onFormSubmit);
    on<ProfileUpdateUserSession>(_onUpdateUserSession);
  }

  Future<void> _onInitEvent(
    ProfileUpdateInitEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.user?.id,
        name: BlocFormItem(value: event.user?.name ?? ''),
        lastName: BlocFormItem(value: event.user?.lastName ?? ''),
        phone: BlocFormItem(value: event.user?.phone ?? ''),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onUpdateUserSession(
    ProfileUpdateUserSession event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    AuthResponse authResponse = await authUseCases.getUserSession
        .run(); //Usuario de Session
    authResponse.user.name = event.user.name;
    authResponse.user.lastName = event.user.lastName;
    authResponse.user.phone = event.user.phone;
    authResponse.user.image = event.user.image;
    await authUseCases.saveUserSession.run(authResponse);

  }

  Future<void> _onFormSubmit(
    ProfileUpdateFormSubmit event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));

    Resource response = await authUseCases.updateUser.run(
      state.id,
      state.toUser(),
      state.image,
    );

    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onPickImage(
    ProfileUpdatePickImage event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onTakePhoto(
    ProfileUpdateTakePhoto event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: File(image.path), formKey: formKey));
    }
  }

  Future<void> _onNameChanged(
    ProfileUpdateNameChanged event,
    Emitter<ProfileUpdateState> emit,
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

  Future<void> _onLastNameChanged(
    ProfileUpdateLastNameChanged event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final lastNameValue = event.lastName.value;
    final lastNameError = _validators.textValidator(lastNameValue);
    emit(
      state.copyWith(
        lastName: BlocFormItem(value: lastNameValue, error: lastNameError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPhoneChanged(
    ProfileUpdatePhoneChanged event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final phoneValue = event.phone.value;
    final phoneError = _validators.phoneValidator(phoneValue);
    emit(
      state.copyWith(
        phone: BlocFormItem(value: phoneValue, error: phoneError),
        formKey: formKey,
      ),
    );
  }
}
