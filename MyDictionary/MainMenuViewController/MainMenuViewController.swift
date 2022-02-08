import UIKit

class MainMenuViewController: UIViewController {
    
    // MARK: - propirties
    weak var delegate: MainViewControllerOutput?
    
    // MARK: - Outlets
    
    @IBOutlet weak var POLearnNewWords: UIProgressView!
    
    @IBOutlet weak var POTrainingNewWords: UIProgressView!
    
    @IBOutlet weak var POMyDictionaryWords: UIProgressView!
    
    @IBOutlet weak var labelLearnWords: UILabel!
    
    @IBOutlet weak var labelTrainingWords: UILabel!
    
    @IBOutlet weak var labelKnowWords: UILabel!
    
    
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
        navigationItem.title = "Мой словарик"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButton))
        
    }
    
    @objc func settingButton() {
        delegate?.openUserInfoAndSetting()
    }
    
}
