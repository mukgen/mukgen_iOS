import Foundation

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func trans(from input: Input) -> Output
}
