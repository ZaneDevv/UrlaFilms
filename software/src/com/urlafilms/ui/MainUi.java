package com.urlafilms.ui;

import javax.swing.JFrame;

/**
 * Generates the entire UI
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public class MainUi
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static MainUi singletonInstance = null;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Generates the interface
     * @version 1.0
     * @since 1.0
     * @throws Exception The class was be only instantiated once
     * @author Álvaro Fernández Barrero
     */
    public MainUi() throws Exception
    {
        if (MainUi.singletonInstance != null)
        {
            throw new Exception("The class was already instantiated...");
        }
        
        MainUi.singletonInstance = this;
        this.generateUi();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Generates the UI
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private void generateUi()
    {
        JFrame frame = new JFrame();
        frame.setTitle("Urla Films");
        frame.setSize(600, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setResizable(false);
        frame.setVisible(true);
    }
}
