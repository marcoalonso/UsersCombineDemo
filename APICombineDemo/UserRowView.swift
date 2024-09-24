//
//  UserRowView.swift
//  APICombineDemo
//
//  Created by Marco Alonso on 23/09/24.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
