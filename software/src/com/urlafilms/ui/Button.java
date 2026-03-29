package com.urlafilms.ui;

import javax.swing.JButton;
import java.awt.Color;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;

/**
 * Custom button class
 * @version 3.0
 * @author Álvaro Fernández Barrero
 */
public class Button extends JButton
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private int cornerRadius = 0;
    
    private double originGradientX = 0;
    private double originGradientY = 0;
    private double endingGradientX = 0;
    private double endingGradientY = 0;
    
    private Color colorGradientOrigin = new Color(0xFFFFFF);
    private Color colorGradientEnding = new Color(0xFFFFFF);
    
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
        super(text);
        this.setDefaultParameters();
    }
    
    /**
     * Creates a new button with the given text and gradient's parameters
     * @param text Text to contain in the button
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.2
     * @since 2.1
     * @author Álvaro Fernández Barrero
     */
    public Button(
            String text,
            double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding
    )
    {
        super(text);
        
        this.setGradient(originGradientX, originGradientY, colorGradientOrigin, endingGradientX, endingGradientY, colorGradientEnding);
        this.setDefaultParameters();
    }
    
    /**
     * Creates a new button with the given text and gradient's parameters
     * @param text Text to contain in the button
     * @param cornerRadius The radius for the button's corners
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.2
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    public Button(
            String text, int cornerRadius,
            double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding
    )
    {
        super(text);
        
        this.cornerRadius = cornerRadius;
        
        this.setGradient(originGradientX, originGradientY, colorGradientOrigin, endingGradientX, endingGradientY, colorGradientEnding);
        this.setDefaultParameters();
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
        super(button.getText());
        
        this.cornerRadius = button.getCornerRadius();
        this.setGradient(
                button.getOriginGradientX(), button.getOriginGradientY(), button.getColorGradientOrigin(),
                button.getEndingGradientX(), button.getEndingGradientY(), button.getColorGradientEnding()
        );
        this.setDefaultParameters();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Set default button's parameters
     * @version 1.0
     * @since 2.3
     * @author Álvaro Fernández Barrero
     */
    private void setDefaultParameters()
    {
        this.setContentAreaFilled(false);
        this.setOpaque(false);
        this.setBorderPainted(false);
    }
    
    @Override
    protected void paintComponent(Graphics graphics) {
        Graphics2D g2d = (Graphics2D) graphics.create();

        int width = getWidth();
        int height = getHeight();

        GradientPaint gradient = new GradientPaint(
            (int)(width * originGradientX), (int)(height * originGradientY), colorGradientOrigin,
            (int)(width * endingGradientX), (int)(height * endingGradientY), colorGradientEnding
        );

        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setPaint(gradient);
        g2d.fillRoundRect(0, 0, width, height, cornerRadius, cornerRadius);

        g2d.dispose();

        super.paintComponent(graphics);
    }
    
    // ---------------------------------------------------------
    // GETTERS & SETTERS
    // ---------------------------------------------------------
    
    /**
     * Sets the given gradient's parameters
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.2
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    private void setGradient(double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding)
    {
        this.originGradientX = originGradientX;
        this.originGradientY = originGradientY;
        this.endingGradientX = endingGradientX;
        this.endingGradientY = endingGradientY;
        this.colorGradientOrigin = colorGradientOrigin;
        this.colorGradientEnding = colorGradientEnding;
    }
    
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
     * Gets the origin horizontal point in percentage for the gradient
     * @return Origin horizontal point in percentage for the gradient
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public double getOriginGradientX()
    {
        return this.originGradientX;
    }
    
    /**
     * Gets the origin vertical point in percentage for the gradient
     * @return Origin vertical point in percentage for the gradient
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public double getOriginGradientY()
    {
        return this.originGradientY;
    }
    
    /**
     * Gets the starting color in the gradient
     * @return The starting color in the gradient
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public Color getColorGradientOrigin()
    {
        return this.colorGradientOrigin;
    }
    
    /**
     * Gets the ending horizontal point in percentage for the gradient
     * @return Ending horizontal point in percentage for the gradient
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public double getEndingGradientX()
    {
        return this.endingGradientX;
    }
    
    /**
     * Gets the ending vertical point in percentage for the gradient
     * @return Ending vertical point in percentage for the gradient
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public double getEndingGradientY()
    {
        return this.endingGradientY;
    }
    
    /**
     * Gets the ending color in the gradient
     * @return The ending color in the gradient
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public Color getColorGradientEnding()
    {
        return this.colorGradientEnding;
    }
}