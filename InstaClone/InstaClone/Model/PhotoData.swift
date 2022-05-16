// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photo = try? newJSONDecoder().decode(Photo.self, from: jsonData)

import Foundation

struct Photo: Codable {
     let id, author: String
     let width, height: Int
     let url, download_url: String
 }

typealias PhotoData = [Photo]
