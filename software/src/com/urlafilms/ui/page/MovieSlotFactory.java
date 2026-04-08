package com.urlafilms.ui.page;

import com.urlafilms.database.Access;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Movie's slot factory class
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public final class MovieSlotFactory
{
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    public MovieSlot generateByQueryResult(ResultSet result) throws SQLException
    {
        return new MovieSlot(
            result.getString("titulo"),
            result.getString("tipoEscenario"),
            result.getInt("duracion"),
            result.getInt("anioEmision")
        );
    }
    
    /**
     * Creates a new movie slot with the information of the movie with the given ID
     * @param id Movie's ID
     * @return The slot created
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public MovieSlot generateById(int id)
    {
        MovieSlot slot = null;
        
        try (ResultSet result = Access.getMovies())
        {
            result.next();
            slot = this.generateByQueryResult(result);
        }
        catch (SQLException exception)
        {
            exception.printStackTrace();
        }
        
        return slot;
    }
}