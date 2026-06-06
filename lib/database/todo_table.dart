import 'package:drift/drift.dart';

/// Represents a single, actionable task
class ToDoItems extends Table {

  /// Unique database identifier
  IntColumn get id => integer().autoIncrement()();

  /// Primary display name of the task. Max 255 chars
  TextColumn get title => text().withLength(min: 1, max: 255)();

  /// Optional user-provided details
  TextColumn get description => text().nullable()();

  /// Deadline
  DateTimeColumn get dueDate => dateTime().nullable()();

  /// Tracks if the user has checked this task off the UI list
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
}