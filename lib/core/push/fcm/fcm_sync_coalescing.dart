bool fcmSyncShouldRunAnotherPass({
  required bool syncAgain,
  required bool mounted,
}) {
  return syncAgain && mounted;
}
