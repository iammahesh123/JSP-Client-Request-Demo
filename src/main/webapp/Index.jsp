<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Client Request Handling</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .submitted-data {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .submitted-data p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Welcome to Client Request Handling</h1>
    <form method="post" action="server">
        <label for="name">Enter your name:</label>
        <input type="text" name="name" id="name" required><br>
        <label for="email">Enter your email:</label>
        <input type="email" name="email" id="email" required><br>
        <label for="age">Enter your age:</label>
        <input type="number" name="age" id="age" required><br>
        <label for="country">Select your country:</label>
        <select name="country" id="country" required>
            <option value="USA">USA</option>
            <option value="UK">UK</option>
            <option value="Canada">Canada</option>
            <option value="Australia">Australia</option>
            <!-- Add more options as needed -->
        </select><br>
        <input type="submit" value="Submit">
    </form>

    <%-- Display submitted data --%>
    <div >
        
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String ageParam = request.getParameter("age");
            int age = 0; // Default age value if parameter is missing or invalid
            if (ageParam != null && !ageParam.isEmpty()) {
                try {
                    age = Integer.parseInt(ageParam);
                } catch (NumberFormatException e) {
                    // Handle invalid age parameter
                    out.println("<p>Invalid age value</p>");
                }
            }
            String country = request.getParameter("country");

            if (name != null && email != null && country != null) {
                out.println("<p><strong>Name:</strong> " + name + "</p>");
                out.println("<p><strong>Email:</strong> " + email + "</p>");
                out.println("<p><strong>Age:</strong> " + age + "</p>");
                out.println("<p><strong>Country:</strong> " + country + "</p>");
            }
        %>
    </div>
</body>
</html>
