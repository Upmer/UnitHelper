//
//  LoggerMachine.swift
//  UnitHelper
//
//  Created by tsuf on 2019/9/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import Foundation

class LoggerMachine {
  static var directory: URL {
    get {
      let fm = FileManager.default
      var directory = fm.urls(for: .cachesDirectory, in: .userDomainMask).first!
      directory.appendPathComponent("LoggerMachine")
      var isDirectory = ObjCBool(true)
      if !fm.fileExists(atPath: directory.path, isDirectory: &isDirectory) {
        do {
          try fm.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
        } catch {
          fatalError("create logger directory failed: \(error)")
        }
      }
      debugPrint(directory.path)
      return directory
    }
  }
  
  static func rewrite(message: String, to file: String) {
    let url = LoggerMachine.directory.appendingPathComponent(file)
    do {
      try message.write(to: url, atomically: true, encoding: .utf8)
    } catch {
      fatalError("rewrite message failed: \(error)")
    }
  }
  
  static func write(message: String, to file: String) {
    let url = LoggerMachine.directory.appendingPathComponent(file)
    var text = LoggerMachine.read(at: file)
    text += "\n"
    text += message
    do {
      try text.write(to: url, atomically: true, encoding: .utf8)
    } catch {
      fatalError("write message failed: \(error)")
    }
  }
  
  static func read(at file: String) -> String {
    let url = LoggerMachine.directory.appendingPathComponent(file)
    guard FileManager.default.fileExists(atPath: url.path) else {
      return ""
    }
    do {
      let text = try String(contentsOf: url)
      return text
    } catch {
      fatalError("read message failed: \(error)")
    }
  }
  
  static func clear(file: String) {
    let url = LoggerMachine.directory.appendingPathComponent(file)
    do {
      try FileManager.default.removeItem(at: url)
    } catch {
      fatalError("clear logger file failed: \(error)")
    }
  }
}
