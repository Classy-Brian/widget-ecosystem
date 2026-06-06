import 'package:drift/drift.dart';

/// Represents a scheduled event
class CalendarEvents extends Table {

  /// Unique database identifier
  IntColumn get id => integer().autoIncrement()();

  /// Primary display name of the event. Max 255 chars
  TextColumn get title => text().withLength(min: 1, max: 255)();

  /// Optional user-provided details
  TextColumn get description => text().nullable()();

  /// Specific day the event occurs
  DateTimeColumn get eventDate => dateTime()();

  /// Specific time of day
  DateTimeColumn get eventTime => dateTime().nullable()();

  /// Toggle flag if the event spans the entire day
  BoolColumn get isAllDay => boolean().withDefault(const Constant(true))();
}