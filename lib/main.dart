Future<String> fetchUserOrder() async {
  // Imagine that this function is fetching user info from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => "Luong Nam");
}

void main() async {
  print("Dang lay du lieu");
  final String name = await fetchUserOrder();
  print(name);
}
