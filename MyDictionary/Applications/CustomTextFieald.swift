import UIKit

// MARK: - private extension
private extension TimeInterval {
    static let animation250ms: TimeInterval = 0.25
}

// MARK: - private enum
private enum Constants {
    static let offset: CGFloat = 8
    static let placeholderSize: CGFloat = 14
}

// MARK: - class CustomTextField
class CustomTextField: UITextField {
    
    // MARK: - Subviews
    private let border = UIView()
    private let label = UILabel()

    // MARK: - Private Properties
    private var labelHeight: CGFloat {
        ceil(font?.withSize(Constants.placeholderSize).lineHeight ?? 0)
    }

    private var textHeight: CGFloat {
        ceil(font?.lineHeight ?? 0)
    }

    private var isEmpty: Bool {
        text?.isEmpty ?? true
    }

    private var textInsets: UIEdgeInsets {
        UIEdgeInsets(top: Constants.offset + labelHeight, left: 15, bottom: Constants.offset, right: 0)
    }

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - UITextField
    override func layoutSubviews() {
        super.layoutSubviews()
        border.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
        updateLabel(animated: false)
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: textInsets.top + textHeight + textInsets.bottom)
    }

    override var placeholder: String? {
        didSet {
            label.text = placeholder
        }
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    // MARK: - Private func
    private func setupUI() {
        borderStyle = .roundedRect

        label.textColor = .gray
        label.font = font?.withSize(Constants.placeholderSize)
        label.text = placeholder
        label.isUserInteractionEnabled = false
        addSubview(label)

        addTarget(self, action: #selector(updateLabel(animated:)), for: .allEditingEvents)
    }

    @objc private func updateLabel(animated: Bool = true) {
        let alpha: CGFloat = isEmpty ? 0 : 1
        let y = isEmpty ? labelHeight * 0.5 : 1
        let labelFrame = CGRect(x: 15, y: y, width: bounds.width, height: labelHeight)

        guard animated else {
            label.frame = labelFrame
            label.alpha = alpha
            return
        }

        UIView.animate(withDuration: .animation250ms) {
            self.label.frame = labelFrame
            self.label.alpha = alpha
        }
    }
}




