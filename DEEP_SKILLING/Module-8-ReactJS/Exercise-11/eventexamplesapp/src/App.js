import './App.css';
import { useState } from 'react';
import CurrencyConvertor from './CurrencyConvertor';

function App() {

  const [count, setCount] = useState(0);

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  const sayHello = () => {
    alert("Hello! Member1");
  };

  const incrementAndHello = () => {
    increment();
    sayHello();
  };

  const sayWelcome = (message) => {
    alert(message);
  };

  const handleClick = () => {
    alert("I was clicked");
  };

  return (

    <div style={{ margin: "20px" }}>

      <h2>{count}</h2>

      <button onClick={incrementAndHello}>
        Increment
      </button>

      <br /><br />

      <button onClick={decrement}>
        Decrement
      </button>

      <br /><br />

      <button onClick={() => sayWelcome("Welcome")}>
        Say Welcome
      </button>

      <br /><br />

      <button onClick={handleClick}>
        Click on me
      </button>

      <br /><br />

      <CurrencyConvertor />

    </div>

  );

}

export default App;