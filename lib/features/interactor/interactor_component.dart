import 'package:nyxx/nyxx.dart';

import '../../core/utils/services.dart';

/// Trigger reasons for interactor.
enum UpdateEvent {
  /// New activity was added in the system.
  ///
  /// Example: new raid was added.
  activityAdded,

  /// Activity was removed from the system.
  ///
  /// /// Example: raid was removed.
  activityRemoved,

  /// Activity was updated in the system.
  ///
  /// Example: minimum members count was updated / roles updated.
  activityUpdated,
}

/// Base class for all interactor components.
///
/// Interactor component is a part of interactor that handles specific type of interactions.
///
/// See also:
/// * [InteractorCommandComponent] - component that handles slash command interactions.
/// * [InteractorComponentComponent] - component that handles message component interactions.
/// * [InteractorModalComponent] - component that handles modal interactions.
abstract class InteractorComponent<T extends Interaction<Object?>> {
  const InteractorComponent();

  /// This method should be used to build command for this component.
  Future<ApplicationCommandBuilder> build(Services services);

  /// Called when Interactor receives an event that this component should handle.
  Future<void> handle(String commandName, InteractionCreateEvent<T> event, Services services);

  /// Called when Interactor wants to update components.
  ///
  /// If this component should be updated when some of events happened,
  /// then Interactor updates this component in Discord.
  Set<UpdateEvent> get updateWhen => <UpdateEvent>{};

  /// Called when Interactor wants to know if this component should be enabled.
  ///
  /// If this component should be enabled, then Interactor will register this component in Discord.
  /// Otherwise, this component will be ignored or removed from Discord (if it was registered).
  Future<bool> enabledWhen(Services services) => Future.value(true);
}

/// Base class for all interactor command components.
///
/// This component should be used to handle slash command interactions.
abstract class InteractorCommandComponent extends InteractorComponent<ApplicationCommandInteraction> {
  const InteractorCommandComponent();

  @override
  Future<void> handle(
    String commandName,
    InteractionCreateEvent<ApplicationCommandInteraction> event,
    Services services,
  );
}

/// Base class for all interactor message component components.
///
/// This component should be used to handle message component interactions.
abstract class InteractorComponentComponent extends InteractorComponent<MessageComponentInteraction> {
  const InteractorComponentComponent();

  @override
  Future<void> handle(
    String commandName,
    InteractionCreateEvent<MessageComponentInteraction> event,
    Services services,
  );
}

/// Base class for all interactor modal components.
///
/// This component should be used to handle modal interactions.
abstract class InteractorModalComponent extends InteractorComponent<ModalSubmitInteraction> {
  const InteractorModalComponent();

  @override
  Future<void> handle(
    String commandName,
    InteractionCreateEvent<ModalSubmitInteraction> event,
    Services services,
  );
}
