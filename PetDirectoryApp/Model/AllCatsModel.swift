//
//  AllCatsModel.swift
//  PetDirectoryApp
//
//  Created by Decagon on 3/29/22.
//

import Foundation

// MARK: - AllCat
struct AllCat: Codable {
   let image: Image?
   let name: String
   
enum CodingKeys: String, CodingKey {
    case image
    case name
  }
}
// MARK: - Image
struct Image: Codable {
   let url: String?
}

