//
//  SampleUploader.swift
//  Broadcast Extension
//
//  Created by Alex-Dan Bumbu on 22/03/2021.
//  Copyright © 2021 8x8, Inc. All rights reserved.
//

import Foundation
import ReplayKit
import OSLog

private enum Constants {
    static let bufferMaxLength = 10240
    static let maxFrameLongEdge = 1920
    static let jpegQuality: Float = 0.85
}

class SampleUploader {
    
    private static var imageContext = CIContext(options: nil)
    
    @Atomic private var isReady = false
    private var connection: SocketConnection
  
    private var dataToSend: Data?
    private var byteIndex = 0
  
    private let serialQueue: DispatchQueue
    
    init(connection: SocketConnection) {
        self.connection = connection
        self.serialQueue = DispatchQueue(label: "com.fluxer.broadcast.sampleUploader")
      
        setupConnection()
    }
  
    @discardableResult func send(sample buffer: CMSampleBuffer) -> Bool {
        guard isReady else {
            return false
        }
        
        isReady = false

        dataToSend = prepare(sample: buffer)
        byteIndex = 0

        serialQueue.async { [weak self] in
            self?.sendDataChunk()
        }
        
        return true
    }
}

private extension SampleUploader {
    
    func setupConnection() {
        connection.didOpen = { [weak self] in
            self?.isReady = true
        }
        connection.streamHasSpaceAvailable = { [weak self] in
            self?.serialQueue.async {
                if let success = self?.sendDataChunk() {
                    self?.isReady = !success
                }
            }
        }
    }
    
    @discardableResult func sendDataChunk() -> Bool {
        guard let dataToSend = dataToSend else {
            return false
        }
      
        var bytesLeft = dataToSend.count - byteIndex
        var length = bytesLeft > Constants.bufferMaxLength ? Constants.bufferMaxLength : bytesLeft

        length = dataToSend[byteIndex..<(byteIndex + length)].withUnsafeBytes {
            guard let ptr = $0.bindMemory(to: UInt8.self).baseAddress else {
                return 0
            }

            return connection.writeToStream(buffer: ptr, maxLength: length)
        }

        if length > 0 {
            byteIndex += length
            bytesLeft -= length

            if bytesLeft == 0 {
                self.dataToSend = nil
                byteIndex = 0
            }
        } else {
            os_log(.debug, log: broadcastLogger, "writeBufferToStream failure")
        }
      
        return true
    }
    
    func prepare(sample buffer: CMSampleBuffer) -> Data? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(buffer) else {
            os_log(.debug, log: broadcastLogger, "image buffer not available")
            return nil
        }
        
        CVPixelBufferLockBaseAddress(imageBuffer, .readOnly)
        
        let bufferWidth = CVPixelBufferGetWidth(imageBuffer)
        let bufferHeight = CVPixelBufferGetHeight(imageBuffer)
        let scale = min(1.0, CGFloat(Constants.maxFrameLongEdge) / CGFloat(max(bufferWidth, bufferHeight, 1)))
        let width = max(1, Int((CGFloat(bufferWidth) * scale).rounded()))
        let height = max(1, Int((CGFloat(bufferHeight) * scale).rounded()))
        let orientation = CMGetAttachment(buffer, key: RPVideoSampleOrientationKey as CFString, attachmentModeOut: nil)?.uintValue ?? 0

        let scaleTransform = CGAffineTransform(
            scaleX: CGFloat(width) / CGFloat(max(bufferWidth, 1)),
            y: CGFloat(height) / CGFloat(max(bufferHeight, 1))
        )
        let bufferData = self.jpegData(from: imageBuffer, scale: scaleTransform)
        
        CVPixelBufferUnlockBaseAddress(imageBuffer, .readOnly)
        
        guard let messageData = bufferData else {
            os_log(.debug, log: broadcastLogger, "corrupted image buffer")
            return nil
        }
              
        let httpResponse = CFHTTPMessageCreateResponse(nil, 200, nil, kCFHTTPVersion1_1).takeRetainedValue()
        CFHTTPMessageSetHeaderFieldValue(httpResponse, "Content-Length" as CFString, String(messageData.count) as CFString)
        CFHTTPMessageSetHeaderFieldValue(httpResponse, "Buffer-Width" as CFString, String(width) as CFString)
        CFHTTPMessageSetHeaderFieldValue(httpResponse, "Buffer-Height" as CFString, String(height) as CFString)
        CFHTTPMessageSetHeaderFieldValue(httpResponse, "Buffer-Orientation" as CFString, String(orientation) as CFString)
        
        CFHTTPMessageSetBody(httpResponse, messageData as CFData)
        
        let serializedMessage = CFHTTPMessageCopySerializedMessage(httpResponse)?.takeRetainedValue() as Data?
      
        return serializedMessage
    }
    
    func jpegData(from buffer: CVPixelBuffer, scale scaleTransform: CGAffineTransform) -> Data? {
        let source = CIImage(cvPixelBuffer: buffer)

        guard let colorSpace = source.colorSpace else {
            return nil
        }

        let image = source.transformed(by: scaleTransform)
        let options: [CIImageRepresentationOption: Float] = [kCGImageDestinationLossyCompressionQuality as CIImageRepresentationOption: Constants.jpegQuality]

        return SampleUploader.imageContext.jpegRepresentation(of: image, colorSpace: colorSpace, options: options)
    }
}
