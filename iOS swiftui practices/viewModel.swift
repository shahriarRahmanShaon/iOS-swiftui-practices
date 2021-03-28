//
//  viewModel.swift
//  iOS swiftui practices
//
//  Created by sergio shaon on 28/3/21.
//

import Foundation
import Combine
public class viewModel : ObservableObject {
    
    @Published var mainModel = model.self
        
    func networking ( _ url : URL){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                if let data = data{
                    let decoder = JSONDecoder()
                    do{
                        let user = try decoder.decode(self.mainModel, from: data)
                        print(user.coord.lat)
                        print(user.coord.lon)
                    }catch{
                        print("could not be done networking")
                    }
                }
            }
        }.resume()
    }
}
