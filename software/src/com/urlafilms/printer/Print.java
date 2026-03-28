package com.urlafilms.printer;

/**
 * Print utils to have a better looking output
 * @see https://stackoverflow.com/questions/5762491/how-to-print-color-in-console-using-system-out-println
 * @version 1.0
 * @author Álvaro Fernández Barrero
 */
public final class Print
{
    // ---------------------------------------------------------
    // CONSTANTS
    // ---------------------------------------------------------

    public static final String ANSI_RESET = "\u001B[0m";

    // Text colors

    public static final String ANSI_BLACK = "\u001B[30m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";
    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_WHITE = "\u001B[37m";

    // Background colors

    public static final String ANSI_BLACK_BACKGROUND = "\u001B[40m";
    public static final String ANSI_RED_BACKGROUND = "\u001B[41m";
    public static final String ANSI_GREEN_BACKGROUND = "\u001B[42m";
    public static final String ANSI_YELLOW_BACKGROUND = "\u001B[43m";
    public static final String ANSI_BLUE_BACKGROUND = "\u001B[44m";
    public static final String ANSI_PURPLE_BACKGROUND = "\u001B[45m";
    public static final String ANSI_CYAN_BACKGROUND = "\u001B[46m";
    public static final String ANSI_WHITE_BACKGROUND = "\u001B[47m";
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Prints a text in form of an error adding a final break of line
     * @param message Message to print as an error
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void errorln(String message)
    {
        System.out.println(Print.ANSI_RED + message + Print.ANSI_RESET);
    }
    
    /**
     * Prints a text in form of an error
     * @param message Message to print as an error
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void error(String message)
    {
        System.out.print(Print.ANSI_RED + message + Print.ANSI_RESET);
    }
    
    /**
     * Prints a text in form of a warn adding a final break of line
     * @param message Message to print as a warn
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void warnln(String message)
    {
        System.out.println(Print.ANSI_YELLOW + message + Print.ANSI_RESET);
    }
    
    /**
     * Prints a text in form of a warn
     * @param message Message to print as a warn
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void warn(String message)
    {
        System.out.print(Print.ANSI_YELLOW + message + Print.ANSI_RESET);
    }
    
    /**
     * Prints a text in form of a hint adding a final break of line
     * @param message Message to print as a hint
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void hintln(String message)
    {
        System.out.println(Print.ANSI_CYAN + message + Print.ANSI_RESET);
    }
    
    /**
     * Prints a text in form of a hint
     * @param message Message to print as a hint
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void hint(String message)
    {
        System.out.print(Print.ANSI_CYAN + message + Print.ANSI_RESET);
    }
    
    /**
     * Prints a text in form of a success adding a final break of line
     * @param message Message to print as a success
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void successln(String message)
    {
        System.out.println(Print.ANSI_GREEN + message + Print.ANSI_RESET);
    }
    
    /**
     * Prints a text in form of a success
     * @param message Message to print as a success
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static void success(String message)
    {
        System.out.print(Print.ANSI_GREEN + message + Print.ANSI_RESET);
    }
}
