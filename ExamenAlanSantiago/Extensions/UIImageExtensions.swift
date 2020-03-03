//
//  UIImageExtensions.swift
//  ExamenAlanSantiago
//
//  Created by Daniel Alvarez Salas on 03/03/20.
//  Copyright © 2020 Alan Santiago. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
