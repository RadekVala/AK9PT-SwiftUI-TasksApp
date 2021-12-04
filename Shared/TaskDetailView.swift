//
//  TaskDetailView.swift
//  SwiftUITaskApp
//
//  Created by Radek Vala on 04.12.2021.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var task:Task
    @State private var stateCompleted: Bool
    
    init(currentItem:Task){
        self.task = currentItem
        if currentItem.completed == true {
            stateCompleted = true
        } else {
            stateCompleted = false
        }
    }
    
    var body: some View {
        VStack {
            Text("\(task.name ?? "name not set")")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            Text("Item at \(task.timestamp!, formatter: itemFormatter)")
            Toggle(isOn: $stateCompleted) {
                Text("Completed")
            }.padding()
                .onChange(of: stateCompleted) { value in
                    viewContext.performAndWait {
                        print("update")
                        task.completed = value
                        
                        try? viewContext.save()
                    }
                    
                }
        }
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    
}

/*
struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView()
    }
}
 */
