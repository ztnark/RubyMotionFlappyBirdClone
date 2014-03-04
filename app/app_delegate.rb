class EFCAppDelegate < UIResponder
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    true

    scene_view = EFCViewController.alloc.init
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = scene_view
    @window.makeKeyAndVisible
  end
end
