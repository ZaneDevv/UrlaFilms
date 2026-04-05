package com.urlafilms.ui;

import com.urlafilms.ui.page.*;
import com.urlafilms.printer.Print;
import java.awt.CardLayout;
import java.awt.Color;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 * Generates the entire UI
 * @version 2.2
 * @author Álvaro Fernández Barrero
 */
public class MainUi
{
    // ---------------------------------------------------------
    // CONSTANTS
    // ---------------------------------------------------------
    
    public final static int SCREEN_WIDTH = 600;
    public final static int SCREEN_HEIGHT = 600;
    
    private static final Color ORIGIN_GRADIENT_COLOR = new Color(0x1A1A20);
    private static final Color ENDING_GRADIENT_COLOR = new Color(0x101016);
    
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------

    private static MainUi singletonInstance = null;
    public static JFrame frame = null;
    
    private final ImageIcon favicon = new ImageIcon("../img/logo.png");

    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------

    /**
     * Generates the interface
     * @version 1.0
     * @since 1.0
     * @throws Exception The class can only be instantiated once
     * @author Álvaro Fernández Barrero
     */
    public MainUi() throws Exception
    {
        if (MainUi.singletonInstance != null)
        {
            throw new Exception("The class was already instantiated...");
        }

        MainUi.singletonInstance = this;
        
        Print.hintln("Generating GUI...");
        this.generateUi();
        Print.successln("GUI generated!");
    }

    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------

    /**
     * Generates the UI
     * @throws UI could not be created
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private void generateUi() throws Exception
    {
        MainUi.frame = new JFrame();
        MainUi.frame.setTitle("Urla Films");
        MainUi.frame.setSize(MainUi.SCREEN_WIDTH, MainUi.SCREEN_HEIGHT);
        MainUi.frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        MainUi.frame.setResizable(false);
        MainUi.frame.setIconImage(favicon.getImage());

        this.setGradient(MainUi.frame, 0, 0, MainUi.ORIGIN_GRADIENT_COLOR, 0.25, 1, ENDING_GRADIENT_COLOR);
        
        CardLayout cardLayout = new CardLayout();
        JPanel mainPanel = new JPanel(cardLayout);
        mainPanel.setOpaque(false);

        MainUi.frame.add(mainPanel);
        
        //new MainPage();
        new CheckInfoPage();

        MainUi.frame.setLocationRelativeTo(null);
        MainUi.frame.setVisible(true);
    }
    
    /**
     * Sets a gradient in the given frame's background with the given parameters
     * @param frame Frame to apply the gradient
     * @param originX Origin horizontal point in percentage for the gradient
     * @param originY Origin vertical point in percentage for the gradient
     * @param colorOrigin The starting color in the gradient
     * @param endingX Ending horizontal point in percentage for the gradient
     * @param endingY Ending vertical point in percentage for the gradient
     * @param colorEnding The ending color in the gradient
     * @version 2.4
     * @since 1.4
     * @author Álvaro Fernández Barrero
     */
    private void setGradient(JFrame frame, double originX, double originY, Color colorOrigin, double endingX, double endingY, Color colorEnding)
    {
        frame.setContentPane(new javax.swing.JPanel() {
            @Override
            protected void paintComponent(java.awt.Graphics graphics) {
                super.paintComponent(graphics);

                java.awt.Graphics2D graphics2d = (java.awt.Graphics2D)graphics;

                int width = this.getWidth();
                int height = this.getHeight();

                java.awt.GradientPaint gradient = new java.awt.GradientPaint(
                    (int)(width * originX), (int)(height * originY), colorOrigin,
                    (int)(width * endingX), (int)(height * endingY), colorEnding
                );

                graphics2d.setPaint(gradient);
                graphics2d.fillRect(0, 0, width, height);
            }
        });
    }
}