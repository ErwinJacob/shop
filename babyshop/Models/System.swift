//
//  System.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import Foundation
import SwiftUI

class System: ObservableObject{
    
    @Published var user: User?
    @Published var products: [Product] = []
    @AppStorage("email") var email = ""
    @AppStorage("password") var password = ""
    @AppStorage("isLogged") var isLogged: Bool = false

    init(){
        Task{
            await self.fetchData()
        }
    }
    
    @MainActor
    func fetchData() async -> Bool{
        
        do{
            var request = URLRequest(url: URL(string: "http://localhost:8080/api/products/all")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: request)
            print(String(data: data, encoding: .utf8)!)
            self.products = try! JSONDecoder().decode([Product].self, from: data)
            return true
        }
        catch{
            print("ERROR while trying to fetch data")
            return false
        }
        
        
//
//        products.append(Product(id: "0001", name: "Lego Porsche 911", description: """
//        Zestaw LEGO Creator Porsche 911 10295 to coś dla dorosłych fanów motoryzacji, prędkości i składania konstrukcji z klocków LEGO. Zawiera on 1458 elementów, które pomogą zbudować kolekcjonerski model samochodu. Dzięki temu użytkownik ma szansę na rozwój fantastycznej pasji i wzbogacenie swojej kolekcji w bardzo
//""", price: 499.99, stock: 10, pictures: [ UIImage(named: "porsche")!, UIImage(named: "porsche2")!, UIImage(named: "porsche3")! ]))
//
//        products.append(Product(id: "0002", name: "LEGO ICONS Orchidea", description: """
//       Stylowy prezent dla dorosłych, którzy lubią ozdabiać dom
//    Znajdź chwilę na satysfakcjonujący projekt i zbuduj radosną i elegancką ozdobę z orchideą do domu lub biura z zestawu LEGO® Creator Orchidea 10311. Zrób sobie prezent lub podaruj zestaw z orchideą komuś, kto kocha rośliny i kwiaty. Przeorganizuj łodygi, kwiaty, korzenie i liście, by stworzyć niepowtarzalną ozdobę. W zestawie ukryto kilka elementów LEGO® wykorzystanych na nowe sposoby. Model ma ok. 39cm wysokości, 30 cm szerokości i 24 cm głębokości. Zestaw jest częścią kolekcji LEGO zainspirowanej prawdziwymi roślinami i kwiatami.
//""", price: 189.00, stock: 40, pictures: [ UIImage(named: "kwiatek")!, UIImage(named: "kwiatek2")!, UIImage(named: "kwiatek3")! ]))
//
//        products.append(Product(id: "0003", name: "LEGO Baby Yoda", description: """
//Weź do domu ulubieńca Internetu: Dziecko!
//Dziecko, znane też jako „Baby Yoda”, to najbardziej urocze stworzenie w całej galaktyce — a teraz też i w Twoim domu!
//""", price: 379.00, stock: 100, pictures: [ UIImage(named: "babyyoda")!, UIImage(named: "babyjoda2")!, UIImage(named: "babyjoda3")!, UIImage(named: "babyjoda4")!,  ]))
//
//        products.append(Product(id: "0004", name: "LEGO X-Wing™", description: """
//Ekscytujące przygody z myśliwcem Rebeliantów
//Wspaniały, szczegółowy model myśliwca X-wing™ Luke’a Skywalkera z oryginalnej trylogii Star Wars™ zbudowany z klocków LEGO®.
//""", price: 239.99, stock: 40, pictures: [ UIImage(named: "xwing")!, UIImage(named: "xwing2")!, UIImage(named: "xwing3")! ]))
//
//        products.append(Product(id: "0005", name: "LEGO R2-D2™", description: """
//Odkryj całą galaktykę detali w nowej odsłonie klasycznego modelu LEGO® Star Wars™
//Uwielbiany droid powrócił
//Nowa odsłona modelu na rok 2021 pełna jest oryginalnych detali. W środku kryje się nawet miecz świetlny.
//""", price: 1149.99, stock: 42, pictures: [ UIImage(named: "r2d2")!, UIImage(named: "r2d22")!, UIImage(named: "r2d23")! ]))
//
//        products.append(Product(id: "0006", name: "LEGO Potężny Bowser™", description: """
//Model niepokonanego władcy do zbudowania
//Doceń kultowego wroga Super Mario™, budując model Potężnego Bowsera™ z klocków LEGO® do zabawy i postawienia na półce.
//""", price: 1039.99, stock: 42, pictures: [ UIImage(named: "bowser")!, UIImage(named: "bowser2")!, UIImage(named: "bowser3")! ]))
//
//        products.append(Product(id: "0011", name: "Lego Porsche 911", description: """
//        Zestaw LEGO Creator Porsche 911 10295 to coś dla dorosłych fanów motoryzacji, prędkości i składania konstrukcji z klocków LEGO. Zawiera on 1458 elementów, które pomogą zbudować kolekcjonerski model samochodu. Dzięki temu użytkownik ma szansę na rozwój fantastycznej pasji i wzbogacenie swojej kolekcji w bardzo
//""", price: 499.99, stock: 10, pictures: [ UIImage(named: "porsche")!, UIImage(named: "porsche2")!, UIImage(named: "porsche3")! ]))
//
//        products.append(Product(id: "0022", name: "LEGO ICONS Orchidea", description: """
//       Stylowy prezent dla dorosłych, którzy lubią ozdabiać dom
//    Znajdź chwilę na satysfakcjonujący projekt i zbuduj radosną i elegancką ozdobę z orchideą do domu lub biura z zestawu LEGO® Creator Orchidea 10311. Zrób sobie prezent lub podaruj zestaw z orchideą komuś, kto kocha rośliny i kwiaty. Przeorganizuj łodygi, kwiaty, korzenie i liście, by stworzyć niepowtarzalną ozdobę. W zestawie ukryto kilka elementów LEGO® wykorzystanych na nowe sposoby. Model ma ok. 39cm wysokości, 30 cm szerokości i 24 cm głębokości. Zestaw jest częścią kolekcji LEGO zainspirowanej prawdziwymi roślinami i kwiatami.
//""", price: 189.00, stock: 40, pictures: [ UIImage(named: "kwiatek")!, UIImage(named: "kwiatek2")!, UIImage(named: "kwiatek3")! ]))
//
//        products.append(Product(id: "0033", name: "LEGO Baby Yoda", description: """
//Weź do domu ulubieńca Internetu: Dziecko!
//Dziecko, znane też jako „Baby Yoda”, to najbardziej urocze stworzenie w całej galaktyce — a teraz też i w Twoim domu!
//""", price: 379.00, stock: 100, pictures: [ UIImage(named: "babyyoda")!, UIImage(named: "babyjoda2")!, UIImage(named: "babyjoda3")!, UIImage(named: "babyjoda4")!,  ]))
//
//        products.append(Product(id: "0044", name: "LEGO X-Wing™", description: """
//Ekscytujące przygody z myśliwcem Rebeliantów
//Wspaniały, szczegółowy model myśliwca X-wing™ Luke’a Skywalkera z oryginalnej trylogii Star Wars™ zbudowany z klocków LEGO®.
//""", price: 239.99, stock: 40, pictures: [ UIImage(named: "xwing")!, UIImage(named: "xwing2")!, UIImage(named: "xwing3")! ]))
//
//        products.append(Product(id: "0055", name: "LEGO R2-D2™", description: """
//Odkryj całą galaktykę detali w nowej odsłonie klasycznego modelu LEGO® Star Wars™
//Uwielbiany droid powrócił
//Nowa odsłona modelu na rok 2021 pełna jest oryginalnych detali. W środku kryje się nawet miecz świetlny.
//""", price: 1149.99, stock: 42, pictures: [ UIImage(named: "r2d2")!, UIImage(named: "r2d22")!, UIImage(named: "r2d23")! ]))
//
//        products.append(Product(id: "0066", name: "LEGO Potężny Bowser™", description: """
//Model niepokonanego władcy do zbudowania
//Doceń kultowego wroga Super Mario™, budując model Potężnego Bowsera™ z klocków LEGO® do zabawy i postawienia na półce.
//""", price: 1039.99, stock: 42, pictures: [ UIImage(named: "bowser")!, UIImage(named: "bowser2")!, UIImage(named: "bowser3")! ]))

                
        return true
    }
    
    @MainActor
    func login() async -> Bool{
        
        self.user = User(UserID: "100001",
                         email: "email@email.pl",
                         name: "name",
                         surname: "surname",
                         adress: "adress",
                         cart: [],
                         orders: []
        )
        self.isLogged = true
        return true
    }
    
    @MainActor
    func register(confirmPassword: String) async -> Bool{
        
        self.user = User(UserID: "100001",
                         email: "email@email.pl",
                         name: "name",
                         surname: "surname",
                         adress: "adress",
                         cart: [],
                         orders: []
        )
        self.isLogged = true
        
        return true
    }
    
    @MainActor
    func logout() async -> Bool{
        
        self.isLogged = false
        self.user = nil

        return true
    }
}
