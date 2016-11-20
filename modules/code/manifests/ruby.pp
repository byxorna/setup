class code::ruby {
  include rvm
  rvm::version {
    '2.3.0':
      default => true;
    ['2.2.4']:
  }
}
