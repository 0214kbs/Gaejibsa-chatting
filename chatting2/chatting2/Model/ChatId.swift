//
//  ChatId.swift
//  chatting2
//
//  Created by 곽보선 on 2021/08/06.
//

import SwiftUI
import Firebase

struct ChatId{
    let id: String
    let imageUrl: String
    let txt: String
}

extension ChatId{
    static func all() -> [ChatId]{
        return[
            ChatId(id: "김철수", imageUrl: "chat1", txt: "hi"),
            ChatId(id: "나는야짱", imageUrl: "chat2",txt: "안녕하세요"),
            ChatId(id: "럭키엄마", imageUrl: "chat3",txt: "아쉽네요")
        ]
    }
}

struct ChatIdCell: View{
    
    let chatId: ChatId
    
    var body: some View{
        HStack{
            Image(chatId.imageUrl)
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(16)
            
            VStack(alignment: .leading){
                Text(chatId.id).font(.largeTitle)
                Text("\(chatId.txt) ")
            }
        }
    }
}
