// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Struct {

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function get(uint _index) public view returns(string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function create(string calldata _text) public {
        // method 1
        todos.push(Todo(_text, false));

        // method 2 - key value pair
        todos.push(Todo({text: _text, completed: false}));

        // method 3 -initialize an empty array
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    function updateItems(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}