//
//  Users.swift
//  CoolLog
//
//  Created by Md. Mahmudul Hasan Shohag on 23/8/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let users = try? newJSONDecoder().decode(Users.self, from: jsonData)

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email: String
    let gender: Gender
    let status: Status
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum Status: String, Codable {
    case active = "active"
    case inactive = "inactive"
}

typealias Users = [User]
