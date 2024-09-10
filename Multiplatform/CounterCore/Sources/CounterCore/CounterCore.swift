// The Swift Programming Language
// https://docs.swift.org/swift-book

import Observation

@available(iOS 17.0, macOS 14.0, tvOS 17.0, visionOS 1.0, *)
@Observable public class Counter {
    public private(set) var count: Int = 0
    
    public init() {
        // nothing
    }
    
    public func increase() {
        guard count < Int.max else {
            return
        }
        
        count += 1
    }
    
    public func decrease() {
        guard count > 0 else {
            return
        }
        
        count -= 1
    }
    
    public func reset() {
        count = 0
    }
}
