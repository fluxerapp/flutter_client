const int kMaxAttachmentsPerMessage = 10;
const int kNonPremiumMaxAttachmentBytes = 25 * 1024 * 1024;
const int kPremiumMaxAttachmentBytes = 500 * 1024 * 1024;

/// Fallback when user premium status is unknown.
const int kDefaultMaxAttachmentBytes = kNonPremiumMaxAttachmentBytes;

const int kMultipartUploadConcurrency = 4;
const int kMultipartRequestFixedOverheadBytes = 16 * 1024;
const int kMultipartRequestFileOverheadBytes = 4 * 1024;

int resolveMaxAttachmentFileBytes({required bool isPremium}) {
  return isPremium ? kPremiumMaxAttachmentBytes : kNonPremiumMaxAttachmentBytes;
}
