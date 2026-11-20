//
//  SocketConnection.swift
//  Broadcast Extension
//
//  Created by Alex-Dan Bumbu on 22/03/2021.
//  Copyright © 2021 Atlassian Inc. All rights reserved.
//

import Foundation
import OSLog

class SocketConnection: NSObject {
    var didOpen: (() -> Void)?
    var didClose: ((Error?) -> Void)?
    var streamHasSpaceAvailable: (() -> Void)?

    private let filePath: String
    private var socketHandle: Int32 = -1
    private var address: sockaddr_un?

    private var inputStream: InputStream?
    private var outputStream: OutputStream?
    
    private var streamThread: Thread?
    private var streamRunLoop: CFRunLoop?
    @Atomic private var shouldKeepRunning = false

    init?(filePath path: String) {
        filePath = path
        socketHandle = Darwin.socket(AF_UNIX, SOCK_STREAM, 0)

        guard socketHandle != -1 else {
            os_log(.debug, log: broadcastLogger, "failure: create socket")
            return nil
        }
    }

    func open() -> Bool {
        os_log(.debug, log: broadcastLogger, "open socket connection")

        guard FileManager.default.fileExists(atPath: filePath) else {
            os_log(.debug, log: broadcastLogger, "failure: socket file missing")
            return false
        }
      
        guard setupAddress() == true else {
            return false
        }
        
        guard connectSocket() == true else {
            return false
        }

        setupStreams()
        
        inputStream?.open()
        outputStream?.open()

        return true
    }

    func close() {
        unscheduleStreams()

        inputStream?.delegate = nil
        outputStream?.delegate = nil

        inputStream?.close()
        outputStream?.close()
        
        inputStream = nil
        outputStream = nil
    }

    func writeToStream(buffer: UnsafePointer<UInt8>, maxLength length: Int) -> Int {
        outputStream?.write(buffer, maxLength: length) ?? 0
    }
}

extension SocketConnection: StreamDelegate {

    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        case .openCompleted:
            os_log(.debug, log: broadcastLogger, "client stream open completed")
            if aStream == outputStream {
                didOpen?()
            }
        case .hasBytesAvailable:
            if aStream == inputStream {
                var buffer: UInt8 = 0
                let numberOfBytesRead = inputStream?.read(&buffer, maxLength: 1)
                if numberOfBytesRead == 0 && aStream.streamStatus == .atEnd {
                    os_log(.debug, log: broadcastLogger, "server socket closed")
                    close()
                    notifyDidClose(error: nil)
                }
            }
        case .hasSpaceAvailable:
            if aStream == outputStream {
                streamHasSpaceAvailable?()
            }
        case .errorOccurred:
            os_log(.debug, log: broadcastLogger, "client stream error occurred: \(String(describing: aStream.streamError))")
            close()
            notifyDidClose(error: aStream.streamError)

        default:
            break
        }
    }
}

private extension SocketConnection {
  
    func setupAddress() -> Bool {
        var addr = sockaddr_un()
        guard filePath.count < MemoryLayout.size(ofValue: addr.sun_path) else {
            os_log(.debug, log: broadcastLogger, "failure: fd path is too long")
            return false
        }

        _ = withUnsafeMutablePointer(to: &addr.sun_path.0) { ptr in
            filePath.withCString {
                strncpy(ptr, $0, filePath.count)
            }
        }
        
        address = addr
        return true
    }

    func connectSocket() -> Bool {
        guard var addr = address else {
            return false
        }
        
        let status = withUnsafePointer(to: &addr) { ptr in
            ptr.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                Darwin.connect(socketHandle, $0, socklen_t(MemoryLayout<sockaddr_un>.size))
            }
        }

        guard status == noErr else {
            os_log(.debug, log: broadcastLogger, "failure: \(status)")
            return false
        }
        
        return true
    }

    func setupStreams() {
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        CFStreamCreatePairWithSocket(kCFAllocatorDefault, socketHandle, &readStream, &writeStream)

        inputStream = readStream?.takeRetainedValue()
        inputStream?.delegate = self
        inputStream?.setProperty(kCFBooleanTrue, forKey: Stream.PropertyKey(kCFStreamPropertyShouldCloseNativeSocket as String))

        outputStream = writeStream?.takeRetainedValue()
        outputStream?.delegate = self
        outputStream?.setProperty(kCFBooleanTrue, forKey: Stream.PropertyKey(kCFStreamPropertyShouldCloseNativeSocket as String))

        scheduleStreams()
    }
  
    func scheduleStreams() {
        shouldKeepRunning = true

        let scheduled = DispatchSemaphore(value: 0)
        let thread = Thread { [weak self] in
            let runLoop = RunLoop.current
            self?.streamRunLoop = CFRunLoopGetCurrent()
            self?.inputStream?.schedule(in: runLoop, forMode: .common)
            self?.outputStream?.schedule(in: runLoop, forMode: .common)
            scheduled.signal()

            while self?.shouldKeepRunning == true && runLoop.run(mode: .default, before: .distantFuture) {}
        }
        thread.name = "com.fluxer.broadcast.socket"
        thread.qualityOfService = .userInitiated
        streamThread = thread
        thread.start()
        scheduled.wait()
    }
    
    func unscheduleStreams() {
        shouldKeepRunning = false
        streamThread = nil

        guard let runLoop = streamRunLoop else {
            return
        }
        streamRunLoop = nil

        let input = inputStream
        let output = outputStream
        CFRunLoopPerformBlock(runLoop, CFRunLoopMode.commonModes.rawValue) {
            input?.remove(from: .current, forMode: .common)
            output?.remove(from: .current, forMode: .common)
            CFRunLoopStop(runLoop)
        }
        CFRunLoopWakeUp(runLoop)
    }
    
    func notifyDidClose(error: Error?) {
        if didClose != nil {
            didClose?(error)
        }
    }
}
