//
//  Created by Evhen Gruzinov on 30.01.2023.
//

import SpriteKit

class BirdNode: SKSpriteNode {
    
    static func populate(at point: CGPoint, size: CGSize) -> SKSpriteNode {
        
        let birdTexture = BirdTextures.birdAtlas.textureNamed("bluebird-midflap")
        let bird = SKSpriteNode(texture: birdTexture)
        
        bird.name = "bird"
        bird.position = CGPoint(x: point.x / 3, y: point.y / 1.2)
        bird.physicsBody = SKPhysicsBody(rectangleOf: bird.size)
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.categoryBitMask = ColliderType.bird
        bird.physicsBody?.collisionBitMask = ColliderType.environment
        bird.physicsBody?.contactTestBitMask = ColliderType.environment
        
        let birdWidth = size.width / 8
        let birdHeight = birdWidth / 1.41
        bird.size = CGSize(width: birdWidth, height: birdHeight)
        
        bird.zPosition = 10
        
        return bird
        
    }
    
}

struct BirdTextures {
    
    static let birdAtlas = SKTextureAtlas(named: "bird")
    
    static let animationTextures = [
        birdAtlas.textureNamed("bluebird-upflap"),
        birdAtlas.textureNamed("bluebird-midflap"),
        birdAtlas.textureNamed("bluebird-downflap"),
        birdAtlas.textureNamed("bluebird-midflap"),
        birdAtlas.textureNamed("bluebird-upflap")
    ]
}
