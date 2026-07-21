import { useState } from "react";

function ComplaintRegister() {

    const [employeeName, setEmployeeName] = useState("");
    const [complaint, setComplaint] = useState("");

    const handleSubmit = (event) => {

        event.preventDefault();

        const referenceId = Math.floor(Math.random() * 100) + 1;

        alert(
            `Thanks ${employeeName}\nYour Complaint was Submitted.\nTransaction ID is: ${referenceId}`
        );
    };

    return (

        <div style={{ textAlign: "center" }}>

            <h1 style={{ color: "red" }}>
                Register your complaints here!!!
            </h1>

            <form onSubmit={handleSubmit}>

                <table
                    style={{
                        margin: "auto"
                    }}
                >

                    <tbody>

                        <tr>

                            <td>Name:</td>

                            <td>

                                <input
                                    type="text"
                                    value={employeeName}
                                    onChange={(e) =>
                                        setEmployeeName(e.target.value)
                                    }
                                />

                            </td>

                        </tr>

                        <tr>

                            <td>Complaint:</td>

                            <td>

                                <textarea
                                    rows="3"
                                    cols="20"
                                    value={complaint}
                                    onChange={(e) =>
                                        setComplaint(e.target.value)
                                    }
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

export default ComplaintRegister;