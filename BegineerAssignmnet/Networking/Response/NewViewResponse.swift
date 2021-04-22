//
//  NewViewResponse.swift
//  BegineerAssignmnet
//
//  Created by Ian on 2021/04/22.
//

import Foundation


// 이거 아님요 그리고 Response가 달라서 다르게 써야겠네요..
// XXXXX 아래것이 맞다
struct NewViewResponse: Decodable {
  let error: String
  let total: String
  let page: String
  let books: [Book]
}

struct NewBookResponseType<T>: Decodable where T: Decodable {
  let error: String
  let total: String
  let books: [T]
}


// 밑에 Search Response임
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
