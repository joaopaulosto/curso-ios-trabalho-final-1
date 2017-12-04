//
//  Utilitario.swift
//  TrabalhoViewFinal
//
//  Created by João Paulo Scopus on 03/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation
import UIKit


extension Date {
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

func showMessage(tipo: UIAlertControllerStyle,titulo: String, mensagem: String, botoes: [String: UIAlertActionStyle], view: UIViewController){
    
    let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: tipo)
    
    for (text, type) in botoes {
        alert.addAction(UIAlertAction(title: text , style: type, handler: nil))
    }
    view.present(alert, animated: true, completion: nil)
}
