//
//  AudiModelsView.swift
//  AudiSwiftUIApp
//
//  Created by jcruzsa on 29/11/22.
//

import SwiftUI

struct AudiModelsView: View {
    @State var models: [AudiCarModel] = []
    @State var isAlertPresented: Bool = false
    @State var alertTitle: String = "Error"
    @State var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: .infinity), spacing: 0),
                        GridItem(.adaptive(minimum: .infinity), spacing: 0),
                    ], spacing: 0) {
                        ForEach(models) { model in
                            AudiModelGridView(audiModel: model)
                        }
                    }
            }
            .onAppear {
                loadModels()
            }
            .alert(alertTitle, isPresented: $isAlertPresented, actions: {
                Button("A vr again") {
                    loadModels()
                }
            }, message: {
                Text(alertMessage)
            })
            .navigationTitle("Choose your new Audi")
        }
    }
    
    private func loadModels() {
        let strUrl: String = "https://www.dropbox.com/s/25nl23900z1xmf6/CarsList.json?dl=1"
        guard let url = URL(string: strUrl) else {
            isAlertPresented = true
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                DispatchQueue.main.async {
                    isAlertPresented = true
                    alertMessage = error.localizedDescription
                }
                return
            }
            guard let data = data,
                  let response = try? JSONDecoder().decode([AudiCarModel].self, from: data)
            else {
                DispatchQueue.main.async {
                    isAlertPresented = true
                    alertMessage = "Can't build response model from service data"
                }
                return
            }
            DispatchQueue.main.async {
                self.models = response
            }
        }
        task.resume()
    }
}

struct AudiModelsView_Previews: PreviewProvider {
    static var previews: some View {
        AudiModelsView()
    }
}
