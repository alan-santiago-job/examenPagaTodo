//
//  BankDetailTableViewCell.swift
//  ExamenAlanSantiago
//
//  Created by Alan Santiago on 03/03/20.
//  Copyright © 2020 Alan Santiago. All rights reserved.
//

import UIKit

class BankDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var serviceImageImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpWith(bank: BankAPI?) {
        guard bank != nil else {
            return
        }
        nameLbl.text = bank!.bankName
        ageLbl.text = "\(bank!.age)"
        urlLbl.text = bank!.url
        descriptionLbl.text = bank!.description
        if let url = URL(string: bank!.url) {
            serviceImageImg.load(url: url)
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
