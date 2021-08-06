//
//  ContentView.swift
//  chatting2
//
//  Created by 곽보선 on 2021/07/30.
//

import SwiftUI


struct ContentView: View {
    
    @State var text : String = ""
    let chatIds = ChatId.all()
    
    var body: some View{
        
        NavigationView{
            NavigationLink(destination: ContentViewSec()){
                
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ContentViewSec: View {

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
