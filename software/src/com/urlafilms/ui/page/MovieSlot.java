package com.urlafilms.ui.page;

import com.urlafilms.ui.elements.TextLabel;
import com.urlafilms.ui.elements.TextLabelBuilder;
import com.urlafilms.ui.elements.TextWeight;
import com.urlafilms.formatter.Time;
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
    private int emisionYear = 0;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    /**
     * Creates a new movie slot UI with the movie's information
     * @param title Movie's title
     * @param scenarioType Movie's scenario type
     * @param duration Movie's duration
     * @param emisionYear Movie's emission year
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public MovieSlot(String title, String scenarioType, int duration, int emisionYear)
    {
        this.title = title;
        this.scenarioType = scenarioType;
        this.duration = duration;
        this.emisionYear = emisionYear;
        
        this.generateUi();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Generates the slot's UI
     * @version 1.1
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    private void generateUi()
    {
        this.panel = new JPanel();
        this.panel.setOpaque(false);
        this.panel.setLayout(new BoxLayout(this.panel, BoxLayout.Y_AXIS));
        this.panel.setBorder(BorderFactory.createEmptyBorder(10, 15, 10, 15));

        TextLabel titleText = new TextLabelBuilder()
                .setText(this.title)
                .setTextWeight(TextWeight.Bold)
                .setTextSize(24)
                .build();
        
        TextLabel detailsText = new TextLabelBuilder()
                .setText(String.valueOf(this.emisionYear))
                .setTextColor(new Color(0xA0A0A0))
                .setTextWeight(TextWeight.Italic)
                .build();
        
        TextLabel durationText = new TextLabel(detailsText);
        durationText.setText("Duration: " + Time.format(this.duration * 60));

        TextLabel scenarioTypeText = new TextLabelBuilder()
                .setText(this.scenarioType)
                .build();

        titleText.setAlignmentX(Component.LEFT_ALIGNMENT);
        detailsText.setAlignmentX(Component.LEFT_ALIGNMENT);
        durationText.setAlignmentX(Component.LEFT_ALIGNMENT);
        scenarioTypeText.setAlignmentX(Component.LEFT_ALIGNMENT);

        this.panel.add(titleText);
        this.panel.add(Box.createVerticalStrut(5));
        this.panel.add(detailsText);
        this.panel.add(Box.createVerticalStrut(4));
        this.panel.add(durationText);
        this.panel.add(Box.createVerticalStrut(4));
        this.panel.add(scenarioTypeText);
        this.panel.add(Box.createVerticalStrut(10));

        JSeparator separator = new JSeparator();
        separator.setMaximumSize(new Dimension(Integer.MAX_VALUE, 1));
        separator.setAlignmentX(Component.LEFT_ALIGNMENT);

        this.panel.add(separator);
    }
}