//
//  SystemMainAction.swift
//  SystemMainAction
//
//  Created by moaible on 2017/01/16.
//
//

import Foundation


typealias SystemAction = () -> Void
fileprivate var fulfillAction: SystemAction = {
    exit(EXIT_SUCCESS)
}
fileprivate var rejectAction: SystemAction = {
    exit(EXIT_FAILURE)
}

typealias SystemMainAction = (
    _ path: String,
    _ args: [String],
    _ env: [String: String],
    _ fulfill: SystemAction,
    _ reject: SystemAction) -> Void

func systemMain(action: SystemMainAction) {
    action(
        ProcessInfo.processInfo.arguments.first ?? "",
        Array(ProcessInfo.processInfo.arguments.dropFirst()),
        ProcessInfo.processInfo.environment,
        fulfillAction,
        rejectAction)
    RunLoop.main.run()
}

