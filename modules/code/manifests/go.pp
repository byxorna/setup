class code::go {
  gvm::version {
    '1.4.2':
      binary => true;
  } ->
  gvm::version {
    '1.7':
      default => true;
  }
}
