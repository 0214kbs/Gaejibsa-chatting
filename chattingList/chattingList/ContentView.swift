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


//    var body: some View {

//        ZStack{
//
//            VStack(spacing: 0){
//
//                //search
//                HStack{
//                    searchBar(text: self.$text)
//            }
//            .padding()
//
//            // chatting list
//            List(self.chatIds, id: \.id){ chatId in
//                NavigationLink(destination: Text(chatId.id)){
//                    ChatIdCell(chatId: chatId)
//                }
//            }
//
//            }
//
//        }
//    }
    
    var body: some View{
        NavigationView{
            NavigationLink(destination: ContentViewSec()){
//                Text("hi")
                
                VStack(spacing: 0){
                    //search
                    HStack{
                        searchBar(text: self.$text)
                    }
                    .padding()
                    
                    List(self.chatIds, id: \.id){ chatId in
                        NavigationLink(destination: Text(chatId.id)){
                            ChatIdCell(chatId: chatId)
                        }
                    }
                }
                
            }
            .navigationBarTitle("chatting list")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ContentViewSec: View {
    
    var body: some View {
        VStack(){
            Text("chatting Room")
        }
        .navigationBarTitle("hi")
    }
    
}

struct ContentViewSec_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewSec()
    }
}

//struct ContentView: View{
//
//    var body: some View{
//        ZStack{
//            Home()
//        }
//    }
//}
