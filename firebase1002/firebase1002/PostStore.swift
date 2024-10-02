//
//  PostStore.swift
//  firebase1002
//
//  Created by 김수민 on 10/2/24.
//

import Foundation

@Observable
class PostStore {
    @Published var posts: [Post] = []
    
    init() {
        // 초기 데이터 로드
        Task {
            await fetchPosts()
        }
    }
    
    private func fetchPosts() async {
        do {
//            let db = Firestore.firestore()
//            let snapshots = try await db.collection("Posts").getDocuments()
//            
//            var loadedPosts: [Post] = []
//            
//            for document in snapshots.documents {
//                let id: String = document.documentID
//                let docData = document.data()
//                let content: String = docData["content"] as? String ?? ""
//                let author: String = docData["author"] as? String ?? ""
//                let heartCount: Int = docData["heartCount"] as? Int ?? 0
//                
//                let post: Post = Post(id: id, content: content, author: author, heartCount: heartCount)
//                loadedPosts.append(post)
//            }
//            
//            posts = loadedPosts
            
        } catch {
            print("Error fetching posts: \(error)")
        }
    }
    
    func addPost(content: String, author: String) {
        guard !content.isEmpty else { return }
        
        let post = Post(content: content, author: author)
        posts.append(post)
        
        // Firestore에 게시글 추가
        Task {
//            do {
//                let db = Firestore.firestore()
//                try await db.collection("Posts").document(post.id).setData([
//                    "content": post.content,
//                    "author": post.author,
//                    "heartCount": post.heartCount
//                ])
//                print("Post successfully written!")
//            } catch {
//                print("Error writing post: \(error)")
//            }
        }
    }
    
    func updatePost(_ post: Post) {
        // Firestore에 게시글 업데이트
        Task {
//            do {
//                let db = Firestore.firestore()
//                try await db.collection("Posts").document(post.id).setData([
//                    "content": post.content,
//                    "author": post.author,
//                    "heartCount": post.heartCount
//                ])
//                print("Post successfully updated!")
//            } catch {
//                print("Error updating post: \(error)")
//            }
        }
    }
    
    func removePost(_ post: Post) {
        // Firestore에서 게시글 삭제
        Task {
//            do {
//                let db = Firestore.firestore()
//                try await db.collection("Posts").document(post.id).delete()
//                print("Post successfully removed!")
//            } catch {
//                print("Error removing post: \(error)")
//            }
        }
        
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts.remove(at: index)
        }
    }
    
    func likePost(_ post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].heartCount += 1
            updatePost(posts[index]) // 업데이트를 Firestore에 반영
        }
    }
}
