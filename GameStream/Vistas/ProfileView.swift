//
//  ProfileView.swift
//  GameStream
//
//  Created by Enrique Ramos on 15/8/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Lorem"
    
    @State var imagenPerfil: UIImage = UIImage(named: "perfilejemplo")!
    
    var body: some View {
        
        ZStack {
            Color("marine").ignoresSafeArea().navigationBarHidden(true).navigationBarBackButtonHidden(true)
            
            VStack {
                
                Text("Perfil").fontWeight(.bold).foregroundColor(.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center).padding()
                
                VStack{
                    
                    Image(uiImage: imagenPerfil).resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118).clipShape(Circle())
                    
                    Text(nombreUsuario).fontWeight(.bold).foregroundColor(.white)
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes").fontWeight(.bold).foregroundColor(.white).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading, 18)
                
                ModuloAjustes()
                
                Spacer()
                
            }
            
        }.onAppear(
        
            perform: {
                
                if returnUiImage(named: "fotoperfil") != nil {
                    
                    imagenPerfil = returnUiImage(named: "fotoperfil")!
                    
                } else {
                    
                    print("No se encontró foto de perfil guardada en el dispositivo")
                    
                }
                
                print("Revisando si tengo datos de usuario en mis usersDefault")
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                    
                    nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                    
                } else {
                    
                    print("No se encontró información del usuario")
                    
                }
            }
        
        )
        
    }
    
    
    func returnUiImage(named: String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
            
        }
        
        return nil
        
    }
    
}

struct ModuloAjustes: View {
    
    @State var isToogleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View{
        
        VStack(spacing: 3) {
            
            Button(action: {}, label: {
                
                HStack {
                    
                    Text("Cuenta").foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                    
                }.padding()
                
            }).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {}, label: {
                
                HStack {
                    
                    Text("Notificaciones").foregroundColor(.white)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isToogleOn)
                    
                }.padding()
                
            }).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {isEditProfileViewActive = true}, label: {
                
                HStack {
                    
                    Text("Editar Perfil").foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                    
                }.padding()
                
            }).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            Button(action: {}, label: {
                
                HStack {
                    
                    Text("Califica esta aplicación").foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                    
                }.padding()
                
            }).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 1.0))
            
            NavigationLink(
                destination: EditProfileView(),
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
