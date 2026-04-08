package com.urlafilms.formatter;

/**
 * Time formatter class
 * @author Álvaro Fernández Barrero
 */
public final class Time
{
    // ---------------------------------------------------------
    // ATTRIBUTES
    // ---------------------------------------------------------
    
    private static int SECONDS_IN_A_MINUTE = 60;
    private static int SECONDS_IN_A_HOUR = 3600;
    
    // ---------------------------------------------------------
    // METHODS
    // ---------------------------------------------------------
    
    /**
     * Formats the given seconds in MM:SS format, excluding hours
     * @param seconds Seconds to format
     * @return Time formatted
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static String formatMMSS(int seconds)
    {
        int minutesToFormat = seconds / Time.SECONDS_IN_A_MINUTE;
        int secondsToFormat = seconds % Time.SECONDS_IN_A_MINUTE;
        
        return String.format("%02d:%02d", minutesToFormat, secondsToFormat);
    }
    
    /**
     * Formats the given seconds in H:MM:SS format
     * @param seconds Seconds to format
     * @return Time formatted
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static String formatHMMSS(int seconds)
    {
        int hoursToFormat = seconds / Time.SECONDS_IN_A_HOUR;
        int minutesToFormat = seconds / Time.SECONDS_IN_A_MINUTE % Time.SECONDS_IN_A_MINUTE;
        int secondsToFormat = seconds % Time.SECONDS_IN_A_MINUTE;
        
        return String.format("%d:%02d:%02d", hoursToFormat, minutesToFormat, secondsToFormat);
    }
    
    /**
     * Formats the given seconds in either H:MM:SS or MM:SS format, depending on how many seconds there are
     * @param seconds Seconds to format
     * @return Time formatted
     * @version 1.0
     * @since 1.0
     * @author Álvaro Fernández Barrero
     */
    public static String format(int seconds)
    {
        String formattedTime = "";
        
        if (seconds >= Time.SECONDS_IN_A_HOUR)
        {
            formattedTime = Time.formatHMMSS(seconds);
        }
        else
        {
            formattedTime = Time.formatMMSS(seconds);
        }
        
        return formattedTime;
    }
}