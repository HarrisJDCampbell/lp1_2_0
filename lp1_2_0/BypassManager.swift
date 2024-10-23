import SwiftUI

class BypassManager: ObservableObject {
    @Binding var isBypassed: Bool
    
    init(isBypassed: Binding<Bool>) {
        _isBypassed = isBypassed
    }
    
    func bypass() {
        isBypassed = true
    }
}
