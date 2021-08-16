//
//  Home.swift
//  GameStream
//
//  Created by Enrique Ramos on 7/8/21.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSeleccionado: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado) {
            
            ProfileView()
            .tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            
            GamesView()
            .tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
            
            PantallaHome()
            .tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2)
            
            FavoritesView()
                .tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3)
            
        }.accentColor(.white)
        
    }
    
    init() {
        
        UITabBar.appearance().barTintColor = UIColor(Color("tabbar-color"))
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciando las vistas de home")
        
        
    }
}

struct PantallaHome: View {
    
    var body: some View{
        
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            VStack {
                 
                Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11.0)
                
                
                ScrollView(showsIndicators: false) {
                    SubModulo()
                }
                
            }.padding(.horizontal, 18)
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
    }
    
}

struct SubModulo: View {
    
    @State var textoBusqueda = ""
    @State var isGameInfoEmpty = false
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var anoPubilcacion: String = ""
    @State var descripcion: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    
    
    var body: some View{
        
        VStack {
            
            HStack{
                
                Button(action: {
                        
                    watchGame(name: textoBusqueda)
                    
                    
                }, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("dark-cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    
                    Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                    
                }
                
                ZStack(alignment: .leading){
                    
                    if textoBusqueda.isEmpty {
                        
                        Text("Buscar un video").foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        
                    }
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                    
                }
                
            }.padding([.top, .leading, .bottom], 11.0).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(Capsule())
            
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ZStack{
                
                Button(action: {watchGame(name: "The Witcher 3")}, label: {
                    
                    VStack(spacing: 0) {
                        
                        Image("The Witcher 3").resizable().scaledToFill()
                        
                        Text("The Witcher 3: Wild Hunt").fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0))
                        
                    }
                })
                
                
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42, height: 42)
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            
            Text("CATEGORÍAS SUGERIDAS PARA TI").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    Button(action: {print("Pulse categoria FPS")}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8).fill(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).frame(width: 160, height: 90)
                            
                            VStack {
                                Image("fps").resizable().scaledToFit().frame(width: 42, height: 42)
                                Text("FPS").fontWeight(.bold).foregroundColor(Color("dark-cian"))
                            }
                            
                        }
                    })
                    
                    Button(action: {print("Pulse categoria RPG")}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8).fill(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).frame(width: 160, height: 90)
                            
                            VStack {
                                Image("rpg").resizable().scaledToFit().frame(width: 42, height: 42)
                                Text("RPG").fontWeight(.bold).foregroundColor(Color("dark-cian"))
                            }
                            
                        }
                    })
                    
                    Button(action: {print("Pulse categoria OPEN WORLD")}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8).fill(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).frame(width: 160, height: 90)
                            
                            VStack {
                                Image("openworld").resizable().scaledToFit().frame(width: 42, height: 42)
                                Text("OPEN WORLD").fontWeight(.bold).foregroundColor(Color("dark-cian"))
                            }
                            
                        }
                    })
                    
                }
                
                
            }
            
            Text("RECOMENDADOS PARA TI").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    Button(action: {watchGame(name: "Abzu")}, label: {
                        
                        Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                    
                    Button(action: {watchGame(name: "Crash Bandicoot")}, label: {
                        
                        Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                    
                    Button(action: {watchGame(name: "DEATH STRANDING")}, label: {
                        
                        Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                }
                
                
            }
            
            Text("VIDEOS QUE PODRÍAN GUSTARTE").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    Button(action: {watchGame(name: "Cuphead")}, label: {
                        
                        Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                    
                    Button(action: {watchGame(name: "Grand Theft Auto V")}, label: {
                        
                        Image("Grand Theft Auto V").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })

                }
                
                
            }
            
        }
        
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPubilcacion: anoPubilcacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })
        
    }
    
    func watchGame(name: String) {
        
        juegoEncontrado.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            print("Cantidad E:\(juegoEncontrado.gameInfo.count)")
            
            if juegoEncontrado.gameInfo.count == 0 {
                
                isGameInfoEmpty = true
                
            } else {
                
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPubilcacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
                
            }
            
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
