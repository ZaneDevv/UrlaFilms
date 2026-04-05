package com.urlafilms.ui.elements;

import java.awt.Color;
import java.awt.Font;
import javax.swing.JLabel;

/**
 * Class for text labels
 * @version 2.1
 * @author Álvaro Fernández Barrero
 */
public class TextLabel extends JLabel
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
        this(text, DEFAULT_TEXT_COLOR);
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
     * Creates a new text label with the given parameters
     * @param text Text to contain in the text label
     * @param textColor Color to set to the text
     * @param font Font to apply to the text
     * @version 1.0
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(String text, Color textColor, String font)
    {
        this(text, textColor, new Font(font, Font.PLAIN, 14));
    }
    
    /**
     * Creates a new text label with the given parameters
     * @param text Text to contain in the text label
     * @param textColor Color to set to the text
     * @param textWeight Text weight
     * @see TextWeight
     * @version 1.0
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(String text, Color textColor, TextWeight textWeight)
    {
        this(text, textColor, new Font("SansSerif", TextLabel.convertTextWeightToNumber(textWeight), 14));
    }
    
    /**
     * Creates a new text label with the given parameters
     * @param text Text to contain in the text label
     * @param textColor Color to set to the text
     * @param textSize Text size
     * @version 1.0
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(String text, Color textColor, int textSize)
    {
        this(text, textColor, new Font("SansSerif", Font.PLAIN, textSize));
    }
    
    /**
     * Creates a new text label with the given parameters
     * @param text Text to contain in the text label
     * @param textColor Color to set to the text
     * @param font Font to apply to the text
     * @param textWeight Text weight
     * @param textSize Text size
     * @see TextWeight
     * @version 1.0
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    public TextLabel(String text, Color textColor, String font, TextWeight textWeight, int textSize)
    {
        this(text, textColor, new Font(font, TextLabel.convertTextWeightToNumber(textWeight), textSize));
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
        this(textLabel.getText(), textLabel.getTextColor());
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Converts the text weight to a normal number in order to make it accessible for swing
     * @param textWeight Text weight to convert
     * @return Text weight converted to number
     * @version 1.0
     * @since 2.0
     * @author Álvaro Fernández Barrero
     */
    private static int convertTextWeightToNumber(TextWeight textWeight)
    {
        return textWeight == TextWeight.Bold ? Font.BOLD : textWeight == TextWeight.Normal ? Font.PLAIN : Font.ITALIC;
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
