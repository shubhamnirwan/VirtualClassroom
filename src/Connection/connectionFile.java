package Connection;
import java.sql.*;
import java.util.Properties;
import java.io.*;

public class connectionFile
{
	private connectionFile(){}
	private static Connection conn;
	public static Connection getConnection()
	
	
	{
	if(conn==null)
	{
	try
		{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
	
	/*		Class.forName(p.getProperty("driver"));
			System.out.println("DriverLoaded........");
			
			conn=DriverManager.getConnection(p.getProperty("url"),p.getProperty("user"),p.getProperty("password"));
			System.out.println("Connection established........");*/
		} 
		
		catch (ClassNotFoundException e) 
		{
			System.out.println("Driver Class not found........");
		} 
		catch (SQLException e) 
		{
			System.out.println("Driver manager is not working .......");
		}
		}
		return conn;
	}

}
   