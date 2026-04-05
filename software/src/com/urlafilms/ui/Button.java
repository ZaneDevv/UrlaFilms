package com.urlafilms.ui;

import javax.swing.JButton;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;

/**
 * Custom button class
 * @version 3.1
 * @author Álvaro Fernández Barrero
 */
public class Button extends JButton
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private int cornerRadius = 0;
    
    private Gradient gradient;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new button with the given text
     * @param text Text to contain in the button
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Button(String text)
    {
        this(text, 0, new Gradient());
    }
    
    /**
     * Creates a new button with the given text and gradient's parameters
     * @param text Text to contain in the button
     * @param gradient Gradient instance
     * @version 1.2
     * @since 2.1
     * @author Álvaro Fernández Barrero
     */
    public Button(String text, Gradient gradient)
    {
        this(text, 0, gradient);
    }
    
    /**
     * Creates a new button with the given text and gradient's parameters
     * @param text Text to contain in the button
     * @param cornerRadius The radius for the button's corners
     * @param gradient Gradient instance
     * @version 1.2
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    public Button(String text, int cornerRadius, Gradient gradient)
    {
        super(text);
        
        this.cornerRadius = cornerRadius;
        this.gradient = gradient;
        
        this.setContentAreaFilled(false);
        this.setOpaque(false);
        this.setBorderPainted(false);
    }
    
    /**
     * Creates a copy of the given button
     * @param button Button to copy
     * @version 1.0
     * @since 1.5
     * @author Álvaro Fernández Barrero
     */
    public Button(Button button)
    {
        this(button.getText(), button.getCornerRadius(), button.getGradient());
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    @Override
    protected void paintComponent(Graphics graphics) {
        Graphics2D graphics2d = (Graphics2D) graphics.create();

        int width = getWidth();
        int height = getHeight();

        GradientPaint gradient = new GradientPaint(
            (int)(width * this.gradient.getOriginGradientX()), (int)(height * this.gradient.getOriginGradientY()), this.gradient.getColorGradientOrigin(),
            (int)(width * this.gradient.getEndingGradientX()), (int)(height * this.gradient.getEndingGradientY()), this.gradient.getColorGradientEnding()
        );

        graphics2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2d.setPaint(gradient);
        graphics2d.fillRoundRect(0, 0, width, height, cornerRadius, cornerRadius);

        graphics2d.dispose();

        super.paintComponent(graphics);
    }
    
    // ---------------------------------------------------------
    // GETTERS & SETTERS
    // ---------------------------------------------------------
    
    /**
     * Gets the radius for the button's corners
     * @return The radius for the button's corners
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public int getCornerRadius()
    {
        return this.cornerRadius;
    }
    
    /**
     * Gets the button's gradient
     * @return The button's gradient
     * @version 1.0
     * @since 3.0
     * @author Álvaro Fernández Barrero
     */
    public Gradient getGradient()
    {
        return this.gradient;
    }
}