//
//  Models.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 6/1/23.
//

import Foundation

enum Gender{
    case female, male, other
}

struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let profilePhoto: URL
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinedDate: Date
}

struct UserCount{
    let followers: Int
    let following: Int
    let posts: Int
}


public enum UserPostType: String{
    case photo = "Photo"
    case video = "Video"
}

public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUser: [String]
    let owner: User
}

struct PostLike{
    let userName: String
    let postIdentifier: String
    
}

struct CommentLike{
    let userName: String
    let commentIdentifier: String
    
}

struct PostComment{
    let identifier: String
    let userName: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]

}


