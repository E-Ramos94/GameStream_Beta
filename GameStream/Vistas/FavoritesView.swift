//
//  FavoritesView.swift
//  GameStream
//
//  Created by Enrique Ramos on 14/8/21.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    var body: some View {
        
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack{
                
                Text("FAVORITOS").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(.bottom, 9.0)
                
                ScrollView{
                    
                    ForEach(todosLosVideojuegos.gamesInfo, id: \.self) {
                        
                        juego in
                        
                        VStack(spacing: 0) {
                            
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!)).frame(height: 300)
                            
                            Text(juego.title).foregroundColor(.white).padding().frame(maxWidth: .infinity, alignment: .leading).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0).clipShape(RoundedRectangle(cornerRadius: 3.0)))
                        }
                        
                    }
                    
                }.padding(.bottom, 8)
                
            }.padding(.horizontal, 6)
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
