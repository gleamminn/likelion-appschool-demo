//
//  ContentView.swift
//  Stickers
//
//  Created by Jongwook Park on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    var stickerStore = StickerStore()
    
    @State private var memoText: String = ""
    
    @State private var isShowingAddSheet: Bool = false
    @State private var isShowingEditSheet: Bool = false
    
    @State private var selectedSticker: Sticker = StickerStore.sampleSticker
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(stickerStore.stickersDataSorted) { sticker in
                    Button(action: {
                        selectedSticker = sticker
                        isShowingEditSheet.toggle()
                    }, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(sticker.memo)")
                                    .font(.title3)
                                    .lineLimit(3)
                                Text("\(sticker.dateString)")
                                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
                            }
                            Spacer()
                        }
                        .padding()
                        .background(sticker.color)
                        .shadow(radius: 1.5)
                        .contextMenu {
                            ShareLink(item: "\(sticker.memo)\n\(sticker.dateString) 작성")
                            //ShareLink(item: URL(string: "https://apple.com")!)
                            
                            Button {
                                stickerStore.removeSticker(sticker)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                    })
                }
            }
            .listStyle(.plain)
            .navigationTitle("Stickers")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    // ToolbarItem의 Content는 View처럼 하나만 인정!
                    Button(action: {
                        isShowingAddSheet.toggle()
                    }, label: {
                        Label("Add new sticker", systemImage: "square.and.pencil")
                    })
                }
            }
            .sheet(isPresented: $isShowingAddSheet, content: {
                StickerAddingView(isShowingSheet: $isShowingAddSheet, stickerStore: stickerStore)
            })
            .sheet(isPresented: $isShowingEditSheet) {
                StickerEditingView(isShowingSheet: $isShowingEditSheet, stickerStore: stickerStore, sticker: $selectedSticker)
            }
            .onAppear {
                Task {
                    await stickerStore.fetchStickers()
                }
            }
            .refreshable {
                Task {
                    await stickerStore.fetchStickers()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
