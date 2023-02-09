//
//  HomeView.swift
//  riFit
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Exercise.name, ascending: true)],
        animation: .default)
    private var exercises: FetchedResults<Exercise>

    var body: some View {
        NavigationStack {
            NavigationLink {
                ToolsView()
            } label: {
                Text("Tools")
            }
            NavigationLink {
                MaxesView()
            } label: {
                Text("Maxes")
            }
            NavigationLink {
                WorkoutView()
            } label: {
                Text("Workout")
            }
            NavigationLink {
                TestView()
            } label: {
                Text("Test")
            }
        }
//        NavigationStack {
//            List {
//                ForEach(exercises) { exercise in
//                    NavigationLink {
//                        Text("Page of \(exercise.name!) exercise")
//                    } label: {
//                        Text(exercise.name!)
//                    }
//                }
//            }
//        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
