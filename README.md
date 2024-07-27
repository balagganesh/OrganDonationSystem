# Organ Donation System

## Project Overview

The Organ Donation Management System is a web application designed to manage the registration and donation of organs. It allows users to register as donors, request organs, and manage stock of available organs. The system provides functionalities for administrators to update donor information, manage organ requests, and track the stock of available organs.

## Features

- **Donor Management**: Register new donors, update donor information, and delete donor records.
- **Organ Requests**: Users can request specific organs, and administrators can manage these requests.
- **Stock Management**: Keep track of the stock of various organs, update stock levels, and view current stock.
- **User Notifications**: Notify users about the status of their requests.

## Technologies Used

- **Frontend**: HTML, CSS
- **Backend**: Java, JSP
- **Database**: SQL
- **Version Control**: Git, GitHub

## Getting Started

### Prerequisites

- Java Development Kit (JDK)
- Apache Tomcat Server
- MySQL or any other SQL database
- Git

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/balagganesh/OrganDonationSystem.git
    cd your-repository-name
    ```

2. **Set up the database**:

    - Create a new database in your SQL server.
    - Execute the SQL scripts provided in the `database` folder to create the required tables.

3. **Configure the project**:

    - Update the database connection details in `ConnectionProvider.java`:

        ```java
        // ConnectionProvider.java
        public static Connection getCon() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/your-database-name", 
                    "your-username", 
                    "your-password"
                );
                return con;
            } catch (Exception e) {
                System.out.println(e);
                return null;
            }
        }
        ```

4. **Deploy the project on Apache Tomcat**:

    - Copy the project directory to the `webapps` folder of your Tomcat installation.
    - Start the Tomcat server.
    - Access the application at `http://localhost:8080/OrganDonationSystem`.

## Usage

### Donor Management

- Register a new donor by navigating to the registration page and filling in the required details.
- Update donor information by selecting a donor from the list and making the necessary changes.
- Delete a donor record by selecting the delete option next to the donor's name.

### Organ Requests

- Request an organ by filling in the request form.
- View pending requests and mark them as completed or delete them as necessary.

### Stock Management

- View the current stock of organs.
- Update stock levels by selecting the organ and specifying the increase or decrease in quantity.

## Contribution

Contributions are welcome! Please fork the repository and submit a pull request for any changes you'd like to make.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any queries, please contact:

- **Name**: Balaganesh A
- **Email**: meetme.balaganesh@gmail.com
- **GitHub**: [balagganesh](https://github.com/balagganesh)

---

