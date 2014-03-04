class EFCMenuScene < SKScene
	def didMoveToView(view)
		# super.didMoveToView(view)
		super
		self.setup
	end

	def setup
		self.createWorld
		# self.createHero
		EFCTerrain.alloc.init.addNewNodeTo(self)
		self.createStartButton
	end

	def createStartButton
		location = CGPointMake(CGRectGetMidX(self.view.frame) + 160,CGRectGetMidY(self.view.frame) + 150)
		startButton = SKSpriteNode.spriteNodeWithImageNamed("start.png")
		startButton.position = location
		self.addChild(startButton)
	end

	def createWorld
		backgroundTexture = SKTexture.textureWithImageNamed("background.png")
		background = SKSpriteNode.spriteNodeWithTexture(backgroundTexture, size: self.view.frame.size)
		background.position = CGPointMake(CGRectGetMidX(self.view.frame),CGRectGetMidY(self.view.frame))
		self.addChild(background)

		self.scaleMode = SKSceneScaleModeAspectFit
	end

	def createHero
		hero = EFCHero.alloc.init.createSpriteOn(self)
		hero.position = CGPointMake(CGRectGetMidX(self.view.frame),CGRectGetMidY(self.view.frame))
	end

	def touchesBegan(touches, withEvent: event)
		touch = touches.anyObject
		positionInScene = touch.locationInNode(self)
		if CGREctContainsPoint(self.startButton.frame, positionInScene)
			reveal = SKTransition.fadeWithDuration(0.5)
			newScene = EFCGameScene.alloc.initWithSize(self.size)
			self.scene.view.presentScene(newScene, transition: reveal)
		end
	end
end
