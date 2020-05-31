//
//  ViewController.swift
//  kadai5.1
//
//  Created by USER on 2020/05/28.
//  Copyright © 2020 shogo.ujiie. All rights reserved.
//
import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var previw1: UIButton!
    @IBOutlet weak var back1: UIButton!
    @IBOutlet weak var next1: UIButton!
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    @IBAction func previw(_ sender: Any) {
        if timer == nil {
            previw1.setTitle("停止",for:UIControl.State.normal)
            
            //UIButtonを無効化
            next1.isEnabled = false
            //UIButtonを無効化
            back1.isEnabled = false
            // タイマーを設定
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            
        } else {
            previw1.setTitle("再生",for:UIControl.State.normal)
            
            //UIButtonを無効化
            next1.isEnabled = true
            //UIButtonを無効化
            back1.isEnabled = true
            
            self.timer.invalidate()
            self.timer = nil
        }
    }
    /// NSTimerによって、一定の間隔で呼び出される関数
    @objc func onTimer(_ timer: Timer) {
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
    }
    
    @IBOutlet weak var imageview: UIImageView!
    @IBAction func next(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    /// 表示している画像の番号
    var dispImageNo = 0
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 画像の名前の配列
        let imageNameArray =   [
            "coffee.jpg",
            "coffee10.jpg",
            "coffee11.jpg",
            "coffee12.jpg"
        ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        imageview.image = image
    }
    @IBAction func back(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()}
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "coffee1.jpg")
        // Image Viewに画像を設定
        imageview.image = image
        
    }
}
