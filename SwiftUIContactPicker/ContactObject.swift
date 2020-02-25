//
//  ContactObject.swift
//  ForwardContactUIKit
//
//  Created by Stefano Rampazzo on 07/02/2020.
//  Copyright © 2020 Stefano Rampazzo. All rights reserved.
//

import Foundation
import ContactsUI

class ContactObject : ObservableObject {
    
    @Published var cObj = CNContact()
    @Published var showContactPicker = false
   
}
