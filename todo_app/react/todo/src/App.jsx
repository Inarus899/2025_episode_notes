import { useState } from 'react'
import TodoInput from './TodoInput';
import TodoList from './TodoList';

function App() {
    const [todos, setTodos] = useState([]);

    const addTodo = (text) => {
        if (text.trim() !== '') {
            setTodos([...todos, { id: Date.now(), text: text.trim() }]);
        }
    };
    
    const deleteTodo = (id) => {
        setTodos(todos.filter(todo => todo.id !== id));
    };

    return (
        <>
            <h1>Todo List</h1>
            <TodoInput addTodo={addTodo} />
            <TodoList todos={todos} deleteTodo={deleteTodo} />
        </>
    );
}

export default App
