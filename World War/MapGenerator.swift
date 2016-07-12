//
//  MapGenerator.swift
//  World War
//
//  Created by Benjamin DosSantos Jr. on 7/11/16.
//  Copyright © 2016 Benjamin DosSantos Jr. All rights reserved.
//

import Foundation
import SpriteKit

class MapGenerator{
    
    var hexArray = [[Hexagon]]()
    
    var xIndex = 0;
    var yIndex = 0;
    
    func generateRow(view: SKScene, xPos: Int, yPos: Int, width: Int, height: Int){
        var up = false;
        
        var yLevel = 0;
        
        var hexRow = [Hexagon]();
        
        for point in 0...(Int(view.frame.width) / width){
            let hex = Hexagon();
            
            let offset = (point * (width + (width / 2)))
            
            if(up){ yLevel = height / 2; } else { yLevel = 0; }
            
            up = !up;
            
            hex.setXPos(newXPos: xPos + offset);
            hex.setYPos(newYPos: yPos + yLevel);
            hex.setWidth(newWidth: width);
            hex.setHeight(newHeight: height);
            
            hexRow.append(hex);
            
            xIndex = xIndex + 1;
        }
        xIndex = 0;
        hexArray.append(hexRow);
    }
    
    func generateMap(view: SKScene, xPos: Int, yPos: Int, width: Int, height: Int){
        var yOffset = 0;
        
        for _ in 0...(Int(view.frame.height) / height){
            generateRow(view: view, xPos: xPos, yPos: yPos + yOffset, width: width, height: height);
            yOffset = yOffset + height + 1;
            yIndex = yIndex + 1;
        }
    }
    
    func addWater(){
        var xPos = 0;
        var yPos = 0;
        
        for first in hexArray {
            for _ in first {
                let randomZeroOne = arc4random_uniform(2)
                hexArray[xPos][yPos].setHexType(newHexType: Int(randomZeroOne));
                yPos = yPos + 1;
            }
            yPos = 0;
            xPos = xPos + 1;
        }

    }
    
    func drawMap(view: SKScene){
        var xPos = 0;
        var yPos = 0;
        
        for first in hexArray {
            for _ in first {
                hexArray[xPos][yPos].drawHexagon(view: view);
                yPos = yPos + 1;
            }
            yPos = 0;
            xPos = xPos + 1;
        }
    }
}
