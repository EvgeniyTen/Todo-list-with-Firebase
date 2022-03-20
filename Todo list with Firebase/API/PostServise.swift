//
//  PostServise.swift
//  Todo list with Firebase
//
//  Created by Евгений Тимофеев on 19.03.2022.
//

import UIKit
import Firebase

struct TodoItem {
    var title: String
    var isComplete: Bool
    //var id: Int
    
    init(keyId: String, dictionary: [String: Any]){
        self.title = dictionary["title"] as? String ?? ""
        self.isComplete = dictionary["isComplete"] as? Bool ?? false

    }
}

struct PostService {
    static let shared = PostService()
    let DB_REF = Database.database().reference()
    
        func fetchAllItems (completion: @escaping([TodoItem]) -> Void) {
            var allItems = [TodoItem]()
            DB_REF.child("items").observe(.childAdded) { snapshot in
                fetchSingleItem(id: snapshot.key) { (item) in
                    allItems.append(item)
                    completion(allItems)
                }
        }
            
    }
    func fetchSingleItem(id: String, completion: @escaping(TodoItem) -> Void) {
        DB_REF.child("items").child(id).observeSingleEvent(of: .value) { (snaphot) in
            guard let dictionary = snaphot.value as? [String:Any] else {return}
            let todoItem = TodoItem(keyId: id, dictionary: dictionary)
            completion(todoItem)
            
        }
    }
}
