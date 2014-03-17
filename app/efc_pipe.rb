FINAL_POSITION = -50
DURATION = 6

class EFCPipe

	def self.addNewNodeTo(parentNode)
		offset = 620
		startY = -50.0 + rand(4) * 60.0

		parentNode.addChild(self.createTopPipeAtY(startY + offset))
		parentNode.addChild(self.createHoleAtY(startY+540/2.0+35))
		parentNode.addChild(self.createBottomPipeAtY(startY))
	end

	def self.createTopPipeAtY(startY)
		pipeNode = SKSpriteNode.spriteNodeWithImageNamed("RedPipe4.png")
		pipeNode.position = CGPointMake(320, startY)
		pipeNode.yScale = 1.0
		pipeNode.zPosition = 0
		pipeNode.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(pipeNode.size)
		pipeNode.physicsBody.dynamic = false
		pipeNode.physicsBody.collisionBitMask = HEROTYPE
		pipeNode.physicsBody.categoryBitMask = PIPETYPE
		pipeNode.physicsBody.contactTestBitMask = HEROTYPE
		self.animate(pipeNode)
		pipeNode
	end

	def self.createBottomPipeAtY(startY)
		pipeNode = SKSpriteNode.spriteNodeWithImageNamed("RedPipe5.png")
		pipeNode.position = CGPointMake(320, startY)
		pipeNode.zPosition = 0
		pipeNode.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(pipeNode.size)
		pipeNode.physicsBody.dynamic = false
		pipeNode.physicsBody.collisionBitMask = HEROTYPE
		pipeNode.physicsBody.categoryBitMask = PIPETYPE
		pipeNode.physicsBody.contactTestBitMask = HEROTYPE
		
		self.animate(pipeNode)
		pipeNode
	end

	def self.createHoleAtY(startY)
		holeSize = CGSizeMake(52,85)
		holeInPipe = SKSpriteNode.node
		holeInPipe.position = CGPointMake(320,startY)
		holeInPipe.zPosition = 0
		holeInPipe.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(holeSize)
		holeInPipe.physicsBody.dynamic = false
		holeInPipe.physicsBody.collisionBitMask = HEROTYPE
		holeInPipe.physicsBody.categoryBitMask = HOLETYPE
		holeInPipe.physicsBody.contactTestBitMask = HEROTYPE
		self.animate(holeInPipe)
		holeInPipe
	end

	def self.animate(node)
		node.runAction(SKAction.sequence [SKAction.moveToX(FINAL_POSITION, duration: DURATION),
										  SKAction.removeFromParent])
	end
end
