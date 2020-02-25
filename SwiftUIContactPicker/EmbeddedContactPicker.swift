import SwiftUI
import Contacts

struct EmbeddedContactPicker: UIViewControllerRepresentable {
   @EnvironmentObject var contactObj: ContactObject
    
    typealias UIViewControllerType = EmbeddedContactPickerViewController
    
    func setContact(contact: CNContact ){
        self.contactObj.cObj = contact
        self.contactObj.showContactPicker = false
     }
    
    final class Coordinator: NSObject, EmbeddedContactPickerViewControllerDelegate {
        var parent : EmbeddedContactPicker
        
        init(_ parent: EmbeddedContactPicker){
            self.parent = parent
        }
        func embeddedContactPickerViewController(_ viewController: EmbeddedContactPickerViewController, didSelect contact: CNContact) {
            parent.setContact(contact: contact)
         }

        func embeddedContactPickerViewControllerDidCancel(_ viewController: EmbeddedContactPickerViewController) {
            parent.setContact(contact: CNContact())
        }
      
    }

    func makeCoordinator() -> Coordinator {
       
        return Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) -> EmbeddedContactPicker.UIViewControllerType {
        let result = EmbeddedContactPicker.UIViewControllerType()
        result.delegate = context.coordinator
        return result
    }

    func updateUIViewController(_ uiViewController: EmbeddedContactPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) { }

}

