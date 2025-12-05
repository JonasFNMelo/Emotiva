////
////  CoreDataViewModel.swift
////  Emotiva
////
////  Created by Jonas Fernando Nascimento Melo on 04/12/25.
////
//
import CoreData
import SwiftUI
internal import Combine

class CoreDataViewModel: ObservableObject {
    
    @Published var dNotes: [DailyNotes] = []
    @Published var people: [Person] = []

    func getAll() {
        (dNotes, people) = CoreDataController.shared.fetchAll()
    }
    @MainActor
    func createDNote(text: String, score: Double? = nil, people: [Person]) async throws {
        var newScore: Double
        if score != nil {
            let newDNotes = CoreDataController.shared.creatDailyNote(text: text, date: Date.now, id: UUID(), sentimentScore: score!, people: people)
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                self.dNotes.append(newDNotes)
            }
        }
        else{
            do{
                newScore = try await SentimentosModel.shared.foundationModel(text)
                let newDNotes = CoreDataController.shared.creatDailyNote(text: text, date: Date.now, id: UUID(), sentimentScore: newScore, people: people)
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    self.dNotes.append(newDNotes)
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    

    
    func deleteDNote(_ dNote: DailyNotes) {
        CoreDataController.shared.deleteDNote(dNote)
    }
    
    // Person
    
    func createPerson(name: String, photoImage: UIImage, relationship: Int, content: String, dNotes: [DailyNotes]) {
        if let photo = photoImage.jpegData(compressionQuality: 1.0) {
            
            let result = CoreDataController.shared.creatPerson(name: name, photo: photo, relationship: Int16(relationship), content: content, dNotes: dNotes)
            self.people.append(result)
        }
    }
    
    func creatUIImage(data: Data) -> Image{
        let image = UIImage(data: data)!
        let result = Image(uiImage: image)
        return result
    }
    
    func getDNotePeople(dNote: DailyNotes) -> [Person]{
        let person = dNote.people.flatMap {
            $0.allObjects as? [Person]
        }
        
        return person ?? []
    }
    
    func deletePerson(_ person: Person) {
        CoreDataController.shared.deletePerson(person)
    }
    
    func getColor(for score: Double) -> Color {
        return SentimentosModel.shared.colorForScore(score)
    }
    
    func getEmoji(for score: Double) -> String {
        return SentimentosModel.shared.emojiForScore(score)
    }

}
