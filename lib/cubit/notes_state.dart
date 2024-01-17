abstract class NotesState {}

class NotesInitial extends NotesState {}

class AddNotesLoading extends NotesState {}

class AddNotesSuccess extends NotesState {}

class AddNotesFailure extends NotesState {
  final String errorMessage;

  AddNotesFailure(this.errorMessage);
}

class NotesSuccess extends NotesState {}
