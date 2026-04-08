package com.urlafilms.ui.elements;

import java.awt.Color;
import java.awt.Font;
import javax.swing.JLabel;

/**
 * Class for text labels
 * @version 2.1
 * @author Álvaro Fernández Barrero
 */
public final class TextLabel extends JLabel
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    public static final Color DEFAULT_TEXT_COLOR = new Color(0xF0F0F0);
    
    private Color textColor = TextLabel.DEFAULT_TEXT_COLOR;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new default text label with no text
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel()
    {
        this("");
    }
    
    /**
     * Creates a new text label with the given parameters
     * @param text Text to contain in the text label
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(String text)
    {
        this(text, TextLabel.DEFAULT_TEXT_COLOR);
    }
    
    /**
     * Creates a new text label with the given parameters
     * @param text Text to contain in the text label
     * @param textColor Color to set to the text
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(String text, Color textColor)
    {
        this.setText(text);
        this.setTextColor(textColor);
    }
    
    /**
     * Creates a new text label with the given parameters
     * @param text Text to contain in the text label
     * @param textColor Color to set to the text
     * @param font Font to apply to the text
     * @version 1.1
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(String text, Color textColor, Font font)
    {
        this.setText(text);
        this.setTextColor(textColor);
        this.setFont(font);
    }
    
    /**
     * Copies the given textLabel
     * @param textLabel Text label to copy
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(TextLabel textLabel)
    {
        this(textLabel.getText(), textLabel.getTextColor(), textLabel.getFont());
    }
    
    // ---------------------------------------------------------
    // GETTERS & SETTERS
    // ---------------------------------------------------------
    
    /**
     * Gets the current text color
     * @return The current text color
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public Color getTextColor()
    {
        return this.textColor;
    }
    
    /**
     * Sets a color for the text
     * @param textColor Color to set to the text
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public void setTextColor(Color textColor)
    {
        this.textColor = textColor;
        this.setForeground(textColor);
    }
}