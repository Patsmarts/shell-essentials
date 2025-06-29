#!/bin/bash

TODO_FILE=~/todo.txt

# Ensure the todo file exists
touch "$TODO_FILE"

while true; do
    echo ""
    echo "===== PPU TO-DO MANAGER ====="
    echo "1. View all tasks"
    echo "2. Add a new task"
    echo "3. Delete a task"
    echo "4. Exit"
    echo "=============================="
    read -p "Choose an option [1-4]: " choice

    case $choice in
        1)
            echo ""
            echo "📋 Your Tasks:"
            if [[ -s $TODO_FILE ]]; then
                nl -w2 -s'. ' "$TODO_FILE"
            else
                echo "No tasks found."
            fi
            ;;
        2)
            read -p "Enter the new task: " task
            echo "$task" >> "$TODO_FILE"
            echo "✅ Task added."
            ;;
        3)
            nl -w2 -s'. ' "$TODO_FILE"
            read -p "Enter the task number to delete: " num
            sed -i "${num}d" "$TODO_FILE"
            echo "🗑️ Task deleted."
            ;;
        4)
            echo "👋 Goodbye!"
            break
            ;;
        *)
            echo "❌ Invalid option. Please choose 1-4."
            ;;
    esac
done

