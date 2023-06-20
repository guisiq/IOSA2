//
//  FaceFoodDataSource.swift
//  appcardapio
//
//  Created by Aluno on 04/04/23.
//

import Foundation

class FaceFoodDataSource {
    
    var menuItens: [String: [FoodItem]] = [:]
    
    func loadItens(url: String,
                   success: @escaping([ImageItem])->(),
                   error: @escaping()->()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            
            //Testa se a url existe, senao chama o callback de erro
            guard let url = URL(string: url) else {
                error()
                return
            }
            
            //url é valida, monta a request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            //Executa a request
            URLSession.shared.dataTask(with: request) { data, response, error in
                // Verifica se ocorreu algum erro durante a requisição HTTP
                guard error == nil else {
                    fatalError("Erro na requisição HTTP: \(error!)")
            }
            
            //Verifica se a resposta HTTP é válida e status code entre
            //200 e 299
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                    fatalError("Resposta HTTP inválida")
            }
                
            // Verifica se há dados retornados pela API REST
            guard let data = data else {
                fatalError("Dados inválidos")
            }
            
            // Decodifica os dados retornados em um array de objetos PostResponse
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([ImageItem].self, from: data)
                success(posts)
            } catch {
                fatalError("Erro na decodificação do JSON: \(error)")
            }
            }.resume()
         }
    }
    
    func createMenuItens() -> [String:[FoodItem]] {
        
        let pizzas = FoodItem(foodName: "Pizzas", foodPrice: "R$ 50,00", foodDescription: "As melhores pizzas da regiao norte", foodImage: "Pizzas")
        let files = FoodItem(foodName: "Filés", foodPrice: "R$ 80,00", foodDescription: "Pratos com carnes nobres", foodImage: "Files")
        let massas = FoodItem(foodName: "Massas", foodPrice: "R$ 30,00", foodDescription: "Autenticas massas italianas", foodImage: "Massas")
        
        
        let cervejas = FoodItem(foodName: "Cervejas", foodPrice: "R$ 20,00", foodDescription: "Cervejas artesanais sao as melhoras porque voce toda todas e acha que nao vai fazer mal", foodImage: "Cervejas")
        let vinhos = FoodItem(foodName: "Vinhos", foodPrice: "R$ 105,00", foodDescription: "Vinhos de todas as partes do mundo", foodImage: "Vinhos")
        let refrigerantes = FoodItem(foodName: "Refrigerantes", foodPrice: "R$ 10,00", foodDescription: "Bebidas geladas", foodImage: "Refrigerantes")
        
        let sorvetes = FoodItem(foodName: "Sorvetes", foodPrice: "R$ 5,00", foodDescription: "Sorvetes Gourmet", foodImage: "Sorvetes")
        let tortas = FoodItem(foodName: "Tortas", foodPrice: "R$ 15,00", foodDescription: "Tortas caseiras", foodImage: "Tortas")
        
        menuItens["Pratos"] = [pizzas, files, massas]
        menuItens["Bebidas"] = [cervejas, vinhos, refrigerantes]
        menuItens["Sobremesas"] = [sorvetes, tortas]
        
        return menuItens
        
    }
    
    
    func setData(menuItens:[String: [FoodItem]]) {
        self.menuItens = menuItens
    }
    
    func addItem(nome: String, senha: String) -> [String:[FoodItem]] {
        let tortas = FoodItem(foodName: "Outro", foodPrice: "R$ 15,00", foodDescription: "Tortas caseiras", foodImage: "Tortas")
        menuItens[nome] = [tortas, tortas]
        return menuItens
    }
}
