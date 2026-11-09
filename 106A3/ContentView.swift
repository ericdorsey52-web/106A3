//
//  ContentView.swift
//  106A3
//
//  Created by Eric Dorsey on 11/9/26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State
    
    @State private var tasks = [
        Task(title: "Complete SwiftUI assignment"),
        Task(title: "Study animation concepts"),
        Task(title: "Practice coding"),
        Task(title: "Submit homework")
    ]
    
    @State private var newTaskTitle = ""
    
    // MARK: - Computed Properties
    
    var completedTasks: Int {
        tasks.filter { $0.isDone }.count
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: - Progress Header
                    
                    ProgressHeader(
                        completedTasks: completedTasks,
                        totalTasks: tasks.count
                    )
                    .padding(.horizontal)
                    
                    // MARK: - Add Task Form
                    
                    HStack(spacing: 10) {
                        
                        TextField(
                            "New task...",
                            text: $newTaskTitle
                        )
                        .textFieldStyle(.roundedBorder)
                        
                        Button("Add") {
                            addTask()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(
                            newTaskTitle
                                .trimmingCharacters(
                                    in: .whitespaces
                                )
                                .isEmpty
                        )
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Task List
                    
                    LazyVStack(spacing: 12) {
                        
                        ForEach(tasks) { task in
                            
                            TaskRow(task: task)
                                .transition(
                                    .move(edge: .bottom)
                                    .combined(with: .opacity)
                                )
                                .onTapGesture {
                                    toggleTask(task)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("To-Do List")
        }
    }
    
    // MARK: - Add Task
    
    private func addTask() {
        let trimmedTitle = newTaskTitle
            .trimmingCharacters(in: .whitespaces)
        
        guard !trimmedTitle.isEmpty else {
            return
        }
        
        withAnimation(.easeInOut) {
            tasks.append(
                Task(title: trimmedTitle)
            )
        }
        
        newTaskTitle = ""
    }
    
    // MARK: - Toggle Task
    
    private func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(
            where: { $0.id == task.id }
        ) {
            withAnimation(.easeInOut) {
                tasks[index].isDone.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
