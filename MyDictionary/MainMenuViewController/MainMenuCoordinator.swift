import UIKit

class MainMenuCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var mainMenuViewController: MainMenuViewController?
    private var trainingCoordinator: TrainingCoordinator?
    private var dictionaryCoordinator: DictionaryCoordinator?
    private let dataManager: DataManager
    
    init(presenter: UINavigationController, dataManager: DataManager) {
        self.presenter = presenter
        self.dataManager = dataManager
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
        
        let trainingCoordinator = TrainingCoordinator(presenter: presenter, dataManager: dataManager)
        trainingCoordinator.start()
        self.trainingCoordinator = trainingCoordinator
    }
    
    func openMyDictionary() {
        
        let dictionaryCoordinator = DictionaryCoordinator(presenter: presenter, dataManager: dataManager)
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
