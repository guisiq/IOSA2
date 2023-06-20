//
//  ViewController.swift
//  appcardapio
//
//  Created by Aluno on 28/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fldPassword: UITextField!
    @IBOutlet weak var fldUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let autoLog = UserDefaults.standard.object(forKey: "autologin") as? Bool{
            if(autoLog){
            if let tabBarController = storyboard?.instantiateViewController(identifier: "tabBar") {
                tabBarController.modalTransitionStyle = .flipHorizontal
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true, completion: nil)
            }
            }
        }
        
        
            
        
    }
    
    @IBAction func handleAutoLogin(_ sender: UISwitch) {
        if(sender.isOn){
            UserDefaults.standard.set(true, forKey: "autologin")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fldUser.resignFirstResponder()
        fldPassword.resignFirstResponder()
    }
   
    @IBAction func tryLogin(_ sender: Any) {
      
        
        if let usuario = fldUser.text, let senha = fldPassword.text {
            if usuario.isEmpty && senha.isEmpty {
                if usuario == "" && senha == "" {
                    if let tabBarController = storyboard?.instantiateViewController(identifier: "tabBar") {
                        tabBarController.modalTransitionStyle = .flipHorizontal
                        tabBarController.modalPresentationStyle = .fullScreen
                        self.present(tabBarController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

