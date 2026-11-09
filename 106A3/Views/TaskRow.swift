//
//  TaskRow.swift
//  106A3
//
//  Created by Eric Dorsey on 11/9/26.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        HStack(spacing: 15) {
            
            Image(systemName: task.isDone
                  ? "checkmark.circle.fill"
                  : "circle")
                .font(.title2)
                .foregroundStyle(
                    task.isDone ? .green : .secondary
                )
            
            Text(task.title)
                .font(.body)
                .strikethrough(
                    task.isDone,
                    color: .secondary
                )
                .foregroundStyle(
                    task.isDone ? .secondary : .primary
                )
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
        )
        .opacity(task.isDone ? 0.5 : 1.0)
    }
}

#Preview {
    TaskRow(
        task: Task(
            title: "Complete SwiftUI assignment"
        )
    )
    .padding()
}
