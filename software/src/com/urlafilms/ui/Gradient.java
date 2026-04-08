package com.urlafilms.ui;

import java.awt.Color;

/**
 * Gradient class
 * @version 1.1
 * @author Álvaro Fernández Barrero
 */
public final class Gradient
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private double originGradientX = 0;
    private double originGradientY = 0;
    private double endingGradientX = 0;
    private double endingGradientY = 1;
    
    private Color colorGradientOrigin = new Color(0xFFFFFF);
    private Color colorGradientEnding = new Color(0xFFFFFF);
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new gradient with the default parameters
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Gradient()
    {
    }
    
    /**
     * Makes a new gradient with the given parameters
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Gradient(double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding)
    {
        this.setOriginGradientX(originGradientX);
        this.setOriginGradientY(originGradientY);
        this.setEndingGradientX(endingGradientX);
        this.setEndingGradientY(endingGradientY);
        this.setColorGradientOrigin(colorGradientOrigin);
        this.setColorGradientEnding(colorGradientEnding);
    }
    
    /**
     * Makes a new gradient with the given parameters
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Gradient(double originGradientX, double originGradientY, int colorGradientOrigin, double endingGradientX, double endingGradientY, int colorGradientEnding)
    {
        this(originGradientX, originGradientY, new Color(colorGradientOrigin), endingGradientX, endingGradientY, new Color(colorGradientEnding));
    }
    
    /**
     * Makes a new gradient with the given parameters
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Gradient(double originGradientX, double originGradientY, Color colorGradientOrigin, double endingGradientX, double endingGradientY, int colorGradientEnding)
    {
        this(originGradientX, originGradientY, colorGradientOrigin, endingGradientX, endingGradientY, new Color(colorGradientEnding));
    }
    
    /**
     * Makes a new gradient with the given parameters
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Gradient(double originGradientX, double originGradientY, int colorGradientOrigin, double endingGradientX, double endingGradientY, Color colorGradientEnding)
    {
        this(originGradientX, originGradientY, new Color(colorGradientOrigin), endingGradientX, endingGradientY, colorGradientEnding);
    }
    
    /**
     * Copies the given gradient
     * @param gradient Gradient to copy
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Gradient(Gradient gradient)
    {
        this(
            gradient.getOriginGradientX(), gradient.getOriginGradientY(), gradient.getColorGradientOrigin(),
            gradient.getEndingGradientX(), gradient.getEndingGradientY(), gradient.getColorGradientEnding()
        );
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Set the given number within [0, 1]
     * @param x Number to limit
     * @return The given number limited within [0, 1]
     * @version 1.0
     * @since 1.1
     * @author Álvaro Fernández Barrero
     */
    private static double setNumberInRange01(double x)
    {
        return x < 0 ? 0 : x > 1 ? 1 : x;
    }
    
    /**
     * Ensures the gradient's horizontal limits make sense
     * @version 1.0
     * @since 1.1
     * @author Álvaro Fernández Barrero
     */
    private void ensureLimitsX()
    {
        this.originGradientX = Gradient.setNumberInRange01(this.originGradientX);
        this.endingGradientX = Gradient.setNumberInRange01(this.endingGradientX);
        
        if (this.originGradientX > this.endingGradientX)
        {
            this.endingGradientX = this.originGradientX;
        }
    }
    
    /**
     * Ensures the gradient's vertical limits make sense
     * @version 1.0
     * @since 1.1
     * @author Álvaro Fernández Barrero
     */
    private void ensureLimitsY()
    {
        this.originGradientY = Gradient.setNumberInRange01(this.originGradientY);
        this.endingGradientY = Gradient.setNumberInRange01(this.endingGradientY);
        
        if (this.originGradientY > this.endingGradientY)
        {
            this.endingGradientY = this.originGradientY;
        }
    }
    
    // ---------------------------------------------------------
    // GETTERS & SETTERS
    // ---------------------------------------------------------
    
    /**
     * Gets the origin horizontal point in percentage for the gradient
     * @return Origin horizontal point in percentage for the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public double getOriginGradientX()
    {
        return this.originGradientX;
    }
    
    /**
     * Sets the origin horizontal point in percentage for the gradient
     * @param originGradientX Origin horizontal point in percentage for the gradient
     * @version 1.1
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void setOriginGradientX(double originGradientX)
    {
        this.originGradientX = originGradientX;
        this.ensureLimitsX();
    }
    
    /**
     * Gets the origin vertical point in percentage for the gradient
     * @return Origin vertical point in percentage for the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public double getOriginGradientY()
    {
        return this.originGradientY;
    }
    
    /**
     * Sets the origin vertical point in percentage for the gradient
     * @param originGradientY Origin vertical point in percentage for the gradient
     * @version 1.1
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void setOriginGradientY(double originGradientY)
    {
        this.originGradientY = originGradientY;
        this.ensureLimitsY();
    }
    
    /**
     * Gets the starting color in the gradient
     * @return The starting color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Color getColorGradientOrigin()
    {
        return this.colorGradientOrigin;
    }
    
    /**
     * Sets the starting color in the gradient
     * @param colorGradientOrigin The starting color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void setColorGradientOrigin(Color colorGradientOrigin)
    {
        this.colorGradientOrigin = colorGradientOrigin;
    }
    
    /**
     * Gets the ending horizontal point in percentage for the gradient
     * @return Ending horizontal point in percentage for the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public double getEndingGradientX()
    {
        return this.endingGradientX;
    }
    
    /**
     * Sets the ending horizontal point in percentage for the gradient
     * @param endingGradientX Ending horizontal point in percentage for the gradient
     * @version 1.1
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void setEndingGradientX(double endingGradientX)
    {
        this.endingGradientX = endingGradientX;
        this.ensureLimitsX();
    }
    
    /**
     * Gets the ending vertical point in percentage for the gradient
     * @return Ending vertical point in percentage for the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public double getEndingGradientY()
    {
        return this.endingGradientY;
    }
    
    /**
     * Sets the ending vertical point in percentage for the gradient
     * @param endingGradientY Ending vertical point in percentage for the gradient
     * @version 1.1
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void setEndingGradientY(double endingGradientY)
    {
        this.endingGradientY = endingGradientY;
        this.ensureLimitsY();
    }
    
    /**
     * Gets the ending color in the gradient
     * @return The ending color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Color getColorGradientEnding()
    {
        return this.colorGradientEnding;
    }
    
    /**
     * Sets the ending color in the gradient
     * @param colorGradientEnding The ending color in the gradient
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void setColorGradientEnding(Color colorGradientEnding)
    {
        this.colorGradientEnding = colorGradientEnding;
    }
}
