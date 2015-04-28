import Cocoa
import SpriteKit
import XCPlayground

// Build scene and view
let sceneSize = CGSizeMake(400.0, 300.0)
let view = SKView(frame: CGRect(origin: CGPointZero, size: sceneSize))
var scene = SKScene(size: sceneSize)
scene.backgroundColor = SKColor.lightGrayColor()
XCPShowView("Scene", view)
view.presentScene(scene)

var shape1 = SKShapeNode(circleOfRadius: 20.0)
shape1.fillColor = SKColor.redColor()
scene.addChild(shape1)
shape1.position = CGPointMake(200.0, 150.0)

