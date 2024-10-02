//
//  StickerEditingView.swift
//  Stickers
//
//  Created by Jongwook Park on 2/8/24.
//

import SwiftUI

struct StickerEditingView: View {
    
    @Binding var isShowingSheet: Bool
    var stickerStore: StickerStore
    @Binding var sticker: Sticker
    
    @State private var selectedColor: Color = Sticker.colors[0]
    @State private var memoText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ForEach(Sticker.colors, id:\.self) { color in
                    
                        Button(action: {
                            selectedColor = color
                        }, label: {
                            HStack {
                                if selectedColor == color {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                } else {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(color)
                                        .font(.largeTitle)
                                }
                            }
                            .padding()
                            .background(color)
                        })
                    }
                }
                
                Divider()
                TextEditor(text: $memoText)
                Divider()
            }
            .padding()
            .navigationTitle("Edit Sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        memoText = ""
                        isShowingSheet.toggle()
                    }, label: {
                        Text("Cancel")
                    })
                }
                
                if !memoText.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            sticker.memo = memoText
                            sticker.color = selectedColor
                            sticker.date = Date()
                            
                            stickerStore.updateSticker(sticker)
                            
                            memoText = ""
                            isShowingSheet.toggle()
                        }, label: {
                            Text("Submit")
                        })
                    }
                }
            }
            .onAppear {
                memoText = sticker.memo
                selectedColor = sticker.color
            }
        }
    }
}

#Preview {
    StickerEditingView(isShowingSheet: .constant(true), stickerStore: StickerStore(), sticker: .constant(StickerStore.sampleSticker))
}
