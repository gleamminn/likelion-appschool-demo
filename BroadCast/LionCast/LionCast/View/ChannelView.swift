//
//  ChannelView.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import SwiftUI
import LionCastCore

struct ChannelView: View {
    var channelStore: ChannelStore
    
    var channel: Channel {
        channelStore.currentChannel
    }
    
    var body: some View {
        List {
            Section("Recent") {
                NavigationLink {
                    PlayerView(channelStore: channelStore, channelIndex: channelStore.currentChannelIndex)
                } label: {
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: channel.imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Image(channel.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding(.top)
                        
                        Text(channel.name)
                            .font(.subheadline)
                            .lineLimit(nil)
                        
                        if !channel.programName.isEmpty {
                            Text(channel.programName)
                                .font(.headline)
                                .lineLimit(nil)
                        }
                        
                        Spacer()
                        
                        if !channel.nextProgramName.isEmpty {
                            Text("Next")
                                .font(.caption)
                            Text(channel.nextProgramName)
                                .font(.body)
                                .lineLimit(nil)
                            Spacer()
                        }
                    }
                }

            }
            
            Section("Channels") {
                // 배열 안의 구조체들을 몇번째인지 함께 얻어오려면 다음 코드를 참고하세요!
                ForEach(Array(channelStore.channels.enumerated()), id: \.offset) { index, channel in
                    NavigationLink {
                        PlayerView(channelStore: channelStore, channelIndex: index)
                            .onAppear {
                                channelStore.currentChannelIndex = index
                            }
                    } label: {
                        
                        HStack {
                            Image(channel.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120)
                            VStack(alignment: .leading) {
                                Text(channel.name)
                                    .font(.subheadline)
                                Text(channel.programName)
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
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
    NavigationStack {
        ChannelView(channelStore: ChannelStore())
    }
}
