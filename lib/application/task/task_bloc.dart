import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_application_1/presentation/screens/task/model/taskmodel/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

@injectable
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final IAuthRepository _authRepository;
  TaskBloc(this._authRepository) : super(TaskState()) {
    on<TaskEvent>((event, emit) async {
      await event.map(
        addTask: (e) async {
          emit(
            state.copyWith(isSubmitting: true),
          );
          final getTask = await _authRepository.addTask(
            emoji: e.emoji,
            title: e.title,
          );

          emit(getTask.fold(
            (l) => state.copyWith(
                isSubmitting: false, authFailureOrSuccessOption: l),
            (r) => state.copyWith(
              isSubmitting: false,
              tasks: r,
            ),
          ));
        },
        //  loaded: (_Loaded value) {  },
        // updateTask: (e) async {
        //   emit(
        //     state.copyWith(isSubmitting: true),
        //   );
        //   final getTask = await _authRepository.updateTask(
        //     task: task,
        //   );
        //   emit(getTask.fold(
        //     (l) => state.copyWith(
        //       isSubmitting: false,
        //       authFailureOrSuccessOption: some(left(l)),
        //     ),
        //     (r) => state.copyWith(
        //       isSubmitting: false,
        //       authFailureOrSuccessOption: some(right(r)),
        //     ),
        //   ));
        // },
        // deleteTask: (e) async {
        //   emit(
        //     state.copyWith(isSubmitting: true),
        //   );
        //   final getTask = await _authRepository.deleteTask(
        //     task: task,
        //   );
        //   emit(getTask.fold(
        //     (l) => state.copyWith(
        //       isSubmitting: false,
        //       authFailureOrSuccessOption: some(left(l)),
        //     ),
        //     (r) => state.copyWith(
        //       isSubmitting: false,
        //       authFailureOrSuccessOption: some(right(r)),
        //     ),
        //   ));
        // },
        loaded: (e) async {
          emit(
            state.copyWith(isSubmitting: true),
          );
          final getTask = await _authRepository.getTask();
          emit(getTask.fold(
            (l) => state.copyWith(
                isSubmitting: false, authFailureOrSuccessOption: l),
            (r) => state.copyWith(
              isSubmitting: false,
              tasks: r,
            ),
          ));
        },
        updateTask: (value) {},
      );
    });
  }
}
