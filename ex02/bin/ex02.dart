const version = "0.0.1";

void printUsage() {
  print("Usage: ex02 [options]");
}

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Hello, World");
  } else if (arguments.first == "version") {
    print(" ex02 version $version");
  } else if (arguments.first == "help") {
    printUsage();
  }
}
