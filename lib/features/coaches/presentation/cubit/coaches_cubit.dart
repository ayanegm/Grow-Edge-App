import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:grow_edge_app/features/coaches/data/models/coach_container_model.dart';

part 'coaches_state.dart';

class CoachesCubit extends Cubit<CoachesState> {
  CoachesCubit() : super(CoachesInitial());
  getCoaches() async {
    emit(CoachesLoading());
    final Dio dio = Dio();
    final Response response = await dio.get(
      'https://dev.growedge.net/api/website/coaches',
    );
    final dynamic data = response.data;
    List<CoachContainerModel> coaches = [];
    for (var coachMap in data['data']) {
      coaches.add(CoachContainerModel.fromJson(coachMap));
    }
    emit(CoachesSuccess(coaches));
  }

  getCoachProfile(int coachId) async {
    emit(CoachesLoading());
    final Dio dio = Dio();
    final Response response = await dio.get(
      'https://dev.growedge.net/api/website/coachProfile/$coachId',
    );
    final dynamic data = response.data;
    CoachContainerModel coachProfile = CoachContainerModel.fromJson(
      data['data'],
    );
    emit(CoachProfileSuccess(coachProfile));
  }
}
