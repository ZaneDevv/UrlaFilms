package com.urlafilms.ui.page;

import com.urlafilms.database.Access;
import com.urlafilms.ui.MainUi;
import com.urlafilms.ui.elements.Button;
import com.urlafilms.ui.elements.ButtonBuilder;
import com.urlafilms.ui.elements.Scroll;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;

/**
 * Check information UI page class
 * @version 2.3
 * @author Álvaro Fernández Barrero
 */
public final class CheckInfoPage extends UiPage
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static CheckInfoPage singletonPage = null;
    
    private MovieSlotFactory movieSlotFactory = null;
    
    private JPanel contentPanel = null;
    
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
        if (CheckInfoPage.singletonPage != null)
        {
            throw new Exception("Check information page was already created!");
        }
        
        super();
        
        this.movieSlotFactory = new MovieSlotFactory();
        CheckInfoPage.singletonPage = this;
        
        this.generateUi();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    @Override
    public void generateUi()
    {
        super.generateUi();

        this.panel.setLayout(new BorderLayout());

        Button backButton = new ButtonBuilder()
                .setText("<")
                .build();

        this.contentPanel = new JPanel();
        this.contentPanel.setOpaque(false);
        this.contentPanel.setLayout(new BoxLayout(this.contentPanel, BoxLayout.Y_AXIS));

        JScrollPane scrollPane = new JScrollPane(this.contentPanel);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        scrollPane.setPreferredSize(new Dimension(MainUi.SCREEN_WIDTH - 25, MainUi.SCREEN_HEIGHT - 100));
        scrollPane.setOpaque(false);
        scrollPane.getViewport().setOpaque(false);
        scrollPane.setBorder(null);
        scrollPane.getViewport().setBorder(null);
        scrollPane.setCorner(JScrollPane.UPPER_RIGHT_CORNER, new JPanel() {{ setOpaque(false); }});
        scrollPane.setCorner(JScrollPane.LOWER_RIGHT_CORNER, new JPanel() {{ setOpaque(false); }});
        scrollPane.setCorner(JScrollPane.UPPER_LEFT_CORNER, new JPanel() {{ setOpaque(false); }});
        scrollPane.setCorner(JScrollPane.LOWER_LEFT_CORNER, new JPanel() {{ setOpaque(false); }});

        JScrollBar verticalBar = scrollPane.getVerticalScrollBar();
        verticalBar.setUI(new Scroll());
        verticalBar.setPreferredSize(new Dimension(10, 0));
        verticalBar.setOpaque(false);
        verticalBar.setBorder(null);
        verticalBar.setUnitIncrement(20);
        verticalBar.setBlockIncrement(100);

        this.panel.add(backButton, BorderLayout.NORTH);
        this.panel.add(scrollPane, BorderLayout.CENTER);
        
        
        this.generateMovieSlots();
    }
    
    /**
     * Generates the movie's slot
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private void generateMovieSlots()
    {
        try (ResultSet result = Access.getMovies())
        {
            while (result.next())
            {
                MovieSlot slot = this.movieSlotFactory.generateByQueryResult(result);
                this.contentPanel.add(slot.panel);
            }
        }
        catch (SQLException exception)
        {
            exception.printStackTrace();
        }
    }
}