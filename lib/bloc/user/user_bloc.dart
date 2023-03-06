import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_manager/models/usuarios.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
    on<DeleteUser>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>(
      (event, emit) {
        if (!state.existUser) return;
        final newAge = state.user!.copyWith(edad: event.age);
        emit(
          UserSetState(newAge),
        );
      },
    );
    on<AddUserProfession>(
      (event, emit) {
        if (!state.existUser) return;
        final newProfession = [...state.user!.profesiones, event.profession];

        final addProfession = state.user!.copyWith(profesiones: newProfession);
        emit(
          UserSetState(addProfession),
        );
      },
    );
  }
}
