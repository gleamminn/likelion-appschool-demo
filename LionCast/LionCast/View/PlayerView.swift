//
//  PlayerView.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import SwiftUI
import AVKit
import LionCastCore

struct PlayerView: View {
    var channelStore: ChannelStore
    var channelIndex: Int
    
    var channel: Channel {
        channelStore.currentChannel
    }
    
    @State var player = AVPlayer()
    
    var body: some View {
        Group {
            switch channel.kind {
            case .tv:
    #if os(iOS)
                CustomVideoPlayer(player: $player)
    #elseif os(macOS)
                CustomVideoPlayer(player: $player)
    #endif
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
            }
        }
        .navigationTitle(channel.name)
        .task(id: channelIndex) {
            Task {
                player.pause()
                
                channelStore.currentChannelIndex = channelIndex
                await channelStore.updateChannelInfo()
                
                let urlString = channel.videoURL
                if let url = URL(string: urlString) {
                    player = AVPlayer(url: url)
                    player.play()
                }
            }
        }
        .onDisappear {
            player.pause()
        }
    }
}

#if os(iOS)
struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    @Binding var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = true
        controller.allowsPictureInPicturePlayback = true
        controller.exitsFullScreenWhenPlaybackEnds = true
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
        uiViewController.player = player
    }
}
#elseif os(macOS)
struct CustomVideoPlayer: NSViewRepresentable {
    @Binding var player: AVPlayer
    
    func makeNSView(context: Context) -> AVPlayerView {
        let playerView = AVPlayerView()
        playerView.player = player
        playerView.controlsStyle = .floating
        playerView.showsFullScreenToggleButton = true
        playerView.allowsPictureInPicturePlayback = true
        return playerView
    }
    
    func updateNSView(_ nsView: AVPlayerView, context: Context) {
        nsView.player = self.player
    }
}
#endif

#Preview {
    PlayerView(channelStore: ChannelStore(), channelIndex: 0)
}
