// Example from http://gamedevuniversity.com/swift-playground-spritekit/

// Import SpriteKit API and XCPlayground
import SpriteKit
import XCPlayground

// Extend the SKScene to create a new Scene
class GameScene:SKScene {
    
    
    init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView!) {
        
        // Create an Array of SKSprite
        var monsters = [SKSpriteNode]()
        
        // Load SKSprite to the array
        // Append is similar to Array push()
        // Note that resources in Playground are imported using their full path
        
        // Creative Commons – Attribution (CC BY 3.0) Monster designed by Ana Lourenço from the Noun Project
        // http://thenounproject.com/term/monster/56811/
        monsters.append(SKSpriteNode(imageNamed: "/Users/danielpi/repos/Swift-Playgrounds/Swift-Playgrounds/SpriteKit/icon_56811.png"))
        monsters.append(SKSpriteNode(imageNamed: "/Users/danielpi/repos/Swift-Playgrounds/Swift-Playgrounds/SpriteKit/icon_56811.png"))
        monsters.append(SKSpriteNode(imageNamed: "/Users/danielpi/repos/Swift-Playgrounds/Swift-Playgrounds/SpriteKit/icon_56811.png"))
        
        
        // Loop through SKSprite array
        for var i=0; i<3; i++ {
            
            var monster = monsters[i]
            
            // Position the Sprite randomly
            var xPos = CGFloat(UInt(arc4random()) % (500 - UInt(monster.size.width)) + UInt(monster.size.width) / 2)
            var yPos = CGFloat(UInt(arc4random()) % (500 - UInt(monster.size.height)) + UInt(monster.size.height) / 2)
            
            monster.position = CGPoint(x: xPos, y: yPos)
            
            // Add Sprite to Scene
            self.addChild(monster)
        }
        
    }
    
    override func update(currentTime: NSTimeInterval)  {
        
    }
    
}

// Create a new instance of GameScene (created above)
let scene = GameScene(size: CGSize(width: 500, height: 500))

// Create a view
let view = SKView(frame: NSRect(x: 0, y: 0, width: 500, height: 500))

// Present the Scene using our view
view.presentScene(scene)

// Use this method to render the final scene
XCPShowView("result", view)
