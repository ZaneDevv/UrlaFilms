package com.urlafilms.ui.page;

import com.urlafilms.ui.elements.Button;
import com.urlafilms.ui.elements.ButtonBuilder;
import com.urlafilms.ui.MainUi;
import java.awt.Dimension;
import javax.swing.Box;
import javax.swing.JLabel;

/**
 * Main UI page class
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public class MainPage extends UiPage
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static MainPage singletonPage = null;
    
    // ---------------------------------------------------------
    // CONSTRUCTORS
    // ---------------------------------------------------------
    
    public MainPage() throws Exception
    {
        super();
        
        if (MainPage.singletonPage != null)
        {
            throw new Exception("Main page was already created!");
        }
        
        MainPage.singletonPage = this;
        this.generateUi();
    }
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    @Override
    public void generateUi()
    {
        super.generateUi();
        
        int extendedLogoWidth = MainUi.SCREEN_WIDTH - 50;
        JLabel extendedLogoLabel = UiPage.generateImage("../img/extendedLogo.png", extendedLogoWidth, extendedLogoWidth / 2);
        extendedLogoLabel.setAlignmentX(JLabel.CENTER_ALIGNMENT);

        Button registerMovie = new ButtonBuilder()
                .setText("Registrar película")
                .setCornerRadius(12)
                .setGradient(0, 0, 0xF0F0F0, 0, 1, 0x959595)
                .build();

        registerMovie.setAlignmentX(JLabel.CENTER_ALIGNMENT);

        Button checkInfoMovie = new Button(registerMovie);
        checkInfoMovie.setText("Obtener información");
        checkInfoMovie.setAlignmentX(JLabel.CENTER_ALIGNMENT);

        this.panel.setLayout(new javax.swing.BoxLayout(this.panel, javax.swing.BoxLayout.Y_AXIS));
        
        this.panel.add(Box.createVerticalGlue());
        this.panel.add(extendedLogoLabel);
        this.panel.add(Box.createRigidArea(new Dimension(0, 20)));
        this.panel.add(registerMovie);
        this.panel.add(Box.createRigidArea(new Dimension(0, 10)));
        this.panel.add(checkInfoMovie);
        this.panel.add(Box.createVerticalGlue());
        
        
        checkInfoMovie.addActionListener(e -> {
            
        });
    }
}