//
//  ChannelListView.swift
//  LionCastTV
//
//  Created by Jongwook Park on 9/9/24.
//

import SwiftUI
import LionCastCore

struct ChannelListView: View {
    @Environment(ChannelStore.self) var channelStore
    
    var body: some View {
        List {
            ForEach(Array(channelStore.channels.enumerated()), id: \.offset) { index, channel in
                NavigationLink {
                    PlayerView(channelIndex: index)
                        .onAppear {
                            channelStore.currentChannelIndex = index
                        }
                } label: {
                    
                    HStack {
                        Image(channel.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                        VStack(alignment: .leading) {
                            Text(channel.name)
                                .font(.subheadline)
                            Text(channel.programName)
                                .font(.headline)
                        }
                    }
                }
                .buttonStyle(CardButtonStyle())
            }
        }
    }
}
