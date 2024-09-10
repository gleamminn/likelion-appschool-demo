//
//  LionCastTVApp.swift
//  LionCastTV
//
//  Created by Jongwook Park on 9/6/24.
//

import SwiftUI
import LionCastCore

@main
struct LionCastTVApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ChannelStore())
        }
    }
}
