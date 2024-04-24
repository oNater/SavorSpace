//
//  MealViewModel.swift
//  SavorSpace
//
//  Created by user250623 on 4/21/24.
//
import Foundation
import Combine

class MealViewModel: ObservableObject {
    @Published var meals = [Meal]()
    private var cancellables = Set<AnyCancellable>()

    func fetchMeals(byFirstLetter letter: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.meals = response.meals
            })
            .store(in: &cancellables)
    }
}
