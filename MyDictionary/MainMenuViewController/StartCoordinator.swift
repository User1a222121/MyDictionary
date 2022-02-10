import UIKit

protocol Coordinator: AnyObject {
    
    func start()
}

class StartCoordinator: Coordinator {
    
    // MARK: - propirti
    let window: UIWindow
    let mainMenuCoordinator: MainMenuCoordinator
    let rootViewController: UINavigationController
    var delegate: OnboardingProtocol!
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        mainMenuCoordinator = MainMenuCoordinator(presenter: rootViewController)
    }
    
    func startRegistrationIfNeeded() {
        
//        guard delegate.needsToShowOnboarding else { return } //nil
        
        let onboardingInstructor = OnboardingInstructor()
        guard onboardingInstructor.needsToShowOnboarding else { return }
        let vc = RegistrationViewController()
        rootViewController.pushViewController(vc, animated: true)
        
    }
    
    func start() {

        window.rootViewController = rootViewController
        mainMenuCoordinator.start()
        window.makeKeyAndVisible()
        
        startRegistrationIfNeeded()
    }
}

