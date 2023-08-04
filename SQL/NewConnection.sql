--To create new connections on MySQL/MariaDB:

--1)Connect as the Root User: Through terminal command: MySQL -u root -p 

--2)Create a New User: 
  CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'password_here';

--3)To Grant All Privileges: 
  GRANT ALL PRIVILEGES ON *.* TO 'new_user'@'localhost' WITH GRANT OPTION;
-- Revoke all privileges from 'new_user'
  REVOKE ALL PRIVILEGES ON *.* FROM 'new_user'@'localhost';
-- Grant SELECT privilege on a specific database (e.g., 'my_database')
  GRANT SELECT ON my_database.* TO 'new_user'@'localhost';

--4)Flush Privileges: After creating the user and granting privileges, it's a good practice to reload the grant tables in 
--the MySQL/MariaDB server memory to apply the changes immediately:
FLUSH PRIVILEGES;
--5)This will display the current privileges: 
SHOW GRANTS FOR 'new_user'@'localhost';
/*
Now you can use a different username while creating a new connection:

Open MySQL Workbench: Launch MySQL Workbench on your computer.

Open the "Home" Tab: In the home screen of MySQL Workbench, click on the "+" icon located under "MySQL Connections" to create
 a new connection.

Configure Connection Parameters:

Connection Name: Give a meaningful name for the connection (e.g., "My App Connection").
Connection Method: Choose the appropriate connection method based on your server setup (e.g., Standard TCP/IP, Standard TCP/IP over SSH).
Hostname: Enter the hostname or IP address of the MySQL/MariaDB server you want to connect to. For a local server, 
you can use "127.0.0.1" or "localhost."
Port: Specify the port number on which the MySQL/MariaDB server is running (usually 3306).
Username: Enter the username you want to use for this connection. This can be any valid username you have created on the MySQL/MariaDB
server with the necessary privileges.
Password: Provide the password for the specified username.
SSH Hostname (Optional): If you are connecting through SSH, provide the SSH hostname or IP address.
SSH Username (Optional): If you are using SSH, enter the SSH username.
SSH Password / Key File (Optional): Provide the SSH password or the path to the SSH private key file if needed.
Default Schema (Optional): Optionally, set a default schema (database) for this connection.
Test the Connection: Click on the "Test Connection" button to verify that the connection details are correct,
and MySQL Workbench can connect to the MySQL/MariaDB server using the specified username and password.

Save the Connection: If the test is successful, click on the "OK" button to save the new connection. 
It will now appear under the "MySQL Connections" section on the home screen.

Connect to the Database: To connect to the newly created connection using the non-root username, double-click on
its name under the "MySQL Connections" section.

By using a different username for your connections, you can practice the principle of least privilege and enhance
the security of your MySQL/MariaDB server by limiting the privileges of individual users to only the necessary actions they require.
*/
