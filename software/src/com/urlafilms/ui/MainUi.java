package com.urlafilms.ui;

import com.urlafilms.printer.Print;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Image;
import javax.swing.Box;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 * Generates the entire UI
 * @version 2.2
 * @author Álvaro Fernández Barrero
 */
public class MainUi
{
    // ---------------------------------------------------------
    // CONSTANTA
    // ---------------------------------------------------------
    
    final static int SCREEN_WIDTH = 600;
    final static int SCREEN_HEIGHT = 600;
    
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------

    private static MainUi singletonInstance = null;
    
    private ImageIcon logo = new ImageIcon("../img/logo.png");

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
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private void generateUi()
    {
        JFrame frame = new JFrame();
        frame.setTitle("Urla Films");
        frame.setSize(MainUi.SCREEN_WIDTH, MainUi.SCREEN_HEIGHT);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setResizable(false);
        frame.setIconImage(logo.getImage());

        this.setGradient(frame, 0, 0, new Color(0x1A1A20), 0.25, 1, new Color(0x101016));
        
        CardLayout cardLayout = new CardLayout();
        JPanel mainPanel = new JPanel(cardLayout);
        mainPanel.setOpaque(false);
        
        mainPanel.add(this.generateHomeUi(), "HOME");

        frame.add(mainPanel);

        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
    
    /**
     * Generates the home UI
     * @version 2.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private JPanel generateHomeUi()
    {
        int extendedLogoWidth = MainUi.SCREEN_WIDTH - 50;
        JLabel extendedLogoLabel = this.generateImage("../img/extendedLogo.png", extendedLogoWidth, extendedLogoWidth / 2);
        extendedLogoLabel.setAlignmentX(JLabel.CENTER_ALIGNMENT);

        Button registerMovie = new ButtonBuilder()
                .setText("Registrar película")
                .setCornerRadius(12)
                .setGradient(0, 0, 0xF0F0F0, 0, 1, 0x959595)
                .build();

        registerMovie.setAlignmentX(JLabel.CENTER_ALIGNMENT);

        Button checkInfoMovie = new Button(registerMovie);
        checkInfoMovie.setText("Obtener información");
        checkInfoMovie.setAlignmentX(JLabel.CENTER_ALIGNMENT);

        JPanel panel = new JPanel();
        panel.setLayout(new javax.swing.BoxLayout(panel, javax.swing.BoxLayout.Y_AXIS));
        panel.setOpaque(false);
        
        panel.add(Box.createVerticalGlue());
        panel.add(extendedLogoLabel);
        panel.add(Box.createRigidArea(new Dimension(0, 20)));
        panel.add(registerMovie);
        panel.add(Box.createRigidArea(new Dimension(0, 10)));
        panel.add(checkInfoMovie);
        panel.add(Box.createVerticalGlue());

        return panel;
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
    private JLabel generateImage(String imagePath, int width, int height)
    {
        ImageIcon originalIcon = new ImageIcon(imagePath);
        Image scaledImage = originalIcon.getImage().getScaledInstance(width, height, Image.SCALE_SMOOTH);

        ImageIcon resizedIcon = new ImageIcon(scaledImage);

        JLabel label = new JLabel();
        label.setIcon(resizedIcon);

        return label;
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