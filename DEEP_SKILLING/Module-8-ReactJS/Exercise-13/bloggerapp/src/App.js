import "./App.css";

import BookDetails from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";

function App() {

  return (

    <div className="container">

      <div className="column">
        <CourseDetails />
      </div>

      <div className="column">
        <BookDetails />
      </div>

      <div className="column">
        <BlogDetails />
      </div>

    </div>

  );

}

export default App;