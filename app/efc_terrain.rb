class EFCTerrain
	def addNewNodeTo(parentNode)
		terrainTexture = SKTexture.textureWithImageNamed("terrain")
		node1 = SKSpriteNode.spriteNodeWithTexture(terrainTexture)
		node1.anchorPoint = CGPointMake(0,1)
		node1.position = CGPointMake(0,0)
		node2 = SKSpriteNode.spriteNodeWithTexture(terrainTexture)
		node2.anchorPoint = CGPointMake(0,1)
		node2.position = CGPointMake(320,0)

		size = CGSizeMake(640,60)
		terrain = SKSpriteNode.spriteNodeWithTexture(terrainTexture, size: size)
		terrain.zPosition = 1
		location = CGPointMake(0.0, 60)
		terrain.anchorPoint = CGPointMake(0,1)
		terrain.position = location
		terrain.addChild(node1)
		terrain.addChild(node2)
		parentNode.addChild(terrain)

		terrainBody = SKNode.node
		terrainBody.position = CGPointMake(160.0, 35)
		terrainBody.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(CGSizeMake(320,20))
		terrainBody.physicsBody.dynamic = false
		terrainBody.physicsBody.affectedByGravity = false
		terrainBody.physicsBody.collisionBitMask = 0
		terrainBody.physicsBody.categoryBitMask = terrainType
		terrainBody.physicsBody.contactTestBitMask = heroType
		parentNode.addChild(terrainBody)

		terrain.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.moveToX(-320, duration: 5.0),SKAction.moveToX(0,duration: 0)])))
	end
end