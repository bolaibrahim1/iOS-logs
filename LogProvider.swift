//
//  File.swift
//  Logs
//
//  Created by Bola Ibrahim on 26/06/2023.
//

import Foundation

public typealias Occurrence = (file: String, line: UInt, UTC: String)

public protocol LogProvider {}

extension LogProvider {
    public func send(message: @autoclosure () -> Any, level: LogManager.LogType, occurrence: Occurrence) {
        LogManager.send(message: message(), level: level, occurrence: occurrence)
    }
}
