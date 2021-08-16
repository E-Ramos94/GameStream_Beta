//
//  GameView.swift
//  GameStream
//
//  Created by Enrique Ramos on 8/8/21.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url: String
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPubilcacion: String
    var descripcion: String
    var tags: [String]
    var imgsUrl: [String]
    
    var body: some View {
        
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            VStack{
                
                Video(url: url).frame(height: 300)
                
                ScrollView {
                    
                    VideoInfo(titulo: titulo, studio: studio, calificacion: calificacion, anoPubilcacion: anoPubilcacion, descripcion: descripcion, tags: tags).padding(.bottom)
                    
                    Gallery(imgsUrl: imgsUrl)
                    
                    Comentarios()
                    
                    VideosSugerido()
                    
                    
                }.frame(maxWidth: .infinity)
            }
            
        }
    }
}

struct Video: View {
    
    var url: String
    
    var body: some View {
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
        
    }
}

struct VideoInfo: View {
    
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPubilcacion: String
    var descripcion: String
    var tags: [String]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text(titulo).foregroundColor(.white).font(.largeTitle).padding(.leading)
            
            HStack{
                
                Text(studio).foregroundColor(.white).font(.subheadline).padding(.top, 5).padding(.leading)
                
                Text(calificacion).foregroundColor(.white).font(.subheadline).padding(.top, 5)
                
                Text(anoPubilcacion).foregroundColor(.white).font(.subheadline).padding(.top, 5)
                
            }
            
            Text(descripcion).foregroundColor(.white).font(.subheadline).padding(.top, 5).padding(.leading)
            
            HStack{
                
                ForEach(tags, id: \.self){
                    
                    tag in
                    
                    Text("#\(tag)").foregroundColor(.white).font(.subheadline).padding(.top, 4).padding(.leading)
                    
                }
                
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct Gallery: View {
    
    var imgsUrl: [String]
    
    let formaGrid = [
        
        GridItem(.flexible())
        
    ]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("GALERÍA").foregroundColor(.white).font(.title).padding(.leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid, spacing: 8){
                    
                    ForEach(imgsUrl, id: \.self) {
                        
                        imgUrl in
                        
                        //Desplegar imagenes del servidor por medio de url
                        
                        KFImage(URL(string: imgUrl)).resizable().aspectRatio(contentMode: .fill)
                        
                    }
                    
                }
                
            }.frame(height: 180)
            
            
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.bottom)
        
    }
}

struct Comentarios: View {
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("COMENTARIOS").foregroundColor(.white).font(.title).padding(.leading)
            
            VStack {
                
                HStack{
                    
                    Image("perfilejemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80, alignment: .leading).padding(.leading)
                    
                    VStack{
                        
                        Text("Enrique Ramos").foregroundColor(.white).font(.subheadline).fontWeight(.bold).frame(alignment: .leading).padding(.bottom)
                        
                        Text("Hace 7 días").foregroundColor(.white).font(.subheadline).frame(alignment: .leading).padding(.bottom)
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
            VStack {
                
                HStack{
                    
                    Image("perfilejemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80, alignment: .leading).padding(.leading)
                    
                    VStack{
                        
                        Text("Pamela Torres").foregroundColor(.white).font(.subheadline).fontWeight(.bold).frame(alignment: .leading).padding(.bottom)
                        
                        Text("Hace 12 días").foregroundColor(.white).font(.subheadline).frame(alignment: .leading).padding(.bottom)
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
        }
    }
}

struct VideosSugerido: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            Text("JUEGOS SIMILARES").foregroundColor(.white).font(.title).padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    Button(action: {
                        url = urlVideos[4]
                        isPlayerActive = true
                    }, label: {
                        
                        Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                    
                    Button(action: {
                        url = urlVideos[6]
                        isPlayerActive = true
                    }, label: {
                        
                        Image("Grand Theft Auto V").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })

                }
                
                
            }
            
        }
        
        NavigationLink(
            destination: ZStack {
                Color(.black)
                
                VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 420, height: 360, alignment: .center)
            }.ignoresSafeArea(),
            isActive: $isPlayerActive,
            label: {
                EmptyView()
            })
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog",
                 studio: "Sega",
                 calificacion: "E+",
                 anoPubilcacion: "1991",
                 descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
                 tags:["plataformas","mascota"],
                 imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
                 ])
    }
}
