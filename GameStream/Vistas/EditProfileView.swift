//
//  EditProfileView.swift
//  GameStream
//
//  Created by Enrique Ramos on 15/8/21.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        ZStack {
                            
                            Image("perfilejemplo").resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118).clipShape(Circle())
                            
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                        
                    })
                    
                }.padding(.bottom, 18.0)
                
                ModuloEditar()
                
            }
        }
        
    }
}

struct ModuloEditar: View {
    
    @State var correo: String = ""
    @State var contrasena: String = ""
    @State var nombre: String = ""
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            Text("Correo elecontrónico").foregroundColor(Color("dark-cian")).fontWeight(.bold)
            
            ZStack(alignment: .leading) {
                
                if correo.isEmpty {
                    
                    Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                TextField("", text: $correo).foregroundColor(.white)
                
            }
            
            Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom, 10)
            
            Text("Contraseña").foregroundColor(.white).fontWeight(.bold)
            
            ZStack(alignment: .leading) {
                
                if contrasena.isEmpty {
                    
                    Text("Introduece tu contrseña").font(.caption).foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                SecureField("", text: $contrasena).foregroundColor(.white)
                
            }
            
            Divider().frame(height: 1).background(Color(.white)).padding(.bottom, 10)
            
            Text("Nombre").foregroundColor(.white).fontWeight(.bold)
            
            ZStack(alignment: .leading) {
                
                if nombre.isEmpty {
                    
                    Text("Intriduce tu nombre de usuario").font(.caption).foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                TextField("", text: $nombre).foregroundColor(.white)
                
            }
            
            Divider().frame(height: 1).background(Color(.white)).padding(.bottom, 32)
            
            Button(action: {actulizarDatos()}, label: {
                
                Text("ACTUALIZAR DATOS").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                
            }).padding(.bottom)
            
        }.padding(.horizontal, 42.0)
        
    }
    
    func actulizarDatos() {
        
        let objetoActualizadorDatos = SaveData()
        
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contrasena: contrasena, nombre: nombre)
        
        print("Se guardaron los datos con exito? \(resultado)")
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
