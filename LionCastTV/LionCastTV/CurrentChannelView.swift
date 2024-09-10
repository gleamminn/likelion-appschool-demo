//
//  CurrentChannelView.swift
//  LionCastTV
//
//  Created by Jongwook Park on 9/9/24.
//

import SwiftUI
import LionCastCore

struct CurrentChannelView: View {
    @Environment(ChannelStore.self) var channelStore
    
    var channel: Channel
    
    var body: some View {
        NavigationLink {
             PlayerView(channelIndex: channelStore.currentChannelIndex)
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
                
                VStack(alignment: .leading) {
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
                .padding()
            }
        }
        .buttonStyle(CardButtonStyle())
    }
}
