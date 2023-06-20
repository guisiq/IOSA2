//
//  LoadingViewController.swift
//  appcardapio
//
//  Created by aluno on 06/06/23.
//

import UIKit

class LoadingViewController: UIViewController {

    let loadingView = LoadingView()
    
    override func loadView() {
        self.view = loadingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadingOff(){
        self.dismiss(animated: true) {
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
