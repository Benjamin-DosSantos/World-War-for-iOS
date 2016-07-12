//
//  GameScene.swift
//  World War
//
//  Created by Benjamin DosSantos Jr. on 7/11/16.
//  Copyright © 2016 Benjamin DosSantos Jr. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let mapGen = MapGenerator();
    
    
    override func didMove(to view: SKView) {
        mapGen.generateMap(view: self, xPos: Int(view.frame.maxX * -1), yPos: Int(view.frame.maxY * -1), width: 12, height: 20);
        mapGen.addWater();
        mapGen.drawMap(view: self);
    }
    
    override func update(_ currentTime: TimeInterval) {
    
    }
}
