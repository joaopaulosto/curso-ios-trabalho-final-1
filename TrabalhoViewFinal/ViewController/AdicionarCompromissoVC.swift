//
//  AdicionarCompromissoVC.swift
//  TrabalhoViewFinal
//
//  Created by João Paulo Scopus on 03/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit
import os.log

class AdicionarCompromissoVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var swtPronto: UISwitch!
    @IBOutlet weak var tituloCompromisso: UITextField!
    @IBOutlet weak var dataCompromisso: UIDatePicker!
    @IBOutlet weak var detalheCompromisso: UITextView!
    
    var novoCompromisso: Compromisso?
    
   
    @IBOutlet weak var btnSalvar: UIBarButtonItem!
    @IBAction func btnCancelar(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tituloCompromisso.delegate = self
        
        updateSaveButtonState()
    }
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = tituloCompromisso.text ?? ""
        btnSalvar.isEnabled = !text.isEmpty
    }
    
    
    func salvarCompromisso()  {
        guard let titulo = self.tituloCompromisso?.text else {
            showMessage(tipo: UIAlertControllerStyle.alert, titulo: "Novo compromisso", mensagem: "Informe o título", botoes: ["OK": UIAlertActionStyle.default], view: self)
            return
        }
        
        novoCompromisso = Compromisso()
        novoCompromisso!.data = dataCompromisso.date
        novoCompromisso!.descricao = detalheCompromisso?.text ?? ""
        novoCompromisso!.titulo = titulo
        novoCompromisso?.situacao = swtPronto.isOn ? Status.pronto : Status.pendente
        
    }
  

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button == btnSalvar else {
            os_log("O Botao de salvar não foi pressionado. Cancelando", log: OSLog.default, type: .debug)
            return
        }
        salvarCompromisso()    
        
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        btnSalvar.isEnabled = false
    }
   
   
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
 

}
