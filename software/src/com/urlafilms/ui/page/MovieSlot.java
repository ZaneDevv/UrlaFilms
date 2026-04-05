package com.urlafilms.ui.page;

import com.urlafilms.ui.elements.TextLabel;
import com.urlafilms.ui.elements.TextWeight;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JSeparator;

/**
 * Movie slot class
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public class MovieSlot
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    public JPanel panel = null;
    
    private String title = "";
    private String scenarioType = "";
    private int duration = 0;
    private int emmisionYear = 0;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    public MovieSlot(String title, String scenarioType, int duration, int emmisionYear)
    {
        this.title = title;
        this.scenarioType = scenarioType;
        this.duration = duration;
        this.emmisionYear = emmisionYear;
        
        this.generateUi();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    private void generateUi()
    {
        this.panel = new JPanel();
        this.panel.setOpaque(false);
        this.panel.setLayout(new BoxLayout(this.panel, BoxLayout.Y_AXIS));
        this.panel.setBorder(BorderFactory.createEmptyBorder(10, 15, 10, 15));

        TextLabel titleText = new TextLabel(this.title, TextLabel.DEFAULT_TEXT_COLOR, "SansSerif", TextWeight.Bold, 24);
        TextLabel detailsText = new TextLabel(
            this.emmisionYear + " - " + MovieSlot.formatDuration(this.duration),
                new Color(0xA0A0A0), "SansSerif", TextWeight.Italic, 14
        );
        TextLabel scenarioTypeText = new TextLabel(this.scenarioType, TextLabel.DEFAULT_TEXT_COLOR, "SansSerif", TextWeight.Normal, 14);

        titleText.setAlignmentX(Component.LEFT_ALIGNMENT);
        detailsText.setAlignmentX(Component.LEFT_ALIGNMENT);
        scenarioTypeText.setAlignmentX(Component.LEFT_ALIGNMENT);

        this.panel.add(titleText);
        this.panel.add(Box.createVerticalStrut(5));
        this.panel.add(detailsText);
        this.panel.add(Box.createVerticalStrut(4));
        this.panel.add(scenarioTypeText);
        this.panel.add(Box.createVerticalStrut(10));

        JSeparator separator = new JSeparator();
        separator.setMaximumSize(new Dimension(Integer.MAX_VALUE, 1));
        separator.setAlignmentX(Component.LEFT_ALIGNMENT);

        this.panel.add(separator);
    }
    
    /**
     * Formats the given second to digital time
     * @param duration Movie's duration
     * @return Given number with format 0:00:00
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private static String formatDuration(int duration)
    {
        return String.format("%d:%02d:%02d", duration / 3600, (duration / 60) % 60, duration % 60);
    }
    
    // ---------------------------------------------------------
    // GETTERS & SETTERS
    // ---------------------------------------------------------
}