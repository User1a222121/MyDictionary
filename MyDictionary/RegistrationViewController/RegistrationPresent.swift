import Foundation

class RegistrationPresenter: RegistrationViewOutput {
    
    weak var view: RegistrationViewInput!
    var dataManager: DataManager!
    var delegate: OnboardingProtocol!
    
    func didFinish(_ vc: RegistrationViewController) {
        
//        delegate.onboardingIsFinished() //nil
        
        let onboardingInstructor = OnboardingInstructor()
        onboardingInstructor.onboardingIsFinished()
        vc.navigationController?.popViewController(animated: true)
    }
    
    func createNewUser(name: String, language: String, city: String, isMain: Bool) {
        dataManager.createNewUser(name: name, language: language, city: city, isMain: isMain)
    }
}
