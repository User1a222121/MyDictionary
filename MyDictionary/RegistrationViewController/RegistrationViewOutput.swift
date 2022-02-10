import Foundation

protocol RegistrationViewOutput: AnyObject {
    
    func didFinish(_ vc: RegistrationViewController)
    func createNewUser(name: String, language: String, city: String, isMain: Bool)
}

