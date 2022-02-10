import UIKit

class MainMenuCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var mainMenuViewController: MainMenuViewController?
    private var trainingCoordinator: TrainingCoordinator?
    private var dictionaryCoordinator: DictionaryCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let mainMenuViewController = MainMenuViewController()
        mainMenuViewController.delegate = self
        presenter.pushViewController(mainMenuViewController, animated: true)

        self.mainMenuViewController = mainMenuViewController
    }
}

extension MainMenuCoordinator: MainViewControllerOutput {
    
    func openLearnNewWords() {
        
        let learnNewWordsViewController = LearnNewWordsViewController()
        presenter.pushViewController(learnNewWordsViewController, animated: true)
    }
    
    func openTrainingOfWords() {
        
        let trainingCoordinator = TrainingCoordinator(presenter: presenter)
        trainingCoordinator.start()
        self.trainingCoordinator = trainingCoordinator
    }
    
    func openMyDictionary() {
        
        let dictionaryCoordinator = DictionaryCoordinator(presenter: presenter)
        dictionaryCoordinator.start()
        self.dictionaryCoordinator = dictionaryCoordinator
    }
    
    func openUserInfoAndSetting() {
        
        let userInfoAndSettingsViewController = UserInfoAndSettingsViewController()
        presenter.pushViewController(userInfoAndSettingsViewController, animated: true)
    }
    
    func openDetailInfo() {
        
        let detailInfoViewController = DetailInfoViewController()
        presenter.pushViewController(detailInfoViewController, animated: true)
    }
    
    
}
