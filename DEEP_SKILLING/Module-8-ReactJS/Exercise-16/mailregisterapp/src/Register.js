import { useState } from "react";

function Register() {

  const [fullName, setFullName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = (event) => {

    event.preventDefault();

    if (fullName.length < 5) {
      alert("Full Name must be 5 characters long!");
      return;
    }

    if (!email.includes("@") || !email.includes(".")) {
      alert("Email is not valid!");
      return;
    }

    if (password.length < 8) {
      alert("Password must be 8 characters long!");
      return;
    }

    alert("Valid Form");
  };

  return (

    <div style={{ textAlign: "center", marginTop: "50px" }}>

      <h1 style={{ color: "red" }}>
        Register Here!!!
      </h1>

      <form onSubmit={handleSubmit}>

        <table style={{ margin: "auto" }}>

          <tbody>

            <tr>

              <td>Name:</td>

              <td>

                <input
                  type="text"
                  value={fullName}
                  onChange={(e) => setFullName(e.target.value)}
                />

              </td>

            </tr>

            <tr>

              <td>Email:</td>

              <td>

                <input
                  type="text"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                />

              </td>

            </tr>

            <tr>

              <td>Password:</td>

              <td>

                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />

              </td>

            </tr>

            <tr>

              <td></td>

              <td>

                <button type="submit">
                  Submit
                </button>

              </td>

            </tr>

          </tbody>

        </table>

      </form>

    </div>

  );

}

export default Register;