package com.urlafilms.database;

import com.urlafilms.printer.Print;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Class for common SQL queries
 * @version 1.1
 * @author Álvaro Fernández Barrero
 */
public class Access
{
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Executes the given SQL query offering information from it
     * @param query SQL query to run
     * @return The query's result
     * @throws SQLException The query is invalid
     * @version 1.2
     * @since 2.5
     * @author ÁLvaro Fernández Barrero
     */
    private static ResultSet executeQuery(String query) throws SQLException
    {
        Print.hintln("Running query: " + query);
        return Conector.connection.prepareStatement(query).executeQuery();
    }
    
    /**
     * Obtains all the elements with all the fields from the given table
     * @param tableName Table to obtain the information from
     * @return All the elements with all the fields from the given table
     * @throws SQLException The table's name does not exisst
     * @version 1.0
     * @since 1.0
     * @author ÁLvaro Fernández Barrero
     */
    public static ResultSet getFullInformationFromTable(String tableName) throws SQLException
    {
        return Access.executeQuery("SELECT * FROM " + tableName.trim());
    }
    
    /**
     * Obtains all the elements with all the fields from the table "Peliculas"
     * @return All the elements with all the fields from the table "Peliculas"
     * @throws SQLException Could not access to the table "Peliculas"
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static ResultSet getMovies() throws SQLException
    {
        return Access.getFullInformationFromTable("Peliculas");
    }
    
    /**
     * Obtains all the fields from the movie whose id corresponds to the set one
     * @param id Movie's ID
     * @throws SQLException Could not find the given ID in the table "Peliculas"
     * @version 1.0
     * @since 1.1
     * @author Álvaro Fernández Barrero
     */
    public static ResultSet getMovieById(int id) throws SQLException
    {
        return Access.executeQuery("SELECT * FROM Peliculas WHERE id = " + id);
    }
}