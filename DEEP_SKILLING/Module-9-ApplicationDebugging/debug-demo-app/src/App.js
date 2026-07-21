import { useState } from "react";
import "./App.css";

function App() {

  const [count, setCount] = useState(0);

  const increment = () => {
    debugger;
    setCount(count + 1);
  };

  const decrement = () => {
    debugger;
    setCount(count - 1);
  };

  return (
    <div className="App">
      <h1>Application Debugging Demo</h1>

      <h2>Counter : {count}</h2>

      <button onClick={increment}>Increment</button>

      <button onClick={decrement}>Decrement</button>

      <hr />

      <p>
        Open <b>Chrome DevTools (F12)</b> and click the buttons.
      </p>

      <p>
        The <b>debugger</b> statement will pause execution so you can inspect
        variables and application state.
      </p>

    </div>
  );
}

export default App;