#might need to inherit from SKPhysicsContactDelege
class EFCGameScene
	def initWithSize(size)
		if self == super.initWithSize(size)
			#setup your scene here
		end
		return self
	end

	def touchesBegan(touches,withEvent: event)
		self.hero(flap)
	end

	def update(currentTime)
		super.didMoveToView(view)
		self.setup
	end

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
		self.pipeSound = SKAction.playSoundFileNamed("pipe.mp3", waitForCompletion: true)
		self.terrainSound = SKAction.playSoundFileNamed("punch.mp3", waitForCompletion: true)
	end

	def createScoreLabel
		self.scoreLabel = SKLableNode.alloc.initWithFontNamed("Helvetica")
		self.scoreLabel(setPosition(CGPointMake(self.size.width/2, self.size.height-50)))
		#double check
		self.scoreLabel(setText(stringWithFormat("%@", numberWithInteger: self.score)))
		self.addChild(self.scoreLabel)
	end

	def createWorld
		backgroundTexture = SKtexture.textureWithImageNamed("background")
		background = SKSpriteNode.spriteNodeWithTexture(backgroundTexture, size: self.view.frame)
		background.position = CGPointMake(CGRectGetMidX(self.view.frame),CGRectGetMidY(self.view.frame))
		self.addChild(background)

		self.scaleMode = SKScaleModeAspectFit
		self.physicsWorld.contactDelegate = self
		self.physicsWorld.gravity = CGVectorMake(0,-3);
	end

	def createHero
		EFCTerrain.addNewNodeTo(self)
	end

	#pragma mark -Actions

	def scedulePipe
		self.pipeTimer = NSTimer.scheduledTimerWithTImeInterval(4.0, target: self, action: 'addPipe', userInfo: nil, repeats: true)
		self.addPipe(nil)
	end

	def addPipe(timer)
		EFCPipe.addNewNodeTo(self)
	end

	def die
		self.pipeTimer.invalidate

		reveal = SKTransition(fadeWithDuration(0.5))
		newScene = EFCMenuScene.alloc.initWithSize(self.size)
		self.scene.view.presentScene(newScene, transition: reveal)
	end

	def renderScore
		self.scoreLabel.setText(stringWithFormat"%d", self.score)
	end

	def didBeginContact(contact)
		#Not sure what this is
		collision = (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
		if collision == (heroType | pipeType)
			self.hero.goDown()
			self.runAction(self.terrainSound, completion: lambda do
				self.die
			end)
		elsif collision == (heroType | terrainType)
			self.runAction(self.terrainSound, completion: lambda do
				self.die
			end)
		end
	end

	def didEndContact(contact)
		collision = (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
		if collision == (heroType | holeType)
			self.score++
			self.runAction(self.pipeSound, completion: lambda do
				self.renderScore
			end)
		end
	end
end






