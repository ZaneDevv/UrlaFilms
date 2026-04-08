package com.urlafilms.ui.elements;

import java.awt.Color;
import java.awt.Font;

/**
 * Text label builder class
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public final class TextLabelBuilder
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private String text = "";
    private Color textColor = new Color(0xF0F0F0);
    
    private String fontFamily = "SansSerif";
    private int textWeight = Font.PLAIN;
    private int textSize = 14;
    private Font font;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new instance of this class
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabelBuilder()
    {
        this.updateFontObject();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Updates the font object given the set parameters
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private void updateFontObject()
    {
        this.font = new Font(this.fontFamily, this.textWeight, this.textSize);
    }
    
    /**
     * Sets the text to contain in the label
     * @param text Text to set to the new text label
     * @return The TextLabelBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabelBuilder setText(String text)
    {
        this.text = text;
        return this;
    }
    
    /**
     * Sets the text color for the label
     * @param textColor Color for the label's text
     * @return The TextLabelBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabelBuilder setTextColor(Color textColor)
    {
        this.textColor = textColor;
        return this;
    }
    
    /**
     * Sets the text's font
     * @param font Font for the text in the label
     * @return The TextLabelBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabelBuilder setFont(Font font)
    {
        this.font = font;
        return this;
    }
    
    /**
     * Sets the text's font family
     * @param fontFamily Font family for the text
     * @return The TextLabelBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabelBuilder setFontFamily(String fontFamily)
    {
        this.fontFamily = fontFamily;
        this.updateFontObject();
        
        return this;
    }
    
    /**
     * Sets the text weight
     * @param textWeight Text weight for the label
     * @return The TextLabelBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabelBuilder setTextWeight(TextWeight textWeight)
    {
        this.textWeight = textWeight == TextWeight.Bold ? Font.BOLD : textWeight == TextWeight.Normal ? Font.PLAIN : Font.ITALIC;
        this.updateFontObject();
        
        return this;
    }
    
    /**
     * Sets the text's size
     * @param textSize Text size in the label
     * @return The TextLabelBuilder's instance
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabelBuilder setTextSize(int textSize)
    {
        this.textSize = Math.abs(textSize);
        this.updateFontObject();
        
        return this;
    }
    
    /**
     * Builds the new text label given the set parameters
     * @return The next text label
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel build()
    {
        return new TextLabel(this.text, this.textColor, this.font);
    }
}