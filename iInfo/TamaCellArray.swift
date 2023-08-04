//
//  TamaArray.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/04.
//

import UIKit

struct TamaCellArray {
    var tamaCellArray = [TamaCellValue(tamaName: "따끔따끔 다마고치", tamaImage: UIImage(named: "1-6")!),
                         TamaCellValue(tamaName: "방실방실 다마고치", tamaImage: UIImage(named: "2-6")!),
                         TamaCellValue(tamaName: "반짝반짝 다마고치", tamaImage: UIImage(named: "3-6")!),
                         TamaCellValue(tamaName: "준비중이에요", tamaImage: UIImage(named: "noImage")!)]
    
    var ouchTama: [UIImage] = [UIImage(named: "1-1")!,UIImage(named: "1-2")!,UIImage(named: "1-3")!,UIImage(named: "1-4")!,UIImage(named: "1-5")!,UIImage(named: "1-6")!,UIImage(named: "1-7")!,UIImage(named: "1-8")!,UIImage(named: "1-9")!]
    
    var coolTama: [UIImage] = [UIImage(named: "2-1")!,UIImage(named: "2-2")!,UIImage(named: "2-3")!,UIImage(named: "2-4")!,UIImage(named: "2-5")!,UIImage(named: "2-6")!,UIImage(named: "2-7")!,UIImage(named: "2-8")!,UIImage(named: "2-9")!]
    
    var twinkleTama: [UIImage] = [UIImage(named: "3-1")!,UIImage(named: "3-2")!,UIImage(named: "3-3")!,UIImage(named: "3-4")!,UIImage(named: "3-5")!,UIImage(named: "3-6")!,UIImage(named: "3-7")!,UIImage(named: "3-8")!,UIImage(named: "3-9")!]
    
}
