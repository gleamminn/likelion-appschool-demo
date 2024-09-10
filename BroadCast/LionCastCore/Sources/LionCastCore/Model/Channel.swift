//
//  Channel.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import Foundation

public enum ChannelKind {
    case tv
    case radio
}

public struct Channel: Identifiable {
    public var id = UUID()
    public var name: String
    public var imageName: String
    public var siteURL: String
    public var kind: ChannelKind
    
    public var programName: String = ""
    public var nextProgramName: String = ""
    public var videoURL: String = ""
    public var imageURL: String = ""
    
}
