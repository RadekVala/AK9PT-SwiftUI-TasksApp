//
//  AddTaskView.swift
//  SwiftUITaskApp
//
//  Created by Radek Vala on 04.12.2021.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var name:String = ""
    
    @Binding var isPresented:Bool
    
    var body: some View {
        VStack {
            Text("Add task")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.orange)
            
            Spacer()
            
            HStack {
                Text("Task name:")
                TextField("Buy a chocolate", text: $name)
            }.padding()
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            Button(action: addTaskTapped) {
                Text("Add task")
            }
        }
    }
    
    func addTaskTapped() {
        isPresented.toggle()
        
        let newItem = Task(context: viewContext)
        newItem.timestamp = Date()
        newItem.name = name
        newItem.completed = false

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
/*
struct AddTaskView_Previews: PreviewProvider {
   
    @Binding var presented:Bool = true
    static var previews: some View {
        AddTaskView(isPresented: presented )
    }
    
}
 */
