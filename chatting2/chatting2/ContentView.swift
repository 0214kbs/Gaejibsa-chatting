//
//  ContentView.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import SwiftUI


//chatting list
struct ContentView: View {
    
    @State var text : String = ""
    let chatIds = ChatId.all()
    
    var body: some View{
        
        NavigationView{
            NavigationLink(destination: ContentViewSec()){
                
                VStack(spacing: 0){
                    //search bar
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
            .navigationBarTitle("Chatting List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//chatting room
struct ContentViewSec: View {

    //주석된 코드를 통해
    //김철수 누르면 위에 김철수 뜨고
    //나는야짱 누르면 나는야짱 뜨게끔 하려고 했는데 실패
    //해당 코드가 성공하면 "Home.swift"에서 해당 부분 삭제해야됨
    
    //let chatIds = ChatId.all()
    //let name = chatIds.id
    
    var body: some View {
        VStack(){
            Home()
        }
        //.navigationBarTitle(name)
    }
    
}

struct ContentViewSec_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewSec()
    }
}
