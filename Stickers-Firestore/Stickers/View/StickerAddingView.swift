//
//  StickerAddingView.swift
//  Stickers
//
//  Created by Jongwook Park on 2/8/24.
//

import SwiftUI

struct StickerAddingView: View {
    // 초기화를 시키지 않은 프로퍼티들은
    // 외부에서 init 호출할 때 매개변수로 받아야만 한다
    @Binding var isShowingSheet: Bool // 값 타입은 필요에 따라 Binding을 쓴다
    var stickerStore: StickerStore // 참조타입은 Binding이 필요없다
    
    @State private var selectedColor: Color = Sticker.colors[0]
    @State private var memoText: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
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
            .navigationTitle("New Sticker")
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
                            stickerStore.addSticker(memo: memoText, color: selectedColor)
                            memoText = ""
                            isShowingSheet.toggle()
                        }, label: {
                            Text("Submit")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    // Preview에서 바인딩 값을 매개변수로 넘길 때는
    // .constant라는 고정값을 만들어 보내주면 된다
    StickerAddingView(isShowingSheet: .constant(true), stickerStore: StickerStore())
}
