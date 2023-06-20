//
//  CardapioViewController.swift
//  appcardapio
//
//  Created by Aluno on 04/04/23.
//

import UIKit

class CardapioViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewController = LoadingViewController()
    var faceFood = FaceFoodDataSource()
    var dataSource: [String:[FoodItem]]!
    var posts: [ImageItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadItens()
       
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }
    
    func loadItens() {
        faceFood.loadItens(url: "https://akabab.github.io/superhero-api/api/all.json",
                  success: { (items: [ImageItem]) in
                    
                    self.posts = items
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.viewController.loadingOff()
                    }
                  },
                  error: {
                      print("Erro")
                  })
    }
}

extension CardapioViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if posts == nil {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Postagens"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts == nil {
            return 0
        }
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.posts[indexPath.row]
        
        if let cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyCell {
        
            cell.foodTitle.text = item.name
            cell.foodIcon.downloaded(from: item.images.sm)
        
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let controller = segue.destination as! DetalheProdutoViewController
                   
                   guard let indexPath = tableView.indexPathForSelectedRow else {
                       return
                   }
           
                   let item = posts[indexPath.row]
        controller.strDescricao = item.work.occupation
            controller.strTitulo = item.name
        let linkImage = item.images.lg
                   controller.strImage = linkImage
            
            
        }
}
