package com.urlafilms.ui.page;

import com.urlafilms.ui.MainUi;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 * Abstract class for UI pages
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public abstract class UiPage
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static byte pagesAmount = 0;
    
    protected byte pageIndex = 0;
    
    protected boolean isActive = false;
    protected JPanel panel = null;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new UI page
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public UiPage()
    {
        UiPage.pagesAmount++;
        
        this.pageIndex = UiPage.pagesAmount;
        this.generateUi();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Generates the page UI
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void generateUi()
    {
        this.panel = new JPanel();
        this.panel.setOpaque(false);
        
        MainUi.frame.add(panel, "Page#" + UiPage.pagesAmount);
    }
    
    /**
     * Activates the page
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void activate()
    {
        this.isActive = true;
    }
    
    /**
     * Desactivates the page
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void desactivate()
    {
        this.isActive = false;
    }
    
    /**
     * Generates a resized image label
     * @param imagePath Path to the image
     * @param width Image's width
     * @param height Image's height
     * @return JLabel containing the resized image
     * @version 1.3
     * @since 1.4
     * @author Álvaro Fernández Barrero
     */
    protected static JLabel generateImage(String imagePath, int width, int height)
    {
        ImageIcon originalIcon = new ImageIcon(imagePath);
        Image scaledImage = originalIcon.getImage().getScaledInstance(width, height, Image.SCALE_SMOOTH);

        ImageIcon resizedIcon = new ImageIcon(scaledImage);

        JLabel label = new JLabel();
        label.setIcon(resizedIcon);

        return label;
    }
    
    // ---------------------------------------------------------
    // GETTERS & SETTERS
    // ---------------------------------------------------------
    
    /**
     * Gets true if the page is active, false otherwise
     * @return The page's status
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public boolean getIsActive()
    {
        return this.isActive;
    }
}
