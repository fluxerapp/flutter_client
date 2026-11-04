//
//  SampleHandler.swift
//  Broadcast Extension
//
//  Created by Alex-Dan Bumbu on 04.06.2021.
//

import ReplayKit
import OSLog

let broadcastLogger = OSLog(subsystem: "com.fluxer", category: "Broadcast")
private enum Constants {
    static let appGroupIdentifier = "group.com.fluxer"
}

class SampleHandler: RPBroadcastSampleHandler {

    private var clientConnection: SocketConnection?
    private var uploader: SampleUploader?

    private var frameCount: Int = 0
    private var connectionOpenAttempts: Int = 0
    private var connectTimer: DispatchSourceTimer?

    var socketFilePath: String {
      let sharedContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Constants.appGroupIdentifier)
      if sharedContainer == nil {
        os_log(.error, log: broadcastLogger, "app group container is nil for %{public}s", Constants.appGroupIdentifier)
        return ""
      }
      let socketPath = sharedContainer?.appendingPathComponent("rtc_SSFD").path ?? ""
      os_log(.debug, log: broadcastLogger, "resolved socket path: %{public}s", socketPath)
      return socketPath
    }

    override init() {
      super.init()
        if let connection = SocketConnection(filePath: socketFilePath) {
          clientConnection = connection
          setupConnection()

          uploader = SampleUploader(connection: connection)
        }
        os_log(.debug, log: broadcastLogger, "%{public}s", socketFilePath)
    }

    override func broadcastStarted(withSetupInfo setupInfo: [String: NSObject]?) {
        // User has requested to start the broadcast. Setup info from the UI extension can be supplied but optional.
        frameCount = 0
        connectionOpenAttempts = 0
        os_log(.debug, log: broadcastLogger, "broadcast started")

        DarwinNotificationCenter.shared.postNotification(.broadcastStarted)
        openConnection()
    }

    override func broadcastPaused() {
        // User has requested to pause the broadcast. Samples will stop being delivered.
    }

    override func broadcastResumed() {
        // User has requested to resume the broadcast. Samples delivery will resume.
    }

    override func broadcastFinished() {
        // User has requested to finish the broadcast.
        DarwinNotificationCenter.shared.postNotification(.broadcastStopped)
        connectTimer?.cancel()
        connectTimer = nil
        clientConnection?.close()
    }

    override func processSampleBuffer(_ sampleBuffer: CMSampleBuffer, with sampleBufferType: RPSampleBufferType) {
        switch sampleBufferType {
        case RPSampleBufferType.video:
            frameCount += 1
            if frameCount == 1 {
                os_log(.debug, log: broadcastLogger, "received first video frame")
            }
            uploader?.send(sample: sampleBuffer)
        default:
            break
        }
    }
}

private extension SampleHandler {

    func setupConnection() {
        clientConnection?.didClose = { [weak self] error in
            os_log(.debug, log: broadcastLogger, "client connection did close \(String(describing: error))")

            if let error = error {
                self?.finishBroadcastWithError(error)
            } else {
                self?.finishBroadcastWithError(
                    Self.broadcastError(code: 10001, key: "BROADCAST_STOPPED", english: "Screen sharing stopped.")
                )
            }
        }
    }

    func openConnection() {
        let queue = DispatchQueue(label: "broadcast.connectTimer")
        let timer = DispatchSource.makeTimerSource(queue: queue)
        connectTimer?.cancel()
        connectTimer = timer
        let deadline = DispatchTime.now() + .seconds(10)
        timer.schedule(deadline: .now(), repeating: .milliseconds(100), leeway: .milliseconds(500))
        timer.setEventHandler { [weak self] in
            guard let self else {
                timer.cancel()
                return
            }
            self.connectionOpenAttempts += 1
            if self.clientConnection?.open() == true {
                os_log(.debug, log: broadcastLogger, "socket opened after %{public}d attempts", self.connectionOpenAttempts)
                timer.cancel()
                return
            }
            guard DispatchTime.now() >= deadline else {
                return
            }
            timer.cancel()
            os_log(.error, log: broadcastLogger, "no call to share into after %{public}d attempts", self.connectionOpenAttempts)
            self.finishBroadcastWithError(
                Self.broadcastError(
                    code: 10002,
                    key: "BROADCAST_NO_CALL",
                    english: "Join a call in Fluxer before you share your screen."
                )
            )
        }
        timer.resume()
    }

    static func broadcastError(code: Int, key: String, english: String) -> NSError {
        NSError(
            domain: RPRecordingErrorDomain,
            code: code,
            userInfo: [NSLocalizedDescriptionKey: NativeStrings.text(key, english)]
        )
    }
}
