//
//  ContentView.swift
//  GameStream
//
//  Created by Enrique Ramos on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Spacer()
                
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                
                VStack{
                    Image("applogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    
                    InicioYRegistroView()
                }
                
            }.navigationBarHidden(true)
        }
        
    }
}

struct InicioYRegistroView: View {
    
    @State var tipoInicioSesion:Bool = true
    
    var body: some View {
        
        HStack{
            
            //Spacer()
            
            Button("INICIA SESIÓN") {
                
                tipoInicioSesion = true
                
                print("Pantalla inicio sesion")
            }.foregroundColor(tipoInicioSesion ? .white : .gray).font(.title2)
            
            Spacer()
            
            Button("REGÍSTRATE") {
                
                tipoInicioSesion = false
                
                print("Pantalla de registro")
            }.foregroundColor(tipoInicioSesion ? .gray : .white).font(.title2)
            
            //Spacer()
            
        }.padding(.horizontal, 30)
        
        Spacer(minLength: 50)
        
        if tipoInicioSesion == true {
            
            InicioSesionView()
            
        } else {
            
            RegistroView()
            
        }
        
    }
    
}

struct InicioSesionView: View {
    
    @State var correo = ""
    
    @State var contrasena = ""
    
    @State var isPantallaHomeActive = false
    
    @State var isUserWrong = false
    
    
    var body: some View{
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Correo Electrónico").foregroundColor(Color("dark-cian")).fontWeight(.bold)
                
                ZStack(alignment: .leading) {
                    
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo).foregroundColor(.white)
                    
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white).fontWeight(.bold)
                
                ZStack(alignment: .leading) {
                    
                    if contrasena.isEmpty{
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contrasena).foregroundColor(.white)
                    
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("dark-cian")).padding(.bottom, 30)
                
                Button(action: {iniciarSesion(correo: correo, contrasena: contrasena)}, label: {
                    Text("INICIAR SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                }).alert(isPresented: $isUserWrong, content: {
                    
                    Alert(title: Text("Error"), message: Text("Las credenciales son incorrectas. Vuelve a intentarlo"), dismissButton: .default(Text("Ok")))
                    
                }).padding(.bottom, 50)
                
                Text("Inicia sesión con redes sociales").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding()
                
                HStack{
                    Button(action: facebookLogin, label: {
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)))
                    })
                    
                    Button(action: twitterLogin, label: {
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)))
                    })
                }.padding(.horizontal, 10)
                
            }.padding(.horizontal, 20)
            
            NavigationLink(
                destination: Home(),
                isActive: $isPantallaHomeActive,
                label: {
                    EmptyView()
                })
            
            
        }
        
    }
    
    func iniciarSesion(correo: String, contrasena: String) {
        print("Estoy iniciando sesión")
        
        let validar = SaveData()
        
        if (validar.validar(correo: correo, contrasena: contrasena) == true) {
            
            isPantallaHomeActive = true
            
        } else {
            
            isUserWrong = true
            
        }
        
    }
}

func facebookLogin() {
    print("Estoy iniciando sesión con Facebook")
}

func twitterLogin() {
    print("Estoy iniciando sesión con Twitter")
}

struct RegistroView: View {
    
    @State var correo = ""
    
    @State var contrasena = ""
    
    @State var confirmar = ""
    
    var body: some View{
        
        ScrollView {
            
            VStack{
                
                Text("Elige una foto de perfil").fontWeight(.bold).foregroundColor(.white)
                
                Text("Puedes cambiar o eligirla más adelante").font(.footnote).fontWeight(.light).foregroundColor(.gray).padding(.bottom)
                
                Button(action: tomarFoto, label: {
                    
                    ZStack {
                        Image("perfilejemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                        
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                    
                }).padding(.bottom)
                
            }
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    
                    Text("Correo Electrónico *").foregroundColor(Color("dark-cian")).fontWeight(.bold)
                    
                    ZStack(alignment: .leading) {
                        
                        if correo.isEmpty{
                            Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                        }
                        
                        TextField("", text: $correo).foregroundColor(.white)
                        
                    }
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                    
                    Text("Contraseña *").foregroundColor(.white).fontWeight(.bold)
                    
                    ZStack(alignment: .leading) {
                        
                        if contrasena.isEmpty{
                            Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $contrasena).foregroundColor(.white)
                        
                    }
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                    
                    Text("Confirmar Contraseña *").foregroundColor(.white).fontWeight(.bold)
                    
                    ZStack(alignment: .leading) {
                        
                        if confirmar.isEmpty{
                            Text("Vuelve a escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $confirmar).foregroundColor(.white)
                        
                    }
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                    
                }
                
                
                Button(action: registrate, label: {
                    Text("REGÍSTRATE").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                }).padding(.bottom, 50)
                
                Text("Regístrate con redes sociales").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding()
                
                HStack{
                    Button(action: facebookRegister, label: {
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)))
                    })
                    
                    Button(action: twitterRegister, label: {
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)))
                    })
                }.padding(.horizontal, 10)
                
            }.padding(.horizontal, 20)
            
            
        }
        
    }
}

func registrate() {
    print("Te registraste")
}

func facebookRegister() {
    print("Estoy registrandome con Facebook")
}

func twitterRegister() {
    print("Estoy registrandome con Twitter")
}

func tomarFoto() {
    print("Voy a tomar fotografia de perfil")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Image("pantalla2").resizable()
        
        ContentView()
    }
}
