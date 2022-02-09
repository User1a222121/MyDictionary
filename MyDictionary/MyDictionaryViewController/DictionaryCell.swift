import UIKit

class DictionaryCell: UITableViewCell {
    
    // MARK: - Propirties
    static let reuseId = "DictionaryCell"
    
    // MARK: - Outlets
    @IBOutlet weak var engWordOutlet: UILabel!
    @IBOutlet weak var rusWordOutlet: UILabel!
    
    
    // MARK: - Actions
    @IBAction func playButton(_ sender: UIButton) {
    }
    @IBAction func infoButton(_ sender: UIButton) {
    }
    @IBAction func deleteButton(_ sender: UIButton) {
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
