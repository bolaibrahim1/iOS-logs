//
//  File.swift
//  Logs
//
//  Created by Bola Ibrahim on 26/06/2023.
//

import Foundation

public class LogManager {
    
    // value of this variable will be changed based on scheme change
    // for ex. in development scheme will be on, and in production scheme will be off
    public static var shouldEnableLogsSharing: Bool = true
    public private(set) static var providers: [LogProvider] = []
    public private(set) static var targets: [LogHandler] = []
    public private(set) static var dateFormat: DateFormatter = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                                                                             timeZone: "UTC",
                                                                             locale: "en_US_POSIX")
    
    class func send(message: @autoclosure () -> Any, level: LogManager.LogType, occurrence: Occurrence) {
        let object = message()
        targets.forEach { $0.handle(message: object, level: level, occurrence: occurrence) }
    }
    
    public class func addHandler(_ target: LogHandler...) {
        self.targets.append(contentsOf: target)
    }
    
    public class func clearHandlers() {
        self.targets.removeAll()
    }
    
    public class func addProvider(_ providers: LogProvider...) {
        self.providers.append(contentsOf: providers)
    }
    
    public class func clearProviders() {
        self.providers.removeAll()
    }
}


public extension LogManager {
    enum LogType: Int, CustomStringConvertible {
        
        case verbose = 0
        case info = 1
        case debug = 2
        case warning = 3
        case error = 4
        
        public var description: String {
            switch self {
            case .verbose:
                return "[VERBOSE]"
            case .info:
                return "[INFO]"
            case .debug:
                return "[DEBUG]"
            case .warning:
                return "[WARNING]"
            case .error:
                return "[ERROR]"
            }
        }
        
        public var emojiDescription: String {
            switch self {
            case .verbose:
                return "☑️"
            case .info:
                return "Ⓜ️"
            case .debug:
                return "✅"
            case .warning:
                return "⚠️"
            case .error:
                return "⛔️"
            }
        }
    }
}
