class Resource<T> {
  T? data;
  String? message;
  String? networkError;
  String? unauthorized;

  Resource([this.data, this.message, this.networkError, this.unauthorized]);

  factory Resource.success([T? data]) => Resource(data);
  factory Resource.error([String? message, T? data]) => Resource(data, message);
  factory Resource.networkError([String? message]) => Resource(null, null, message);
  factory Resource.unauthorized([String? message]) {
    return Resource(null, null, null, message);
  }
}