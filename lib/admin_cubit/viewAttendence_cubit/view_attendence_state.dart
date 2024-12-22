import 'package:kkk/models/all_present.dart';

class ViewAttendenceState {}

final class ViewAttendenceInitial extends ViewAttendenceState {}
final class ViewAttendenceLoading extends ViewAttendenceState {}
final class ViewAttendenceSuccess extends ViewAttendenceState {
    AllPresent allPresent;
    ViewAttendenceSuccess(this.allPresent);
}
final class ViewAttendenceError extends ViewAttendenceState {
  final String MessageError;
  ViewAttendenceError(this.MessageError);
}
