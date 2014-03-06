class EFCMenuScene < SKScene
	def didMoveToView(view)
		# super.didMoveToView(view)
		super
		self.setup
	end

	def setup
		self.createWorld
		# self.createHero
		EFCTerrain.addNewNodeTo(self)
		self.createStartButton
		self.showHero
	end

	def createStartButton
		location = CGPointMake(CGRectGetMidX(UIScreen.mainScreen.bounds),CGRectGetMidY(UIScreen.mainScreen.bounds))
		@startButton = SKSpriteNode.spriteNodeWithImageNamed("start.png")
		@startButton.position = location
		self.addChild(@startButton)
	end

	def createWorld
		backgroundTexture = SKTexture.textureWithImageNamed("Background5.png")
		background = SKSpriteNode.spriteNodeWithTexture(backgroundTexture, size: UIScreen.mainScreen.bounds.size)
		background.position = CGPointMake(CGRectGetMidX(UIScreen.mainScreen.bounds),CGRectGetMidY(UIScreen.mainScreen.bounds))
		self.addChild(background)

		self.scaleMode = SKSceneScaleModeAspectFit
	end

	def createHero
		hero = EFCHero.createSpriteOn(self)
		hero.position = CGPointMake(CGRectGetMidX(self.view.frame),CGRectGetMidY(self.view.frame))
	end

	def showHero
		rudyTexture = SKTexture.textureWithImageNamed("CircleRudy.png")
		rudy = SKSpriteNode.spriteNodeWithTexture(rudyTexture, size: CGSizeMake(100,100))
		rudy.position = CGPointMake(CGRectGetMidX(UIScreen.mainScreen.bounds),CGRectGetMidY(UIScreen.mainScreen.bounds) + 150 )
		self.addChild(rudy)
	end

	def touchesBegan(touches, withEvent: event)
		touch = touches.anyObject
		positionInScene = touch.locationInNode(self)
		if CGRectContainsPoint(@startButton.frame, positionInScene)
			reveal = SKTransition.fadeWithDuration(0.5)
			newScene = EFCGameScene.alloc.initWithSize(UIScreen.mainScreen.bounds.size)
			self.scene.view.presentScene(newScene, transition: reveal)
		end
	end
end
