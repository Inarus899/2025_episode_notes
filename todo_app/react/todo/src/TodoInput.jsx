import React, { useState } from 'react';

function TodoInput({ addTodo }) {
    const [newTodo, setNewTodo] = useState('');

    const handleInputChange = (event) => {
        setNewTodo(event.target.value);
    };

    const handleAddTodo = () => {
        addTodo(newTodo);
        setNewTodo('');
    };

    return(
        <>
            <input
                type="text"
                value={newTodo}
                onChange={handleInputChange}
                placeholder="Some task"
            />
            <button onClick={handleAddTodo}>Add</button>
        </>
    );
}

export default TodoInput;
