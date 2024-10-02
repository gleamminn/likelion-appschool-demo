//
//  PostListView.swift
//  firebase1002
//
//  Created by 김수민 on 10/2/24.
//

import SwiftUI

struct PostListView: View {
    var postStore = PostStore()
    var username: String

    var body: some View {
        VStack {
            List {
                ForEach(postStore.posts) { post in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(post.content)
                                .font(.headline)
                            Text("작성자: \(post.author)")
                                .font(.subheadline)
                            Text("날짜: \(post.dateString)")
                                .font(.caption)
                        }
                        Spacer()
                        Button(action: {
                            postStore.likePost(post)
                        }) {
                            Text("❤️ \(post.heartCount)")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        postStore.removePost(postStore.posts[index])
                    }
                })
            }
            .navigationTitle("게시글 목록")
            .navigationBarItems(trailing: Button("새 게시글") {
                // 새 게시글 추가 로직
            })
        }
        .onAppear {
            // 게시글 로드
            Task {
                await postStore.fetchPosts()
            }
        }
    }
}

#Preview {
    PostListView()
}
