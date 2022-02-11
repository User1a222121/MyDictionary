import Foundation

protocol OnboardingProtocol {
    
    func onboardingIsFinished()
    var needsToShowOnboarding: Bool { get }
}

struct OnboardingInstructor: OnboardingProtocol {
    
    private static let StoreKey = "registrationPassed"
    
    var needsToShowOnboarding: Bool {
        let userDefaults = UserDefaults.standard
        let registrationWasViewed = userDefaults.bool(forKey: OnboardingInstructor.StoreKey)
        return !registrationWasViewed
    }
    
    public func onboardingIsFinished() {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: OnboardingInstructor.StoreKey)
    }
}
