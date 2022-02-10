import UIKit
import CoreData

class MainMenuViewController: UIViewController {
    
    // MARK: - Propirties
    weak var delegate: MainViewControllerOutput?
    
    // MARK: - Outlets
    @IBOutlet private weak var POLearnNewWords: UIProgressView!
    @IBOutlet private weak var POTrainingNewWords: UIProgressView!
    @IBOutlet private weak var POMyDictionaryWords: UIProgressView!
    @IBOutlet private weak var labelLearnWords: UILabel!
    @IBOutlet private weak var labelTrainingWords: UILabel!
    @IBOutlet private weak var labelKnowWords: UILabel!
    @IBOutlet private weak var learnNewWordsButtonOutlet: UIButton!
    @IBOutlet private weak var trainingNewWordsButtonOutlet: UIButton!
    @IBOutlet private weak var myDictionaryOpenButtonOutlet: UIButton!
    
    // MARK: - Actions
    @IBAction func learnNewWordsButton(_ sender: UIButton) {
        delegate?.openLearnNewWords()
    }
    @IBAction func trainingNewWordsButton(_ sender: UIButton) {
        delegate?.openTrainingOfWords()
    }
    @IBAction func myDictionaryOpenButton(_ sender: UIButton) {
        delegate?.openMyDictionary()
    }
    @IBAction func viewDetailButton(_ sender: UIButton) {
        delegate?.openDetailInfo()
    }
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Мой словарик"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButton))
        
    }
    
    
    // MARK: - Func
    
    @objc func settingButton() {
        delegate?.openUserInfoAndSetting()
    }
    
}
