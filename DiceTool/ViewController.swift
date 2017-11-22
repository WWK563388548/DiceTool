//
//  ViewController.swift
//  DiceTool
//
//  Created by wwk on 2017/11/21.
//  Copyright © 2017年 wwk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    // Create a constant array for name of dice pictures
    let dicePicturesArray = ["Dice1", "Dice2", "Dice3", "Dice4", "Dice5", "Dice6"]
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBAction func rollDiceButton(_ sender: UIButton) {
        updateDiceImage()
    }
    
    // This function will run on load time
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // This will change dice pictures every time when restart app
        updateDiceImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Define a function to optimize code
    func updateDiceImage() {
        // Generate random number when someone click the "Roll" button
        // arc4random_uniform() belongs to UIKit, eg. 若输入8, 就会生成0～7的随机数
        // Type casting
        // Generate random number by arc4random_uniform(输入的数字上限是32位的整形数字)
        // Generate random number according to length of array
        randomDiceIndex1 = Int(arc4random_uniform(UInt32(dicePicturesArray.count)))
        randomDiceIndex2 = Int(arc4random_uniform(UInt32(dicePicturesArray.count)))
        // 调用UIImageView的属性和方法, 使用UIImage()方法
        diceImageView1.image = UIImage(named: dicePicturesArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: dicePicturesArray[randomDiceIndex2])
    }
    
    // 实现摇一摇功能
    // 在摇一摇手机之后, 改变骰子点数
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImage()
    }


}

