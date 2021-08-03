//
//  ContentView.swift
//  chattingList
//
//  Created by 곽보선 on 2021/08/04.
//

import SwiftUI

struct ContentView: View {
    @State var text : String = ""
    
    let chatIds = ChatId.all()

    
    var body: some View {
        
        ZStack{
                            
            VStack(spacing: 0){
                
            //search
            HStack{
                searchBar(text: self.$text)
            }
            .padding()
            
            // chatting list
            List(self.chatIds, id: \.id){ chatId in
                NavigationLink(destination: Text(chatId.id)){
                    ChatIdCell(chatId: chatId)
                }
            }
            
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

