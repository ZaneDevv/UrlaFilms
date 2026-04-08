package com.urlafilms.ui.elements;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.plaf.basic.BasicScrollBarUI;

/**
 * Scroll class (modern)
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public final class Scroll extends BasicScrollBarUI
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static final Color THUMB_COLOR = new Color(90, 90, 90, 180);
    private static final Color THUMB_COLOR_ROLLOVER = new Color(130, 130, 130, 220);
    private static final Color THUMB_COLOR_NO_ROLLOVER = new Color(100, 100, 100, 200);
    private static final Color TRACK_COLOR = new Color(20, 20, 20, 80);
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    @Override
    protected void configureScrollBarColors()
    {
        this.thumbColor = Scroll.THUMB_COLOR;
        this.trackColor = Scroll.TRACK_COLOR;
    }

    @Override
    protected JButton createDecreaseButton(int orientation)
    {
        return createZeroButton();
    }

    @Override
    protected JButton createIncreaseButton(int orientation)
    {
        return createZeroButton();
    }

    /**
     * Creates a new button with no dimensions
     * @return The created button
     * @version 1.0
     * @since 1.0
     */
    private JButton createZeroButton() {
        JButton button = new JButton();
        
        button.setPreferredSize(new Dimension(0, 0));
        button.setMinimumSize(new Dimension(0, 0));
        button.setMaximumSize(new Dimension(0, 0));
        
        return button;
    }

    @Override
    protected void paintTrack(Graphics graphics, JComponent component, Rectangle bounds)
    {
        Graphics2D graphics2d = (Graphics2D)graphics.create();

        graphics2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2d.setColor(trackColor);
        graphics2d.fillRoundRect(
            bounds.x + 2,
            bounds.y,
            bounds.width - 4,
            bounds.height,
            10,
            10
        );

        graphics2d.dispose();
    }

    @Override
    protected void paintThumb(Graphics graphics, JComponent component, Rectangle bounds)
    {
        if (bounds.isEmpty() || !scrollbar.isEnabled())
        {
            return;
        }

        Graphics2D graphics2d = (Graphics2D)graphics.create();
        graphics2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2d.setColor(isThumbRollover() ? Scroll.THUMB_COLOR_ROLLOVER : Scroll.THUMB_COLOR_NO_ROLLOVER);
        graphics2d.fillRoundRect(
            bounds.x + 2,
            bounds.y + 2,
            bounds.width - 4,
            bounds.height - 4,
            10,
            10
        );
        graphics2d.dispose();
    }

    @Override
    protected Dimension getMinimumThumbSize()
    {
        return new Dimension(8, 50);
    }
}