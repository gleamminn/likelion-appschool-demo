//
//  ChannelView.swift
//  LionCastTV
//
//  Created by Jongwook Park on 9/9/24.
//

import SwiftUI
import LionCastCore

struct ChannelView: View {
    @Environment(ChannelStore.self) var channelStore
    
    var channel: Channel {
        channelStore.currentChannel
    }
    
    var body: some View {
        HStack {
            CurrentChannelView(channel: channel)
            ChannelListView()
        }
        .navigationTitle("LionCast")
        .task {
            Task {
                await channelStore.updateChannelInfo()
            }
        }
    }
}

#Preview {
    ChannelView()
        .environment(ChannelStore())
}
