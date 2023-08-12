//
//  TamagotchiCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit

class TamagotchiCollectionViewCell: UICollectionViewCell {

   static let tamaIdentify = "TamagotchiCollectionViewCell"
    
    @IBOutlet var tamagotchiImageView: UIImageView!
    @IBOutlet var tamagotchiNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    func tamaCell(row: TamaCellValue) {
        
        tamagotchiNameLabel.layer.cornerRadius = 5
        tamagotchiNameLabel.layer.borderWidth = 1
       
       tamagotchiNameLabel.font = UIFont.systemFont(ofSize: 15)
        //tamagotchiNameLabel.sizeThatFits(CGSize(width: tamagotchiNameLabel.frame.width, height: tamagotchiNameLabel.frame.height))
        tamagotchiNameLabel.textAlignment = .center
    
        tamagotchiNameLabel.adjustsFontSizeToFitWidth = true
        tamagotchiImageView.image = row.tamaImage
        tamagotchiNameLabel.text = row.tamaName
        
    }
    
    
    
}


