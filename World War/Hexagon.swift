//
//  File.swift
//  World War
//
//  Created by Benjamin DosSantos Jr. on 7/11/16.
//  Copyright © 2016 Benjamin DosSantos Jr. All rights reserved.
//

import Foundation
import SpriteKit

class Hexagon: SKSpriteNode{
    var hexType = 0;
    
    var width: Int = 0;
    var height: Int = 0;
    var xPos: Int = 0;
    var yPos: Int = 0;
    
    func drawHexagon(view: SKScene){
        let hex: SKShapeNode = SKShapeNode();
        let path = UIBezierPath()
        
        let startX = xPos + (width / 2);
        let startY = yPos + (height / 2);
        
        // Top Left
        path.move(to: CGPoint(x: startX, y: startY))
        
        //Top Left -> Top Right
        path.addLine(to: CGPoint(x: startX + width, y: startY))
        
        // Top Right -> Mid Right
        path.addLine(to: CGPoint(x: startX + (width + (width / 2)), y: startY - (height / 2)))
        
        // Mid Right -> Bot Right
        path.addLine(to: CGPoint(x: startX + width, y: startY - height))

        // Bot Right -> Bot Left
        path.addLine(to: CGPoint(x: startX, y: startY - height))

        // Bot Left -> Mid Left
        path.addLine(to: CGPoint(x: startX - (width - (width / 2)), y: startY - (height / 2)))

        // Mid Left -> Top Left
        path.close()
        
        hex.fillColor = colorSelector();
        hex.strokeColor = UIColor.black();
        
        hex.path = path.cgPath;
        
        view.addChild(hex);
    }
    
    func colorSelector() -> UIColor{
        switch hexType {
            case 0:
                return generateGreenColor();
            default:
                return generateBlueColor();
        }
    }
    
    func generateBlueColor() -> UIColor{
        let randomRed: CGFloat = CGFloat(0.0)
        let randomGreen: CGFloat = CGFloat(0.0)
        let randomBlue: CGFloat = CGFloat(getLevel())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    func generateGreenColor() -> UIColor{
        
        let randomRed: CGFloat = CGFloat(0.0)
        let randomGreen: CGFloat = CGFloat(getLevel());
        let randomBlue: CGFloat = CGFloat(0.0)
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    func getLevel() -> Double{
        var level = Double(arc4random()) / Double(UInt32.max)
        
        if(level < 0.4){
            level = 0.75;
        }
        
        return level;
    }
    
    func setHexType(newHexType: Int){
        hexType = newHexType;
    }
    
    func getHexType() -> Int{
        return hexType;
    }
    
    func setWidth(newWidth: Int){
        width = newWidth;
    }
    
    func getWidth() -> Int{
        return width;
    }
    
    func setHeight(newHeight: Int){
        height = newHeight;
    }
    
    func getHeight() -> Int{
        return height;
    }
    
    func setXPos(newXPos: Int){
        xPos = newXPos;
    }
    
    func getXPos() -> Int{
        return xPos;
    }
    
    func setYPos(newYPos: Int){
        yPos = newYPos;
    }
    
    func getYPos() -> Int{
        return yPos;
    }
}// End of hexagon
