import UIKit

protocol Coordinator: AnyObject {
    
    func start()
}

class StartCoordinator: Coordinator {
    
    // MARK: - propirti
    let dataManager: DataManager
    let window: UIWindow
    let mainMenuCoordinator: MainMenuCoordinator
    let rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.dataManager = DataManager()
        self.rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        mainMenuCoordinator = MainMenuCoordinator(presenter: rootViewController, dataManager: dataManager)
    }
    
    func startRegistrationIfNeeded() {
        
        let onboardingInstructor = OnboardingInstructor()
        guard onboardingInstructor.needsToShowOnboarding else { return }
        let vc = RegistrationViewController()
        vc.dataManager = dataManager
        vc.output = self
        rootViewController.pushViewController(vc, animated: true)
        
    }
    
    func start() {

        window.rootViewController = rootViewController
        mainMenuCoordinator.start()
        window.makeKeyAndVisible()
        
        startRegistrationIfNeeded()
    }
}


struct OnboardingInstructor {
    
    private static let StoreKey = "registrationPassed"
    
    public var needsToShowOnboarding: Bool {
        let userDefaults = UserDefaults.standard
        let registrationWasViewed = userDefaults.bool(forKey: OnboardingInstructor.StoreKey)
        return !registrationWasViewed //  "!"
    }
    
    public func onboardingIsFinished() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: OnboardingInstructor.StoreKey)
    }
}

// MARK: - extension RegistrationViewControllerOutput
extension StartCoordinator: RegistrationViewControllerOutput {
    func didFinish(_ vc: RegistrationViewController) {
        let onboardingInstructor = OnboardingInstructor()
        onboardingInstructor.onboardingIsFinished()
        vc.navigationController?.popViewController(animated: true)
    }
}

