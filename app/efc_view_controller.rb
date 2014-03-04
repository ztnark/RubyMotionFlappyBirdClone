class EFCViewController < UIViewController
	def viewDidLoad
		super

		self.view = SKView.alloc.init
		self.view.showsFPS = true
		self.view.showsNodeCount = true

		scene = EFCMenuScene.alloc.initWithSize(UIScreen.mainScreen.bounds.size)
		scene.scaleMode = SKSceneScaleModeAspectFill

		self.view.presentScene(scene)
	end

	def shouldAutorotate
		true
	end

	def supportedInterfaceOrientations
		if UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone
			return UIInterfaceOrientationMaskAllButUpsideDown
		else
			return UIInterfaceOrientationMaskAll
		end
	end

	def didReceiveMemoryWarning
		super.didReceiveMemoryWarning
	end

end