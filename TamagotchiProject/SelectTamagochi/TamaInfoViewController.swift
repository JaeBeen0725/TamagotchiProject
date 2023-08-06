//
//  TamaInfoViewController.swift
//  TamagotchiProject
//
//  Created by Jae Oh on 2023/08/05.
//
import UIKit

class TamaInfoViewController: UIViewController {

  
    @IBOutlet var tamaSelectImage: UIImageView!
    @IBOutlet var tamaSelectLabel: UILabel!
    @IBOutlet var tamaSelectMentTextView: UITextView!
    @IBOutlet var cancleButton: UIButton!
    @IBOutlet var selectButton: UIButton!
    
    var tamaSelectImage1: UIImage = UIImage(named: "1-2")!
    var tamaSelectLabel1: String = "w"
    var tamaSelectMentTextView1: String = "q"
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
      view.isOpaque = false
        tamaSelectImage.image = tamaSelectImage1
        tamaSelectLabel.text = tamaSelectLabel1
       tamaSelectMentTextView.text = tamaSelectMentTextView1
       
    }
    
    @IBAction func cancleButtonClicked(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
    }
    

}
