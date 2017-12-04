//
//  CompromissoBLL.swift
//  TrabalhoViewFinal
//
//  Created by João Paulo Scopus on 03/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation

enum Status {
    case pendente
    case pronto
}

class Compromisso{
    var titulo: String = ""
    var descricao: String = ""
    var data: Date = Date()
    var situacao: Status = Status.pendente
    
}

final class GerenciadorCompromisso {
    
    static let sharedInstance = GerenciadorCompromisso()
    
    
    private init(){}
    
    
    private var listaCompromissos: [String: [Compromisso]] = [:]
    
    public func adiciona(task: Compromisso){
        let data = task.data.string(with: "dd/MM/yyyy")
        
        if listaCompromissos[data] == nil{
            listaCompromissos[data] = [Compromisso]()
        }
        listaCompromissos[data]!.append(task)
        
        
    }
    
    public func meusCompromissos() -> [String: [Compromisso]]{
        return listaCompromissos
    }
    
    public func geradorCompromissos(data: Date, qtde: Int){
        
        for i in 0..<qtde{
            let novoCompromisso = Compromisso()
            novoCompromisso.data = data
            novoCompromisso.descricao = "Compromisso \(i + 1) referente a \(i + 1) coisas"
            novoCompromisso.titulo = "Compromisso \(i + 1)"
            novoCompromisso.situacao = Status.pendente
            adiciona(task: novoCompromisso)
        }
    
    }

}
