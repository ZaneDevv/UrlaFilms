package com.urlafilms.software;

import com.urlafilms.database.*;
import com.urlafilms.printer.Print;
import com.urlafilms.ui.MainUi;

/**
 * Initializes the whole project
 * @version 1.4
 * @author Álvaro Fernández Barrero
 */
public class Software
{
    public static void main(String[] args)
    {
        MainUi ui = null;
        
        try
        {
            ui = new MainUi();
        }
        catch (Exception exception)
        {
            Print.errorln(exception.getMessage());
        }
    }
}
