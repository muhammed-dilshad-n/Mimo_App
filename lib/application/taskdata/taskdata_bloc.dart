import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_application_1/presentation/screens/task/model/task_data_model/task_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'taskdata_event.dart';
part 'taskdata_state.dart';
part 'taskdata_bloc.freezed.dart';

@injectable
class TaskDataBloc extends Bloc<TaskdataEvent, TaskDataState> {
  final IAuthRepository _authRepository;
  TaskDataBloc(this._authRepository) : super(TaskDataState()) {
    on<TaskdataEvent>((event, emit) async {
      await event.map(
        addTaskData: (e) async {
          emit(
            state.copyWith(isSubmitting: true),
          );
          final getTask =
              await _authRepository.addTaskdata(taskDataModel: e.taskDataModel);
          emit(getTask.fold(
            (l) => state.copyWith(
                isSubmitting: false, authFailureOrSuccessOption: l),
            (r) => state.copyWith(
              isSubmitting: false,
              taskData: r,
            ),
          ));
        },
        taskDataLoaded: (e) {},
      );
    });
  }
}
