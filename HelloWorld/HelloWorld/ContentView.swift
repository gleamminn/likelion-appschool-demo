//
//  ContentView.swift
//  HelloWorld
//
//  Created by Jongwook Park on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(labs) { lab in
                    Section("LAB\(lab.index)") {
                        ForEach(lab.friends) { friend in
                            
                            NavigationLink("\(friend.name)") {
                                
                                VStack {
                                    Text("\(friend.name)")
                                        .padding()
                                    
                                    Text("\(friend.country)")
                                    Text("\(friend.country.rawValue)")
                                    
                                    Text("\(friend.country.greeting)")
                                        .padding()
                                }
                                .font(.largeTitle)
                                .navigationTitle("\(friend.name)")
                                
                            }
                        }
                    }
                }
            }
            .navigationTitle("Friends")
            // .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
