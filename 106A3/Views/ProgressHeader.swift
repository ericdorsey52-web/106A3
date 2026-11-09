//
//  ProgressHeader.swift
//  106A3
//
//  Created by Eric Dorsey on 11/9/26.
//

import SwiftUI

struct ProgressHeader: View {
    let completedTasks: Int
    let totalTasks: Int
    
    var progress: Double {
        guard totalTasks > 0 else {
            return 0
        }
        
        return Double(completedTasks) / Double(totalTasks)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Text("My Tasks")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("\(completedTasks)/\(totalTasks)")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            
            ProgressView(value: progress)
                .tint(.blue)
        }
    }
}

#Preview {
    ProgressHeader(
        completedTasks: 2,
        totalTasks: 5
    )
    .padding()
}
