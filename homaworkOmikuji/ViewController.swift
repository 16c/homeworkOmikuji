//
//  ViewController.swift
//  homaworkOmikuji
//
//  Created by 今川博司 on 2018/01/16.
//  Copyright © 2018年 今川博司. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tap(_ sender: UIButton) {
        msg.text = "あなたの選択は「赤」"
        Alt(choice: "赤")
    }
    
    @IBAction func tap2(_ sender: UIButton) {
        msg.text = "あなたの選択は「黒」"
        Alt(choice: "黒")
    }
    
    func Alt(choice:String) {
        let alert = UIAlertController(title: "今日の運勢は？", message: "\(choice)で当たりますように！", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "選択し直す", style: .default, handler: {ACTION in self.msg.text = "赤　or　黒"}))
        alert.addAction(UIAlertAction(title: "スタート！", style: .default, handler:{action in self.Play(choice: choice)}))
        present(alert, animated: true, completion: nil)
    }
    
    func Play(choice:String) {
        let r = arc4random_uniform(20)
        print(r)
        self.result.textColor = UIColor.white
        for n in 1...r {
            var nn = n % 2
            switch nn {
            case 0:
                self.imageRight.image = UIImage(named:"rh.png")
                self.imageLeft.image = UIImage(named:"red.png")
                self.result.text = "赤"
            case 1:
                self.imageLeft.image = UIImage(named:"lh.png")
                self.imageRight.image = UIImage(named:"blk.png")
                self.result.text = "黒"
            default: break
            }
            print(self.result.text!)
            sleep(UInt32(0.5))
        }
        rslt(choice: choice)
    }
    
    func rslt(choice:String) {
        if self.result.text == choice {
            self.result.textColor = UIColor.black
            self.result.text = "今日は最高な１日です！"
        }else{
            self.result.textColor = UIColor.red
            self.result.text = "クジ"
            self.result.textColor = UIColor.black
            self.result.text = self.result.text! + "けず張切って行こう！"
          }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

