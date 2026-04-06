package com.urlafilms.software;

import com.urlafilms.database.Conector;
import com.urlafilms.printer.Print;
import com.urlafilms.ui.MainUi;

/**
 * Initializes the whole project
 * @version 1.4
 * @author Álvaro Fernández Barrero
 * @hidden
 */
public class Software
{
    /**
     * Initializes the project
     * @param args Arguments set in the terminal once the code is ran
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void main(String[] args)
    {        
        try
        {
            new Conector();
            new MainUi();
        }
        catch (Exception exception)
        {
            Print.errorln(exception.getMessage());
        }
    }
}