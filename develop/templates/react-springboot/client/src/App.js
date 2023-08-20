import logo from './logo.svg';
import './App.css';
import {useDispatch, useSelector} from "react-redux";
import dataService from "./services/DataService";
import {useEffect} from "react";

function App() {
  const { data } = useSelector(state => state.data)
  const dispatch = useDispatch();

  useEffect (() => {
    dispatch(dataService.getHello());
  }, [dispatch])

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          {data.message}
        </a>
      </header>
    </div>
  );
}

export default App;
