//
//  SaveData.swift
//  GameStream
//
//  Created by Enrique Ramos on 15/8/21.
//

import Foundation

class SaveData {
    
    var correo: String = ""
    var contrasena: String = ""
    var nombre: String = ""
    
    func guardarDatos(correo: String, contrasena: String, nombre: String) -> Bool {
        
        print("dentro de la funcion guardar datos obtuve: \(correo) + \(contrasena) + \(nombre)")
        
        UserDefaults.standard.set([correo, contrasena, nombre], forKey: "datosUsuario")
        
        return true
        
    }
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("Estoy en el metodo recuperarDatos y recuperé: \(datosUsuario)")
        
        return datosUsuario
        
    }
    
    func validar(correo: String, contrasena: String) -> Bool {
        
        var correoGuardado = ""
        var contrasenaGurdada = ""
        
        print("Revisando si tengo datos en user defaults con el correo \(correo) y la contrasena \(contrasena)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            contrasenaGurdada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("El correo guardado es \(correoGuardado) y la contrasena guardada es \(contrasenaGurdada)")
            
            if (correo == correoGuardado && contrasena == contrasenaGurdada) {
                
                return true
                
            } else {
                
                return false
            }
            
        } else {
            
           print("No hay datos de usuario guardados en el user defaults")
            
            return false
            
        }
        
    }
    
}
