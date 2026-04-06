package com.urlafilms.ui.elements;

import com.urlafilms.ui.Gradient;
import java.awt.Color;

/**
 * Button builder class
 * @version 1.4
 * @author Álvaro Fernández Barrero
 */
public class ButtonBuilder
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private String text = "";
    private int cornerRadius = 0;
    private Gradient gradient = new Gradient();
    
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
     * 
     * @param gradient The gradient
     * @return The ButtonBuilder's instance
     * @see Gradient
     * @version 1.0
     * @since 1.3
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setGradient(Gradient gradient)
    {
        this.gradient = gradient;
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
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setGradient(double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding)
    {
        this.gradient = new Gradient(originGradientX, originGradientY, colorGradientOrigin, endingGradientX, endingGradientY, colorGradientEnding);
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
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setGradient(double originGradientX, double originGradientY, int colorGradientOrigin, double endingGradientX, double endingGradientY, int colorGradientEnding)
    {
        this.gradient = new Gradient(originGradientX, originGradientY, colorGradientOrigin, endingGradientX, endingGradientY, colorGradientEnding);
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
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setGradient(double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, int colorGradientEnding)
    {
        this.gradient = new Gradient(originGradientX, originGradientY, colorGradientOrigin, endingGradientX, endingGradientY, colorGradientEnding);
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
     * @return The ButtonBuilder's instance
     * @version 1.0
     * @since 1.2
     * @author Álvaro Fernández Barrero
     */
    public ButtonBuilder setGradient(double originGradientX, double originGradientY, int colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding)
    {
        this.gradient = new Gradient(originGradientX, originGradientY, colorGradientOrigin, endingGradientX, endingGradientY, colorGradientEnding);
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
        return new Button(this.text, this.cornerRadius, this.gradient);
    }
}