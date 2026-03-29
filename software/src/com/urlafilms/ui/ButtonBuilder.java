package com.urlafilms.ui;

import com.urlafilms.ui.Button;
import java.awt.Color;

/**
 * Button builder class
 * @version 1.3
 * @author Álvaro Fernández Barrero
 */
public class ButtonBuilder
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private String text = "";
    
    private int cornerRadius = 0;
    
    private double originGradientX = 0;
    private double originGradientY = 0;
    private double endingGradientX = 0;
    private double endingGradientY = 0;
    
    private Color colorGradientOrigin = new Color(0);
    private Color colorGradientEnding = new Color(0);
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Sets the text to contain in the button
     * @param text Text to contain in the button
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setText(String text)
    {
        this.text = text;
        return this;
    }
    
    /**
     * Sets the radius for the button's corners
     * @param cornerRadius The radius for the button's corners
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setCornerRadius(int cornerRadius)
    {
        this.cornerRadius = cornerRadius;
        return this;
    }
    
    /**
     * Sets the origin horizontal point in percentage for the gradient
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setOriginGradientX(double originGradientX)
    {
        this.originGradientX = originGradientX;
        return this;
    }
    
    /**
     * Sets the origin vertical point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setOriginGradientY(double originGradientY)
    {
        this.originGradientY = originGradientY;
        return this;
    }
    
    /**
     * Sets the starting color in the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setColorGradientOrigin(Color colorGradientOrigin)
    {
        this.colorGradientOrigin = colorGradientOrigin;
        return this;
    }
    
    /**
     * Sets the ending horizontal point in percentage for the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setEndingGradientX(double endingGradientX)
    {
        this.endingGradientX = endingGradientX;
        return this;
    }
    
    /**
     * Sets the ending vertical point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setEndingGradientY(double endingGradientY)
    {
        this.endingGradientY = endingGradientY;
        return this;
    }
    
    /**
     * Sets the ending color in the gradient 
     * @param colorGradientEnding The ending color in the gradient
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setColorGradientEnding(Color colorGradientEnding)
    {
        this.colorGradientEnding = colorGradientEnding;
        return this;
    }
    
    /**
     * Sets the given gradient's parameters
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setGradient(double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding)
    {
        this.originGradientX = originGradientX;
        this.originGradientY = originGradientY;
        this.endingGradientX = endingGradientX;
        this.endingGradientY = endingGradientY;
        this.colorGradientOrigin = colorGradientOrigin;
        this.colorGradientEnding = colorGradientEnding;
        
        return this;
    }
    
    /**
     * Creates the button according to the parameters set
     * @return The new button with the parameters set
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Button build()
    {
        return new Button(
                this.text, this.cornerRadius,
                this.originGradientX, this.originGradientY, this.colorGradientOrigin, this.endingGradientX, this.endingGradientY, this.colorGradientEnding
        );
    }
}