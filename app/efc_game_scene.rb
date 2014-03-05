class EFCGameScene < SKScene
	def initWithSize(size)
		if self == super
			#setup your scene here
		end
		@score = 0
		self.setup
		self
	end

	def touchesBegan(touches,withEvent: event)
		@hero.flap
	end

	# def update(currentTime)
	# 	super.didMoveToView(view)
	# 	self.setup
	# end

	def setup
		self.preloadSounds
		self.createWorld
		self.createScoreLabel
		self.createHero
		self.createTerrain
		self.schedulePipe
	end

	def preloadSounds
		#double check true vs YES
		@pipeSound = SKAction.playSoundFileNamed("pipe.mp3", waitForCompletion: true)
		@terrainSound = SKAction.playSoundFileNamed("punch.mp3", waitForCompletion: true)
	end

	def createScoreLabel
		@scoreLabel = SKLabelNode.alloc.initWithFontNamed("Helvetica")
		@scoreLabel.setPosition(CGPointMake(self.size.width/2, self.size.height-50))
		#double check
		# @scoreLabel.setText(NSString.stringWithFormat("%@"), numberWithInteger: @score)
		# self.addChild(@scoreLabel)
	end

	def createWorld
		backgroundTexture = SKTexture.textureWithImageNamed("background.png")
		background = SKSpriteNode.spriteNodeWithTexture(backgroundTexture, size: UIScreen.mainScreen.bounds.size)
		background.position = CGPointMake(CGRectGetMidX(UIScreen.mainScreen.bounds),CGRectGetMidY(UIScreen.mainScreen.bounds))
		self.addChild(background)

		self.scaleMode = SKSceneScaleModeAspectFit
		self.physicsWorld.contactDelegate = self
		self.physicsWorld.gravity = CGVectorMake(0,-3);
	end

	def createHero
		@hero = EFCHero.createNodeOn(self)
		@hero.position = CGPointMake(50,450)
	end

	def createTerrain
		EFCTerrain.addNewNodeTo(self)
	end

	#pragma mark -Actions

	def schedulePipe
		@pipeTimer = NSTimer.scheduledTimerWithTimeInterval(4.0, target: self, action: :addPipe, userInfo: nil, repeats: true)
		self.addPipe(nil)
	end

	def addPipe(timer)
		EFCPipe.addNewNodeTo(self)
	end

	def die
		@pipeTimer.invalidate

		reveal = SKTransition(fadeWithDuration(0.5))
		newScene = EFCMenuScene.alloc.initWithSize(self.size)
		self.scene.view.presentScene(newScene, transition: reveal)
	end

	def renderScore
		@scoreLabel.setText(stringWithFormat"%d", self.score)
	end

	def didBeginContact(contact)
		#Not sure what this is
		collision = (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
		if collision == (HEROTYPE | PIPETYPE)
			@hero.goDown()
			self.runAction(@terrainSound, completion: lambda do
				self.die
			end)
		elsif collision == (HEROTYPE | TERRAINTYPE)
			self.runAction(@terrainSound, completion: lambda do
				self.die
			end)
		end
	end

	def didEndContact(contact)
		collision = (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
		if collision == (HEROTYPE | HOLETYPE)
			self.score++
			self.runAction(self.pipeSound, completion: lambda do
				self.renderScore
			end)
		end
	end
end






