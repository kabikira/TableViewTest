//
//  UserModel.swift
//  TableViewTest
//
//  Created by koala panda on 2023/04/04.
//

import Foundation

struct UserModel: Codable {
    var id: Int
    var icon: String?
    var name: String
    var mainText: String
    var image: String?
}
