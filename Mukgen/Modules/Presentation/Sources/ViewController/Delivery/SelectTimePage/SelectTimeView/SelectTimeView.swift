import UIKit
import Then
import SnapKit
import MukgenKit

class SelectTimeView: UIView {
    private let time = ["오전", "오후"]
    private let hour = ["1시", "2시", "3시", "4시", "5시", "6시", "7시", "8시", "9시", "10시", "11시", "12시"]
    private let minuete = ["0분", "10분", "20분", "30분", "40분", "50분"]

    private final var controller: UIViewController

    private lazy var timePickerView: UIPickerView = createPickerView()
    private lazy var hourPickerView: UIPickerView = createPickerView()
    private lazy var minutePickerView: UIPickerView = createPickerView()
    
    private lazy var colon1 = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
        $0.text = ":"
        $0.font = .systemFont(ofSize: 32, weight: .semibold)
        $0.backgroundColor = .clear
    }
    
    private lazy var colon2 = UILabel().then {
        $0.textColor = MukgenKitAsset.Colors.primaryLight1.color
        $0.text = ":"
        $0.font = .systemFont(ofSize: 32, weight: .semibold)
        $0.backgroundColor = .clear
    }

    private func createPickerView() -> UIPickerView {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .clear
        pickerView.showsLargeContentViewer = true
        pickerView.delegate = self
        pickerView.dataSource = self

        return pickerView
    }

    private let feedbackGenerator = UISelectionFeedbackGenerator()

    init(frame: CGRect, viewController: UIViewController) {
        self.controller = viewController
        super.init(frame: frame)

        layout()
        timePickerView.reloadAllComponents()
        hourPickerView.reloadAllComponents()
        minutePickerView.reloadAllComponents()
    }

    func layout() {
        addSubview(hourPickerView)
        addSubview(timePickerView)
        addSubview(minutePickerView)
        addSubview(colon1)
        addSubview(colon2)
        
        hourPickerView.snp.makeConstraints {
            $0.height.equalTo(305.0)
            $0.bottom.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(147.5)
            $0.trailing.equalToSuperview().offset(-147.5)
            $0.width.equalTo(82.0)
        }
        
        timePickerView.snp.makeConstraints {
            $0.bottom.top.equalToSuperview()
            $0.height.equalTo(305.0)
            $0.trailing.equalTo(hourPickerView.snp.leading).offset(-20)
            $0.leading.equalToSuperview().offset(30.0)
            $0.width.equalTo(82.0)
        }
        
        minutePickerView.snp.makeConstraints {
            $0.height.equalTo(305.0)
            $0.bottom.top.equalToSuperview()
            $0.leading.equalTo(hourPickerView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-30.0)
            $0.width.equalTo(82.0)
        }
        
        colon1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(133.5)
            $0.bottom.equalToSuperview().offset(-133.5)
            $0.width.equalTo(9)
            $0.height.equalTo(38)
            $0.trailing.equalTo(hourPickerView.snp.leading).offset(-3.25)
        }
        
        colon2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(133.5)
            $0.bottom.equalToSuperview().offset(-133.5)
            $0.width.equalTo(9)
            $0.height.equalTo(38)
            $0.leading.equalTo(hourPickerView.snp.trailing).offset(3.25)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectTimeView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case timePickerView:
            return time.count
        case hourPickerView:
            return hour.count
        default:
            return minuete.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)

        switch pickerView {
        case timePickerView:
            label.text = "\(time[row])"
        case hourPickerView:
            label.text = "\(hour[row])"
        default:
            label.text = "\(minuete[row])"
        }

        return label
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedTime = time[timePickerView.selectedRow(inComponent: 0)]
        let selectedHour = hour[hourPickerView.selectedRow(inComponent: 0)]
        let selectedMinuete = minuete[minutePickerView.selectedRow(inComponent: 0)]

        print("\(selectedTime) : \(selectedHour) : \(selectedMinuete)\n")
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 49.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 82.0
    }
}
