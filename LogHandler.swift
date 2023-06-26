//
//  File.swift
//  Logs
//
//  Created by Bola Ibrahim on 26/06/2023.
//

import Foundation

public protocol LogHandler {
    func handle(message: Any, level: LogManager.LogType, occurrence: Occurrence)
}
