//
//  viewModel.swift
//  iOS swiftui practices
//
//  Created by sergio shaon on 28/3/21.
//

import SwiftUI
import Combine
public class viewModel : ObservableObject {
    @Published private(set) var mainModel: model? // is there any better soltuion available except making this optional?
    @Published var anyCancallable = Set<AnyCancellable>()
     
    
    //MARK:- intent(s)
    func networkingWith_UrlSession ( _ place: String){
        let url =
            URL( string:
                    "https://api.openweathermap.org/data/2.5/weather?q=\(place)&appid=0e467e5c6beceddf2be0be537b297025")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                if let data = data{
                    let decoder = JSONDecoder()
                    
                    do{
                        let user = try decoder.decode(model.self, from: data)
                        DispatchQueue.main.async {
                            self.mainModel = user
                        }
                        
                    }catch{
                        print("could not be done networking")
                    }
                }
            }
        }.resume()
    }
    
    func networkingWith_combine( _ place: String){
        let url =
            URL( string:
                    "https://api.openweathermap.org/data/2.5/weather?q=\(place)&appid=0e467e5c6beceddf2be0be537b297025")
        let decoder = JSONDecoder()
       URLSession.shared.dataTaskPublisher(for: url!)
            .retry(2)
            .map(\.data)
            .decode(type: model.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { user in
                self.mainModel = user
            })
        .store(in: &anyCancallable)
        
    }
}

