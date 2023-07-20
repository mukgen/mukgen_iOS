import UIKit
import Then
import SnapKit

class SelectTimeView: UIView {
    private let time = ["오전", "오후"]
    private let hour = ["1시", "2시", "3시", "4시", "5시", "6시", "7시", "8시", "9시", "10시", "11시", "12시"]
    private let minuete = ["0분", "10분", "20분", "30분", "40분", "50분"]

    private final var controller: UIViewController

    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .clear
        pickerView.showsLargeContentViewer = true
        pickerView.delegate = self
        pickerView.dataSource = self

        return pickerView
    }()

    private let feedbackGenerator = UISelectionFeedbackGenerator()

        init(frame: CGRect, viewController: UIViewController) {
            self.controller = viewController
            super.init(frame: frame)

            layout()
            pickerView.reloadAllComponents()
        }

        func layout() {
            self.addSubview(pickerView)
            
            pickerView.snp.makeConstraints {
                $0.height.equalTo(305.0)
                $0.bottom.top.equalToSuperview()
                $0.top.leading.trailing.equalToSuperview()
            }
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension SelectTimeView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return time.count
        case 1:
            return hour.count
        default:
            return minuete.count
        }

    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)

            switch component {
            case 0:
                label.text = "\(time[row])"
            case 1:
                label.text = "\(hour[row])"
            default:
                label.text = "\(minuete[row])"
            }

            return label
        }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let time = time[pickerView.selectedRow(inComponent: 0)]
        let hour = hour[pickerView.selectedRow(inComponent: 1)]
        let minuete = minuete[pickerView.selectedRow(inComponent: 2)]

        print("\(time) : \(hour) : \(minuete)\n")
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 49.0
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 75.5 
    }

}
