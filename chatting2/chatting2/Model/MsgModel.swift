//
//  MsgModel.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct MsgModel: Codable, Identifiable,Hashable{
   
    @DocumentID var id: String?
    var msg : String
    var user : String
    var timeStamp : Date
    
    enum Codingkeys: String,CodingKey {
        case id
        case msg
        case user
        case timeStamp
    }
    
}
