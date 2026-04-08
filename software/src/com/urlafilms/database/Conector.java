package com.urlafilms.database;

import com.urlafilms.printer.Print;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Generates a connection between the project and the database in order to either alter it or obtain information from it
 * @version 2.1
 * @author Álvaro Fernández Barrero
 */
public final class Conector
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
        
    static Connection connection = null;
    
    private String driverClass = "oracle.jdbc.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:XE";
    private String user = "system";
    private String password = "system1234";
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new connection to the database and activates it
     * @version 1.0
     * @since 1.0
     * @throws Exception The connector can be only instantiates once
     * @author Álvaro Fernández Barrero
     */
    public Conector() throws Exception
    {
        if (Conector.connection != null)
        {
            throw new Exception("The class was already instantiated, therefore, the connection was already made...");
        }
        
        this.connect();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Connects the class to the database
     * @version 1.2
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    void connect()
    {
        if (Conector.connection != null)
        {
            Print.warnln("You should not connect a connection that is already done!");
            return;
        }
        
        Print.hintln("Connecting to database...");
        
        try
        {
            Class.forName(this.driverClass);
            Conector.connection = DriverManager.getConnection(this.url, this.user, this.password);
            
            Print.successln("Connection has been made correctly!");
        }
        catch (Exception exception)
        {
            Print.errorln("Cannot connect to the database! " + exception.getMessage());
        }
    }
    
    /**
     * Disconnects the class to the database
     * @version 1.2
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    void disconnect()
    {
        if (Conector.connection == null)
        {
            Print.warnln("Cannot disconnect a connection that does not exist!");
            return;
        }
        
        try
        {
            Conector.connection.close();
            Print.successln("The connection has been removed correctly!");
        }
        catch (Exception exception)
        {
            Print.errorln("Cannot disconnect from the database! Error: " + exception.getMessage());
        }
    }
}