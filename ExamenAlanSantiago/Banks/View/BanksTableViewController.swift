//
//  BanksTableViewController.swift
//  ExamenAlanSantiago
//
//  Created by Alan Santiago on 03/03/20.
//  Copyright © 2020 Alan Santiago. All rights reserved.
//

import UIKit

class BanksTableViewController: UITableViewController {
    
    private var presenter = BanksPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BankDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "BankDetailCell")
        tableView.separatorStyle = .none
        
        presenter.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attemptToFetchBanks()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.banks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankDetailCell", for: indexPath) as! BankDetailTableViewCell
        cell.setUpWith(bank: presenter.banks?[indexPath.row])
        return cell
    }
 
    

}

extension BanksTableViewController: BanksPresenterDelegate {
    func banksFetched() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func someError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "Ocurrió un error", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}
