import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  CredentialBloc() : super(const CredentialState(id: 0, name: '')) {
    on<CredentialChangeEvent>(_handleCredentialChangeEvent);
    on<CredentialInvalidEvent>(_handleCredentialInvalidEvent);
  }

  void _handleCredentialChangeEvent(
      CredentialChangeEvent event, Emitter<CredentialState> emit) {
    if (state.name != event.state!.name && event.state!.name.isEmpty) {
      add(CredentialInvalidEvent(state: null, errorMessage: "Invalid credential name"));
      emit(state);
    } else {
      emit(event.state!);
    }
  }

  void _handleCredentialInvalidEvent(event, Emitter<CredentialState> emit) {
    emit(state);
  }
}

class CredentialEvent {
  final CredentialState? state;
  String? errorMessage;

  CredentialEvent({this.state, this.errorMessage});
}

class CredentialChangeEvent extends CredentialEvent {
  CredentialChangeEvent({CredentialState? state, String? errorMessage}) : super(state: state, errorMessage: errorMessage);
}

class CredentialInvalidEvent extends CredentialEvent {
  CredentialInvalidEvent({CredentialState? state, String? errorMessage}) : super(state: state, errorMessage: errorMessage);
}

class CredentialState extends Equatable {
  final int id;
  final String name;
  final String? url;
  final String? username;
  final String? password;
  final String? bannerUrl;
  final String? note;

  const CredentialState(
      {required this.id,
      required this.name,
      this.url,
      this.username,
      this.password,
      this.bannerUrl,
      this.note});

  @override
  List<Object?> get props => [id];
}
