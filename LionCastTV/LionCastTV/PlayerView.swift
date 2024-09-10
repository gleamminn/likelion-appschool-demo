//
//  PlayerView.swift
//  LionCastTV
//
//  Created by Jongwook Park on 9/9/24.
//

import SwiftUI
import AVKit
import TVUIKit
import LionCastCore

struct Metadata {
    var title: String
    var subtitle: String
    var artwork: String
    var description: String
    var genre: String
    var rating: String
    var copyright: String
}

struct PlayerView: View {
    @Environment(ChannelStore.self) var channelStore
    
    var channelIndex: Int
    
    var channel: Channel {
        channelStore.currentChannel
    }
    
    @State var player = AVPlayer()
    
    var body: some View {
        Group {
            switch channel.kind {
            case .tv:
                VideoPlayer(player: player) 
                    .edgesIgnoringSafeArea(.all)
            case .radio:
                VideoPlayer(player: player) {
                    AsyncImage(url: URL(string: channel.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Image(channel.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .task(id: channelIndex) {
            Task {
                player.pause()
                
                channelStore.currentChannelIndex = channelIndex
                await channelStore.updateChannelInfo()
                
                let urlString = channel.videoURL
                if let url = URL(string: urlString) {
                    let playerItem = AVPlayerItem(url: url)
                    
                    let metadata: Metadata = Metadata(
                        title: channel.programName,
                        subtitle: channel.name,
                        artwork: channel.imageName,
                        description: "\(channel.programName)\nNext | \(channel.nextProgramName)",
                        genre: "",
                        rating: "",
                        copyright: "KBS한국방송"
                    )
                    playerItem.externalMetadata = createMetadataItems(for: metadata)
                    
                    player.replaceCurrentItem(with: playerItem)
                    player.play()
                }
            }
        }
        .onDisappear {
            player.pause()
        }
    }
    
    func createMetadataItems(for metadata: Metadata) -> [AVMetadataItem] {
        let mapping: [AVMetadataIdentifier: Any] = [
            .commonIdentifierTitle: metadata.title,
            .iTunesMetadataTrackSubTitle: metadata.subtitle,
            .commonIdentifierArtwork: UIImage(named: metadata.artwork)?.pngData() as Any,
            .commonIdentifierDescription: metadata.description,
            .iTunesMetadataContentRating: metadata.rating,
            .quickTimeMetadataGenre: metadata.genre,
            .iTunesMetadataCopyright: metadata.copyright
        ]
        return mapping.compactMap { createMetadataItem(for:$0, value:$1) }
    }

    private func createMetadataItem(for identifier: AVMetadataIdentifier,
                                    value: Any) -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.identifier = identifier
        item.value = value as? NSCopying & NSObjectProtocol
        // Specify "und" to indicate an undefined language.
        item.extendedLanguageTag = "und"
        return item.copy() as! AVMetadataItem
    }
}



#Preview {
    PlayerView(channelIndex: 0)
        .environment(ChannelStore())
}
