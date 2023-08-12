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
        print("select: \(#function)")
        super.viewDidLoad()
        tata.dataSource = self
        tata.delegate = self
        navigationItem.title = "설정"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "arrow.clockwise")
       
        print("SLifeCycleViewController", #function)
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

        let selectStoryBoard = UIStoryboard(name: "Select", bundle: nil)
        let selectinfo = selectStoryBoard.instantiateViewController(identifier: "SelectTamagochiViewController") as! SelectTamagochiViewController
        
        if indexPath.row == 0 {
            
            navigationController?.pushViewController(changNameCollectionView, animated: true)
            
        } else if indexPath.row == 1 {
            navigationController?.pushViewController(selectinfo, animated: true)
        } else if indexPath.row == 2 {
            print(indexPath.row)
            let alert = UIAlertController(title: "데이터 초기화", message: "처음부터 다시 키우시겠습니까?", preferredStyle: .alert)

            let cancel = UIAlertAction(title: "아니오!", style: .cancel)
            let ok = UIAlertAction(title: "예!", style: .default , handler: { _ in for key in
                                                                                        
                UserDefaults.standard.dictionaryRepresentation().keys {
                UserDefaults.standard.removeObject(forKey: key.description)
                
               self.navigationController?.popToRootViewController(animated: false)
                
            }
            })
            
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
            
        }
        
        
    }
    
}

    
    

