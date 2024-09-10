//
//  ChannelStore.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import Foundation
import Observation

@available(macOS 14.0, *)
@available(tvOS 17.0, *)
@available(iOS 17.0, *)
@Observable
public class ChannelStore {
    public var channels: [Channel]
    public var currentChannelIndex: Int
    
    public var currentChannel: Channel {
        channels[currentChannelIndex]
    }
    
    public init() {
        channels = [
            Channel(name: "KBS1", 
                    imageName: "kbs_1tv",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=11&cc=ok",
                    kind: .tv),
            Channel(name: "KBS2",
                    imageName: "kbs_2tv",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=12&cc=ok",
                    kind: .tv),
            Channel(name: "KBS NEWS D",
                    imageName: "kbs_news",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=81",
                    kind: .tv),
            Channel(name: "1FM",
                    imageName: "kbs_radio_ch_24",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=24",
                    kind: .radio),
            Channel(name: "2FM",
                    imageName: "kbs_radio_ch_25",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=25",
                    kind: .radio),
            Channel(name: "1R",
                    imageName: "kbs_radio_ch_21",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=21",
                    kind: .radio),
            Channel(name: "2R",
                    imageName: "kbs_radio_ch_22",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=22",
                    kind: .radio),
            Channel(name: "3R",
                    imageName: "kbs_radio_ch_23",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=23",
                    kind: .radio),
            Channel(name: "한민족",
                    imageName: "kbs_radio_ch_26",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=26",
                    kind: .radio),
        ]
        
        currentChannelIndex = 0
    }
    
    public func updateChannelInfo() async {
        var channel = currentChannel
        
        guard let url = URL(string: channel.siteURL) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let html = String(data: data, encoding: .utf8) ?? ""
//            print(html)
            
            channel.name = html.subStringBetween(
                "<span class=\"channel-txt\">",
                "</span>")
            
            channel.programName = html.subStringBetween(
                "playlist.title = '",
                "';")
            
            channel.nextProgramName = html.subStringBetween(
                "<span class=\"next-program\">",
                "</span>")
            
            channel.videoURL = html.subStringBetween(
                "playlist.file = '",
                "';")
            
            channel.imageURL = html.subStringBetween(
                "playlist.image = '",
                "';")
            
            // 값타입이기 때문에 바뀐 새로운 내용으로 교체 필요!
            channels[currentChannelIndex] = channel
            
            // ----------------
            // channel pragrams
            
            let programStrings: [String] = html.replacingOccurrences(of: "\n" , with:" ").subStringsBetween(
                "<li class=\"",
                "</li>")
            
            for programString in programStrings {
                let channelName: String = programString.subStringBetween(
                    "<span class=\"channel\">",
                    "</span>")
            
                let programName: String = programString.subStringBetween(
                    "<span class=\"tit\">",
                    "</span>")
                
                for (index, channel) in channels.enumerated() {
                    if channel.name == channelName {
                        channels[index].programName = "\(programName)"
                    }
                }
            }
            
            print("channel info : updated")
            
        } catch {
            debugPrint("Error loading \(url): ")
            debugPrint("\(String(describing: error))")
            debugPrint("---")
        }
    }
}
