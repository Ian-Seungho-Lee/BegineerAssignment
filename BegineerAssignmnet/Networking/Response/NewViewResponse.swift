//
//  NewViewResponse.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import Foundation

struct NewViewResponse {
  let error: String
  let total: String
  let page: String
  let books: [Book]
}

//{
//  "error":"0",
//  "total":"67",
//  "page":"1",
//  "books":[{"title":"Practical MongoDB",
//  "subtitle":"Architecting, Developing, and Administering MongoDB",
//  "isbn13":"9781484206485",
//  "price":"$41.65",
//  "image":"https://itbook.store/img/books/9781484206485.png",
//  "url":"https://itbook.store/books/9781484206485"
//  }]
//}
