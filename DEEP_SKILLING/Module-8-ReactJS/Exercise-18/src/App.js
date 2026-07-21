import './App.css';
import CohortDetails from './CohortDetails';
import { CohortsData } from './Cohort';

function App() {

  return (
    <div className="App">

      <h1>Cohort Details</h1>

      {
        CohortsData.map((cohort, index) => (
          <CohortDetails
            key={index}
            cohort={cohort}
          />
        ))
      }

    </div>
  );

}

export default App;