class EFCViewControlled
	def viewDidLoad
		super.viewDidLoad

		skView = self.view
		skView.showFPS = true
		skView.showNodeCount = true

		scene = EFCMenuScene.sceneWithSize(skView.bounds.size)
		scene.scaleMode = SKSceneScaleModeAspectFill

		skView.presentScene(scene)
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