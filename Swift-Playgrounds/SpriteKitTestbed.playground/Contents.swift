import Cocoa
import SpriteKit
import XCPlayground


// Credit to http://ericasadun.com/2015/04/22/swift-simple-spritekit-experimentation/


// Build scene and view
let sceneSize = CGSizeMake(400.0, 300.0)
let view = SKView(frame: CGRect(origin: CGPointZero, size: sceneSize))
var scene = SKScene(size: sceneSize)
scene.backgroundColor = SKColor.lightGrayColor()
XCPShowView("Scene", view: view)
view.presentScene(scene)

var shape1 = SKShapeNode(circleOfRadius: 20.0)
shape1.fillColor = SKColor.redColor()
scene.addChild(shape1)
shape1.position = CGPointMake(200.0, 150.0)

var action = SKAction.repeatActionForever(SKAction.moveBy(CGVectorMake(0.02, 0.1), duration: 0.01))
shape1.runAction(ac