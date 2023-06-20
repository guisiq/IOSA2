//
//  DetalheProdutoViewController.swift
//  appcardapio
//
//  Created by Aluno on 18/04/23.
//

import UIKit

class DetalheProdutoViewController: UIViewController {
    
    var strDescricao:String!
    var strTitulo: String!
    var strImage: String!
    var dataSource: FaceFoodDataSource!
    
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var imgProduto: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitulo.text = strTitulo
        lblDescricao.text = strDescricao
        imgProduto.downloaded(from: strImage)
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
