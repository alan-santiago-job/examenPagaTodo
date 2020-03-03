//
//  BanksPresenter.swift
//  ExamenAlanSantiago
//
//  Created by Alan Santiago on 03/03/20.
//  Copyright © 2020 Alan Santiago. All rights reserved.
//

import Foundation
import Alamofire

class BanksPresenter {
    
    var delegate: BanksPresenterDelegate?
    var banks: [BankAPI]?
    
    private let serviceURL = "https://api.myjson.com/bins/19e11s"//esta variable debería obtenerse de un archivo plist o de otra hoja de código independiente
    
    func attemptToFetchBanks() {
        AF.request(serviceURL).responseData { (response) in
            if let data = response.value {
                let banksArray = try? JSONDecoder().decode([BankAPI].self, from: data)
                
                self.banks = banksArray
                self.delegate?.banksFetched()
                
            } else {
                self.delegate?.someError()
            }
            
        }
        
    }
    
}


protocol BanksPresenterDelegate {
    func banksFetched()
    func someError()
}
