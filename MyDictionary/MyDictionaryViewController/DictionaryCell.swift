import UIKit

protocol CellOutput: AnyObject {
    
    func deletButtonDidTap(button sender: DictionaryCell)
    
    
}

class DictionaryCell: UITableViewCell {
    
    // MARK: - Propirties
    static let reuseId = "DictionaryCell"
    weak var output: CellOutput?
    
    // MARK: - Outlets
    @IBOutlet weak var engWordOutlet: UILabel!
    @IBOutlet weak var rusWordOutlet: UILabel!
    
    
    // MARK: - Actions
    @IBAction func playButton(_ sender: UIButton) {
    }
    @IBAction func infoButton(_ sender: UIButton) {
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        output?.deletButtonDidTap(button: self)
    }
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with word: Word) {
        
        self.engWordOutlet.text = word.wrappedEngWord
        self.rusWordOutlet.text = word.wrappedRusWord
        
    }
}
