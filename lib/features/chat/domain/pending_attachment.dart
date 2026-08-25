import 'package:cross_file/cross_file.dart';

enum PendingAttachmentStatus { pending, uploading, sending, failed }

class PendingAttachment {
  static const Object _unset = Object();

  const PendingAttachment({
    required this.id,
    required this.channelId,
    required this.file,
    required this.filename,
    required this.size,
    required this.contentType,
    required this.status,
    required this.uploadProgress,
    this.previewPath,
    this.width,
    this.height,
    this.flags = 0,
    this.description,
    this.uploadFilename,
    this.multipartUploadId,
    this.fileSizePlan,
    this.contentTypePlan,
    this.duration,
    this.waveform,
    this.galleryAssetId,
  });

  final int id;
  final String channelId;
  final XFile file;
  final String filename;
  final int size;
  final String contentType;
  final PendingAttachmentStatus status;
  final double uploadProgress;
  final String? previewPath;
  final int? width;
  final int? height;
  final int flags;
  final String? description;
  final String? uploadFilename;
  final String? multipartUploadId;
  final int? fileSizePlan;
  final String? contentTypePlan;
  final int? duration;
  final String? waveform;
  final String? galleryAssetId;

  PendingAttachment copyWith({
    int? id,
    String? channelId,
    XFile? file,
    String? filename,
    int? size,
    String? contentType,
    PendingAttachmentStatus? status,
    double? uploadProgress,
    Object? previewPath = _unset,
    Object? width = _unset,
    Object? height = _unset,
    int? flags,
    Object? description = _unset,
    Object? uploadFilename = _unset,
    Object? multipartUploadId = _unset,
    Object? fileSizePlan = _unset,
    Object? contentTypePlan = _unset,
    Object? duration = _unset,
    Object? waveform = _unset,
    Object? galleryAssetId = _unset,
  }) {
    return PendingAttachment(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      file: file ?? this.file,
      filename: filename ?? this.filename,
      size: size ?? this.size,
      contentType: contentType ?? this.contentType,
      status: status ?? this.status,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      previewPath: previewPath == _unset
          ? this.previewPath
          : previewPath as String?,
      width: width == _unset ? this.width : width as int?,
      height: height == _unset ? this.height : height as int?,
      flags: flags ?? this.flags,
      description: description == _unset
          ? this.description
          : description as String?,
      uploadFilename: uploadFilename == _unset
          ? this.uploadFilename
          : uploadFilename as String?,
      multipartUploadId: multipartUploadId == _unset
          ? this.multipartUploadId
          : multipartUploadId as String?,
      fileSizePlan: fileSizePlan == _unset
          ? this.fileSizePlan
          : fileSizePlan as int?,
      contentTypePlan: contentTypePlan == _unset
          ? this.contentTypePlan
          : contentTypePlan as String?,
      duration: duration == _unset ? this.duration : duration as int?,
      waveform: waveform == _unset ? this.waveform : waveform as String?,
      galleryAssetId: galleryAssetId == _unset
          ? this.galleryAssetId
          : galleryAssetId as String?,
    );
  }
}
