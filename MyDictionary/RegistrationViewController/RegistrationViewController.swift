import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - propirties
    var output: RegistrationViewControllerOutput?
    var dataManager = DataManager()
    
    // MARK: - outlets
    @IBOutlet private weak var nameTF: CustomTextField!
    @IBOutlet private weak var languageTF: CustomTextField!
    @IBOutlet private weak var cityTF: CustomTextField!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        languageTF.delegate = self
        cityTF.delegate = self
        configureVC()
    }
    
    // MARK: - func
    private func configureVC() {
        view.backgroundColor = CustomColors.backgroundColor
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc func saveTapped() {
        dataManager.createNewUser(name: nameTF.text ?? "Имя не указано", language: languageTF.text ?? "Родной язык не указан", city: cityTF.text  ?? "Город не указан", isMain: true)
        output?.didFinish(self)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTF.text != "", languageTF.text != "", cityTF.text != "" {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
}
