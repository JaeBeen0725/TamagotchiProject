//
//  SelectTamagochiViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit


class SelectTamagochiViewController: UIViewController {
var tamaArray = TamaCellArray()
    
    @IBOutlet var tamaSelectCollectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let nib = UINib(nibName: TamagotchiCollectionViewCell.tamaIdentify, bundle: nil)
        tamaSelectCollectionView.register(nib, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.tamaIdentify)
        
        tamaSelectCollectionView.delegate = self
        tamaSelectCollectionView.dataSource = self
        
        selectTamaCollecttionViewLayout()
    }
    

   
    
}



extension SelectTamagochiViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func selectTamaCollecttionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSizeMake(width / 3, width / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        tamaSelectCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamaArray.tamaCellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.tamaIdentify, for: indexPath) as? TamagotchiCollectionViewCell else {
            showAlert()
            return UICollectionViewCell()
        }
        
        let row = tamaArray.tamaCellArray[indexPath.row]
       
        cell.tamaCell(row: row)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let targetStoryBoard = UIStoryboard(name: "Select", bundle: nil)
      let selectVC = targetStoryBoard.instantiateViewController(identifier: "TamaInfoViewController") as! TamaInfoViewController
        
        selectVC.tamaSelectImage1 = tamaArray.tamaImage[indexPath.row]
        selectVC.tamaSelectLabel1 = tamaArray.tamaName[indexPath.row]
        
     
        let navigation = UINavigationController(rootViewController: selectVC)
        navigation.modalPresentationStyle = .fullScreen
       
        navigation.view.isOpaque = false
        present(navigation, animated: true)
    }
   
}



