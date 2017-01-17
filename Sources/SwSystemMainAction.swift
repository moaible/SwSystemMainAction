//
//  SystemMainAction.swift
//  SystemMainAction
//
//  Created by moaible on 2017/01/16.
//
//

import Foundation


public typealias SystemAction = () -> Void
fileprivate var fulfillAction: SystemAction = {
    exit(EXIT_SUCCESS)
}
fileprivate var rejectAction: SystemAction = {
    exit(EXIT_FAILURE)
}

public typealias SystemMainAction = (
    _ path: String,
    _ args: [String],
    _ env: [String: String],
    _ fulfill: @escaping SystemAction,
    _ reject: @escaping SystemAction) -> Void

public func systemMain(action: @escaping SystemMainAction) {
    action(
        ProcessInfo.processInfo.arguments.first ?? "",
        Array(ProcessInfo.processInfo.arguments.dropFirst()),
        ProcessInfo.processInfo.environment,
        fulfillAction,
        rejectAction)
    RunLoop.main.run()
}
