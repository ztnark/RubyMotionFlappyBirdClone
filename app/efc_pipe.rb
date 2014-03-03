class EFCPipe

	def addNewNodeTo(parentNode)
		CGFloat.offset = 620
		CGFloat.startY = -50.0 + rand(4) * 60.0

		parentNode.addChild(self, createPipeAtY: (startY + offset), isTopPipe: true)
		parentNode.addChild(self, createPipeAtY: (startY+540/2.0+35))
		parentNode.addChild(self, createPipeAtY: startY, isTopPipe: false)
	end

	def createPipeAtY(startY, isTopPipe: isTopPipe)
		pipeNode = SKSpriteNode.spriteNodeWithImageNamed("pipe")
		pipeNode.position = CGPointMake(320, startY)
		pipeNode.yScale = isTopPipe ? 1.0 : -1.0
		pipeNode.zPosition = 0
		pipeNode.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(pipeNode.size)
		pipeNode.physicsBody.dynamic = false
		pipeNode.physicsBody.collisionBitMask = heroType
		pipeNode.physicsBody.categoryBitMask = pipeType
		pipeNode.physicsBody.contactTestBitMask = heroType
		self.animate(pipeNode)
		pipeNode
	end

	def createHoleAtY(startY)
		holeSize = CGSizeMake(52,85)
		holeInPipe = SKSpriteNode.pipeNode
		holeInPipe.position = CGPointMake(320,startY)
		holeInPipe.zPosition = 0
		holeInPipe.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(holeSize)
		holeInPipe.physicsBody.dynamic = false
		holeInPipe.physicsBody.collisionBitMask = 0x00000000
		holeInPipe.physicsBody.categoryBitMask = holeType
		holeInPipe.physicsBody.contactTestBitMask = 0x00000000
		self.animate(holeInPipe)
		holeInPipe
	end

	def animate(node)
		node.runAction(SKAction.sequence [SKAction.moveToX(finalPosition, duration: duration),
										  SKAction.removeFromParent])
	end
end
