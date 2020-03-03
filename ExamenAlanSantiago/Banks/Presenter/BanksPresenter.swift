//
//  BanksPresenter.swift
//  ExamenAlanSantiago
//
//  Created by Alan Santiago on 03/03/20.
//  Copyright © 2020 Alan Santiago. All rights reserved.
//

import Foundation
import Alamofire
import Disk

class BanksPresenter {
    
    var delegate: BanksPresenterDelegate?
    var banks: [BankAPI]?
    private let cacheName = "banks"
    
    private let serviceURL = "https://api.myjson.com/bins/19e11s"//esta variable debería obtenerse de un archivo plist o de otra hoja de código independiente
    
    // solo falta guardar la imagen en local, debería optimizar el modelo para hacerlo, por el momento solo lo dejo indicado con fines prácticos del examen
    func attemptToFetchBanks() {
        if let savedBanks = try? Disk.retrieve(cacheName, from: .caches, as: [BankAPI].self) {
            banks = savedBanks
            delegate?.banksFetched()
            
        } else {

            AF.request(serviceURL).responseData { (response) in
                if let data = response.value {
                    let banksArray = try? JSONDecoder().decode([BankAPI].self, from: data)
                    
                    self.banks = banksArray
                    
                    try? Disk.save(self.banks, to: .caches, as: self.cacheName)
                   
                    self.delegate?.banksFetched()
                    
                } else {
                    self.delegate?.someError()
                }
                
            }
        }
        
    }
    
}


protocol BanksPresenterDelegate {
    func banksFetched()
    func someError()
}
