//
//  ViewController.swift
//  DrugLine
//
//  Created by fujic on 2015/05/13.
//  Copyright (c) 2015年 Yapp. All rights reserved.
//  ドラッグ（パン）の状態を確認あくまでドラッグ時の移動量がGestureRecognizerで取得できる。座標の変換が必要になる

import UIKit

class ViewController: UIViewController ,UIGestureRecognizerDelegate{

    let MyView  = UIView(frame: CGRectMake(10, 10, 400, 300))
    //let drawView = DrawView(frame: CGRectMake(20, 20, screenWidth-40, screenHeight-140))
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var naviBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //課題１　SubViewをプログラムから追加そのSubViewのイベント(Pan ドラッグ)をこのコントローラーで取得
        var Pan: UIPanGestureRecognizer =
            UIPanGestureRecognizer(target: self, action: "panAction:")//デリゲートメソッドの「：」を忘れやすい)注意
        //本来は
        Pan.delegate = self
        //呼び出しを現在のView.GestureRecognizerに登録
        MyView.addGestureRecognizer(Pan)
        
        //背景を青色に設定
        MyView.backgroundColor = UIColor.blueColor()
        
        //サブビュートして登録
//        self.view.addSubview(MyView)
        
        //課題２　描画UIViewの表示別クラスを定義しそのクラスに描画プログラムを記述します。
        // Screen Size の取得
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        //ToolBarの位置を取得
        let toolbarY = toolBar.frame.height
        println("toolbar.origin \(toolBar.frame.origin)")
        let navibarHeight = naviBar.frame.height
        var drawView = DrawView(frame: CGRectMake(20, navibarHeight+1, screenWidth-40, screenHeight - toolbarY - navibarHeight))
        drawView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(drawView)
        //iphon6 375  665
        //iphon5 320  565
        
    }
    
    func panAction(sender: UIPanGestureRecognizer){
        var flg = true
        if(sender.state == UIGestureRecognizerState.Began){
            println("==== Start =====")
        }else if(sender.state == UIGestureRecognizerState.Changed){
//            println("==== Chang ====")
            flg = false
        }else if(sender.state == UIGestureRecognizerState.Ended){
            println("====  End  ====")
            println()
        }
        if(flg == true){
        var localPoint = sender.locationInView(self.view)
        println("Local ---- \(localPoint) ----")
        var point:CGPoint = sender.translationInView(self.MyView)
        println("View  **** \(point) ****")
    
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

