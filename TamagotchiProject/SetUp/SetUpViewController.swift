//
//  SetUpViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit


class SetUpViewController: UIViewController {
 let settingTableViewCell = SettingTableViewCell()
    @IBOutlet var tata: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tata.dataSource = self
        tata.delegate = self
      
        navigationItem.title = "설정"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName:  "chevron.backward"), style: .plain, target: self, action: #selector(backButton))
    }
    
    @objc
    func backButton(){
        navigationController?.popViewController(animated: true)
    }

   
}

extension SetUpViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTableViewCell.option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell")!
        
        cell.textLabel?.text = settingTableViewCell.option[indexPath.row]
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let changNameStoryBoard = UIStoryboard(name: "SetUp", bundle: nil)
        let changNameCollectionView = changNameStoryBoard.instantiateViewController(identifier: "ChangeNameViewController") as! ChangeNameViewController

//        let selectStoryBoard = UIStoryboard(name: "Select", bundle: nil)
//        let selectinfo = selectStoryBoard.instantiateViewController(identifier: "SelectTamagochiViewController") as! SelectTamagochiViewController
//        
        if indexPath.row == 0 {
            navigationController?.pushViewController(changNameCollectionView, animated: true)
        } else if indexPath.row == 1{
//            navigationController?.pushViewController(selectinfo, animated: true)
        } else if indexPath.row == 2{
            showAlert()
            
            
        }
        
        
    }
    
}

    
    

