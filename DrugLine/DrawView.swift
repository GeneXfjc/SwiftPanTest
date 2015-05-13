//
//  DrawView.swift
//  DrugLine
//
//  Created by fujic on 2015/05/13.
//  Copyright (c) 2015年 Yapp. All rights reserved.
//

import UIKit
//UIViewを継承したクラスを作成する。　作成要領　⒈新しいファイルを追加cocoa touch class その際に継承元を指定しください。あとから変更するのもあり
/*
override func drawRect(rect: CGRect){ }
　
がコメントアウトされているので、ここに
UIBezierPath を使ってコードを記述します。

UIBezierPath のインスタンス生成
起点の設定
帰着点をセット
色の設定
ライン幅
描画セット
*/
class DrawView: UIView {
    override func drawRect(rect: CGRect) {
        let LineLength = 800
        let PixStep = 10
        let BoldStep = 10
        let widthbase = 1
        let widthbold = 2
        //縦横に100本の線を引いてみる
        for x in 0...100{
            var width:NSInteger = widthbase
            //垂直線の始点作成
            var vpoint = CGPointMake(CGFloat(x*PixStep), 0.0)
            //水平線の始点作成
            var hpoint = CGPointMake(0.0, CGFloat(x*PixStep))
            //太線をBoldStep個に設定
            if((x % BoldStep) == 0){
                if( x != 0){
                    width = widthbold
                }
            }
            //縦線描画
            drawvirtical(vpoint, Length: LineLength, LineWidth: width)
            //横線描画
            drawHorizne(hpoint, Length: LineLength, LineWidth: width)
        }
    }
    //１本の　たて描画関数　始点を示せば垂直方向にしか伸びないので 長さ(Length)を指定してください
    private func drawvirtical( Locat:CGPoint,Length:NSInteger,LineWidth:NSInteger){
        
        var EndLocat = CGPointMake(Locat.x, CGFloat(Length)) //Double float キャストはNG そもそもNSIntegerを使おう
        var width = CGFloat( LineWidth)
        drawLine(Locat, EndPoint: EndLocat, LineWidth: width, Color: UIColor.blueColor())

    }
    //１本の　よこ描画関数　始点を示せば水平方向に鹿伸びないので　長さ(Length)を指定する
    private func drawHorizne( Locat:CGPoint,Length:NSInteger,LineWidth:NSInteger){
        
        var EndLocat = CGPointMake(CGFloat(Length),Locat.y) //Double float キャストはNG そもそもNSIntegerを使おう
        var width = CGFloat( LineWidth)
        drawLine(Locat, EndPoint: EndLocat, LineWidth: width, Color: UIColor.redColor())
    }
    //ラインを描画する
    private func drawLine(StartPoint:CGPoint,EndPoint:CGPoint,LineWidth:CGFloat,Color:UIColor){
        // UIBezierPath のインスタンス生成
        var line = UIBezierPath();
        
        // 始点設定
        line.moveToPoint(StartPoint);
        // 終点設定
        line.addLineToPoint(EndPoint);
        
        // 色の設定
        Color.setStroke()
        
        // ライン幅
        line.lineWidth = LineWidth
        
        // 描画
        line.stroke();

    }
    
}
