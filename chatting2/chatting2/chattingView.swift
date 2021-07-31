//
//  chattingView.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

//import SwiftUI
//
//struct chattingView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct chattingView_Previews: PreviewProvider {
//    static var previews: some View {
//        chattingView()
//    }
//}

import Foundation
import SwiftUI
import Firebase

struct Message{
    let sender: String
    let body: String
}

let db = Firestore.firestore()
var message: [Message] = []
