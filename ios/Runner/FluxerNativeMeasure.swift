import Foundation
import Measure

enum FluxerNativeMeasure {
  private static let maxAttributeLength = 256

  static func reportHandled(
    _ error: Error,
    source: String,
    context: String? = nil
  ) {
    let trimmedSource = source.trimmingCharacters(in: .whitespacesAndNewlines)
    if trimmedSource.isEmpty {
      return
    }
    var attributes: [String: AttributeValue] = [
      "exception.source": .string(trimmedSource),
    ]
    if let context = context?.trimmingCharacters(in: .whitespacesAndNewlines),
      !context.isEmpty
    {
      attributes["exception.context"] = .string(scrubAttribute(context))
    }
    Measure.trackError(MeasureLogRedaction.redactErrorForMeasure(error), attributes: attributes)
  }

  static func reportHandled(
    source: String,
    message: String,
    context: String? = nil
  ) {
    let trimmedMessage = message.trimmingCharacters(in: .whitespacesAndNewlines)
    if trimmedMessage.isEmpty {
      return
    }
    let error = NSError(
      domain: "com.fluxer.native",
      code: 1,
      userInfo: [NSLocalizedDescriptionKey: trimmedMessage]
    )
    reportHandled(error, source: source, context: context)
  }

  static func scrubAttribute(_ value: String) -> String {
    let scrubbed = MeasureLogRedaction.scrubForMeasure(value)
    if scrubbed.count <= maxAttributeLength {
      return scrubbed
    }
    return String(scrubbed.prefix(maxAttributeLength))
  }
}
