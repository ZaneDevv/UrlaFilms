package com.urlafilms.ui.page;

import com.urlafilms.database.Access;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Check information UI page class
 * @version 2.1
 * @author Álvaro Fernández Barrero
 */
public class CheckInfoPage extends UiPage
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static CheckInfoPage singletonPage = null;
    
    private MovieSlotFactory movieSlotFactory = null;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new check information page
     * @throws Exception There is already a instance of this class
     * @version 1.2
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public CheckInfoPage() throws Exception
    {
        super();
        
        if (CheckInfoPage.singletonPage != null)
        {
            throw new Exception("Check information page was already created!");
        }
        
        this.movieSlotFactory = new MovieSlotFactory();
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
        
        if (this.movieSlotFactory == null)
        {
            this.movieSlotFactory = new MovieSlotFactory();
        }
        
        try (ResultSet result = Access.getMovies())
        {
            while (result.next())
            {
                MovieSlot slot = this.movieSlotFactory.generateByQueryResult(result);
                this.panel.add(slot.panel);
            }
        }
        catch (SQLException exception)
        {
            exception.printStackTrace();
        }
    }
}