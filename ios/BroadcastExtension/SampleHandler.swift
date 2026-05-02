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
                // the displayed failure message is more user friendly when using NSError instead of Error
                let JMScreenSharingStopped = 10001
                let customError = NSError(domain: RPRecordingErrorDomain, code: JMScreenSharingStopped, userInfo: [NSLocalizedDescriptionKey: "Screen sharing stopped"])
                self?.finishBroadcastWithError(customError)
            }
        }
    }

    func openConnection() {
        let queue = DispatchQueue(label: "broadcast.connectTimer")
        let timer = DispatchSource.makeTimerSource(queue: queue)
        timer.schedule(deadline: .now(), repeating: .milliseconds(100), leeway: .milliseconds(500))
        timer.setEventHandler { [weak self] in
            self?.connectionOpenAttempts += 1
            guard self?.clientConnection?.open() == true else {
                if let attempts = self?.connectionOpenAttempts, attempts % 10 == 0 {
                    os_log(.debug, log: broadcastLogger, "waiting for socket open, attempts=%{public}d", attempts)
                }
                return
            }
            os_log(.debug, log: broadcastLogger, "socket opened after %{public}d attempts", self?.connectionOpenAttempts ?? 0)

            timer.cancel()
        }

        timer.resume()
    }
}
