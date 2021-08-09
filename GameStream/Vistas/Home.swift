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
            
            Text("Pantalla perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
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
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
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
    
    @State var textoBusqueda = ""
    
    var body: some View{
        
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            VStack {
                 
                Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11.0)
                
                HStack{
                    
                    Button(action: busqueda, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("dark-cian"))
                    })
                    
                    ZStack(alignment: .leading){
                        
                        if textoBusqueda.isEmpty {
                            
                            Text("Buscar un video").foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            
                        }
                        
                        TextField("", text: $textoBusqueda).foregroundColor(.white)
                        
                    }
                    
                }.padding([.top, .leading, .bottom], 11.0).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(Capsule())
                
                ScrollView(showsIndicators: false) {
                    SubModulo()
                }
                
            }.padding(.horizontal, 18)
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
    }
    
    func busqueda() {
        print("El usuario esta buscando \(textoBusqueda)")
    }
    
}

struct SubModulo: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        VStack {
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    
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
                    
                    Button(action: {
                        url = urlVideos[1]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        
                        Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                    
                    Button(action: {
                        url = urlVideos[2]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        
                        Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                    
                    Button(action: {
                        url = urlVideos[3]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        
                        Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                }
                
                
            }
            
            Text("VIDEOS QUE PODRÍAN GUSTARTE").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    Button(action: {
                        url = urlVideos[4]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        
                        Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                    })
                    
                    Button(action: {
                        url = urlVideos[6]
                        print("URL: \(url)")
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
