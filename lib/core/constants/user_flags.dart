const int kUserFlagSpammer = 1 << 6;

bool isServerSpammer(int userFlags) {
  return (userFlags & kUserFlagSpammer) != 0;
}
