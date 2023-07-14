import 'package:lfg_bot/core/utils/flavors.dart';
import 'package:nyxx/nyxx.dart';

class BotCore {
  BotCore() {
    _bot = NyxxFactory.createNyxxWebsocket(
      Flavors.d.botToken,
      GatewayIntents.allUnprivileged | GatewayIntents.guildMessages,
    )
      ..registerPlugin(Logging())
      ..registerPlugin(CliIntegration())
      ..registerPlugin(IgnoreExceptions())
      ..connect();
  }

  // stores bot instance
  INyxxWebsocket? _bot;

  /// Returns current active bot (WebSocket).
  ///
  /// Will drop [Exception] if bot isn't initialized.
  INyxxWebsocket get bot => _bot ??= throw Exception('Bot isn\'t initialized');
}
