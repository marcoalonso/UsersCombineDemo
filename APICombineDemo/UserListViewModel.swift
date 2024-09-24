//
//  UserListViewModel.swift
//  APICombineDemo
//
//  Created by Marco Alonso on 23/09/24.
//

import Foundation
import Combine

/*
 Este ViewModel actúa como un intermediario entre la vista (UserListView) y el modelo de datos (User). Maneja la lógica de negocio para cargar usuarios, gestionar el estado de carga y los errores, y proporcionar estos datos a la vista de una manera que SwiftUI puede observar y reaccionar.
 */

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables: Set<AnyCancellable> = []
    private let apiService: APIService
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func fetchUsers() {
        isLoading = true
        errorMessage = nil
        
        apiService.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}
