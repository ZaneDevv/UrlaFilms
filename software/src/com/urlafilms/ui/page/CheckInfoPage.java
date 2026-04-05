package com.urlafilms.ui.page;

import com.urlafilms.database.Access;
import com.urlafilms.ui.MainUi;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Check information UI page class
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public class CheckInfoPage extends UiPage
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static CheckInfoPage singletonPage = null;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    public CheckInfoPage() throws Exception
    {
        if (CheckInfoPage.singletonPage != null)
        {
            throw new Exception("Check information page was already created!");
        }
        
        super();
        CheckInfoPage.singletonPage = this;
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    @Override
    public void generateUi()
    {
        super.generateUi();
        this.panel.setLayout(new javax.swing.BoxLayout(this.panel, javax.swing.BoxLayout.Y_AXIS));
        
        try (ResultSet result = Access.getMovies())
        {
            while (result.next())
            {
                MovieSlot slot = new MovieSlot(
                        result.getString("titulo"),
                        result.getString("tipoEscenario"),
                        result.getInt("duracion"),
                        result.getInt("anioEmision")
                );
                
                this.panel.add(slot.panel);
            }
        }
        catch (SQLException exception)
        {
            exception.printStackTrace();
        }
    }
}