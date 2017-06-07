//
//  AddDooooVC.swift
//  ToDoooo
//
//  Created by Wang Shilong on 6/6/17.
//  Copyright © 2017 Will Wang. All rights reserved.
//

import UIKit

protocol ToDoDelegate {
    func addToDo(txt: String)
}

class AddDooooVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var delegate: ToDoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func addToDo(_ sender: UIButton) {
        if let text = textField.text, let delegate = delegate {
            delegate.addToDo(txt: text)
            dismiss(animated: true, completion: nil)
        }
        
        hideKeyboard()
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
   
}
