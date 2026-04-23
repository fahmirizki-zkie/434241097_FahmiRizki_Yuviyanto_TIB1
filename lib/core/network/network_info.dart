/// Connectivity contract for offline/online checks.
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Placeholder implementation. Replace with connectivity_plus later.
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async => true;
}
