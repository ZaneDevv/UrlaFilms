package com.urlafilms.database;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Class for common SQL queries
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public class Access
{
    public static ResultSet getFullInformationFromTable(String tableName) throws SQLException
    {
        return Conector.executeQuery("SELECT * FROM " + tableName.trim());
    }
    
    public static ResultSet getMovies() throws SQLException
    {
        return Access.getFullInformationFromTable("Peliculas");
    }
}
