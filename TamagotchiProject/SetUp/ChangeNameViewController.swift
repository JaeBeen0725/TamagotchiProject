//
//  ChangeNameViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/06.
//

import UIKit

class ChangeNameViewController: UIViewController {
    
    @IBOutlet var bossNameChangeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("name: \(#function)")
        bossNameChangeTextField.placeholder = "대장님의 이름을 정해주세요."
        bossNameChangeTextField.borderStyle = .none
        
        navigationItem.title = "대장님 이름 정하기"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(changeButtonClicked))
        
        
    }
    @IBAction func keyboarddismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("NLifeCycleViewController", #function)
    }
    
    
    @objc
    func changeButtonClicked() {
        
        if let bossName = bossNameChangeTextField.text {
            
            if bossName.count >= 2 && bossName.count <= 6 {
                
                UserDefaults.standard.set(bossName, forKey: "bossName")
                print(UserDefaults.standard.string(forKey: "bossName")!)
                navigationController?.popViewController(animated: true)
            } else  {
                showAlert()
                bossNameChangeTextField.text = ""
            }
        }
        
    }
    
    
    
    
}
