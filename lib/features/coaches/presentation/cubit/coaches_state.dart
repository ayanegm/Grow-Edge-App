part of 'coaches_cubit.dart';

sealed class CoachesState {}

final class CoachesInitial extends CoachesState {}

final class CoachesLoading extends CoachesState {}

final class CoachesSuccess extends CoachesState {
  final List<CoachContainerModel> coaches;
  CoachesSuccess(this.coaches);
}

final class CoachProfileSuccess extends CoachesState {
  final CoachContainerModel coachProfile;
  CoachProfileSuccess(this.coachProfile);
}

final class CoachesFailure extends CoachesState {
  final String message;
  CoachesFailure(this.message);
}
