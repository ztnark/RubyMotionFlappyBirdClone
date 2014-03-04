class EFCHero < SKSpriteNode
	def init
		super.initWithImageNamed('hero1.png')
		if self
			self.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(CGSizeMake(self.size.width * 0.95, self.size.height * 0.95))
			self.physicsBody.dynamic = true
			self.physicsBody.collisionBitMask = PIPETYPE
			self.physicsBody.categoryBitMask = HEROTYPE
			self.physicsBody.contactTestBitMask ||= HOLETYPE

			self.animate
		end
		self
	end

	def animate
		animationFrames = [SKTexture.textureWithImageNamed("hero1"),SKTexture.textureWithImageNamed("hero2")]
		self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(
															animationFrames,
															timePerFrame: 0.1,
															resize: false,
															restore: true)), withKey: "flyingHero")
	end

	def createNodeOn(parent)
		# hero = EFCHero.new
	end

	def createSpriteOn(parent)
		# hero = self.createNodeOn(parent)
		# hero.physicsBody = nil
		# hero
	end

	def update
		if self.physicsBody.velocity.dy > 30.0
			self.zRotation == Math::PI / 6.0
		elsif self.physicsBody.velocity.dy < -100.0
			self.zRotation == -Math::PI / 4.0
		else
			self.zRotation(0)
		end
	end

	def goDown
		#double check this
		self.physicsBody(applyImpulse(CGVectorMake(0,-10))) 
	end

	def flap
		self.physicsBody.velocity = CGVectorMake(0,0)
		self.physicsBody(applyImpulse(CGVectorMake(0,3)))
	end
end

