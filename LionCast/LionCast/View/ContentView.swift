//
//  ContentView.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import SwiftUI
import LionCastCore

struct ContentView: View {
    var channelStore = ChannelStore()
    
    var body: some View {
        NavigationSplitView {
            ChannelView(channelStore: channelStore)
        } detail: {
            Text("Select a channel")
        }
    }
}

#Preview {
    ContentView()
}
