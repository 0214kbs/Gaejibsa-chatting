//
//  chattingView.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import Foundation
import SwiftUI
import Firebase

struct Message{
    let sender: String
    let body: String
}

let db = Firestore.firestore()
var message: [Message] = []


