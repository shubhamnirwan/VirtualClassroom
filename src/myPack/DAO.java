package myPack;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import Connection.connectionFile;
import Model.UserModel;
public class DAO 
{

	Connection Conn;
	String SQL;
	PreparedStatement PST;
	ResultSet RS;
	public DAO()
	{
		Conn=connectionFile.getConnection();
	}
	
	public int UserSignUp(UserModel signup) throws SQLException // user Sign up
	{
		SQL="insert into data values(?,?,?,?,?,?,?)";
		PST=Conn.prepareStatement(SQL);
		PST.setString(1,signup.getUserName());
		PST.setString(2, signup.getFatherName());
		PST.setString(3, signup.getMotherName());
		PST.setString(4, signup.getAddress());
		PST.setLong(5, signup.getMobileNo());
		PST.setString(6,signup.getUserEmail());
		PST.setString(7,signup.getUserPassword());
		int x=PST.executeUpdate();
		System.out.println("User Signup done...");
			PST.close();
		if (x>0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
		
	}
	
	public int TeacherSignUp(UserModel signup) throws SQLException // user Sign up
	{
		SQL="insert into teacherdata values(?,?,?,?,?,?,?,?,?)";
		PST=Conn.prepareStatement(SQL);
		PST.setString(1,signup.getUserName());
		PST.setString(2, signup.getFatherName());
		PST.setString(3, signup.getMotherName());
		PST.setString(4, signup.getAddress());
		PST.setString(5,signup.getDesignation());
		PST.setString(6, signup.getDegree());
		PST.setLong(7, signup.getMobileNo());
		PST.setString(8,signup.getUserEmail());
		PST.setString(9,signup.getUserPassword());
		int x=PST.executeUpdate();
		System.out.println("teacher Signup done...");
			PST.close();
		if (x>0)
		{
			return 1;
		}
		else
		{
			return 0;
		}
		
	}
	public UserModel UserLogin(UserModel login) throws SQLException // user login
	{	
		SQL = "select * from data where USEREMAIL=? and USERPASSWORD=?";
		PST=Conn.prepareStatement(SQL);
		PST.setString(1, login.getUserEmail());
		PST.setString(2, login.getUserPassword());
		RS=PST.executeQuery();
		
		if(RS.next())
		{
			login.setUserName(RS.getString(1));
			login.setFatherName(RS.getString(2));
			login.setMotherName(RS.getString(3));
			login.setAddress(RS.getString(4));
			login.setMobileNo(RS.getLong(5));
			login.setUserEmail(RS.getString(6));
			
			return login;
		}
		else 
		{
			return null;
		}
		
	}
	
	public UserModel TeacherLogin(UserModel login) throws SQLException // user login
	{	
		SQL = "select * from teacherdata where USEREMAIL=? and USERPASSWORD=?";
		PST=Conn.prepareStatement(SQL);
		PST.setString(1, login.getUserEmail());
		PST.setString(2, login.getUserPassword());
		RS=PST.executeQuery();
		
		if(RS.next())
		{
			login.setUserName(RS.getString(1));
			login.setFatherName(RS.getString(2));
			login.setMotherName(RS.getString(3));
			login.setAddress(RS.getString(4));
			login.setDesignation(RS.getString(5));
			login.setDegree(RS.getString(6));
			login.setMobileNo(RS.getLong(7));
			login.setUserEmail(RS.getString(8));
			
			
			return login;
		}
		else 
		{
			return null;
		}
		
	}
	

	Random r = new Random();
	Integer PostID=r.nextInt(10000);
	
	public boolean Post(UserModel post) throws SQLException //post DAO
	{
		SQL="insert into post values(?,?,?,?)";
		PST=Conn.prepareStatement(SQL);
		PST.setInt(1,PostID);
		PST.setString(2,post.getPostTitle());
		PST.setString(3,post.getPostDescription());
		PST.setString(4, post.getUserEmail());
		int x=PST.executeUpdate();
		System.out.println("post inserted...");
		PST.close();
		if (x>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public boolean PostReply(UserModel reply) throws SQLException //postReply DAO
	{
		SQL="insert into postRply  values(?,?,?)";
		PST=Conn.prepareStatement(SQL);
		PST.setInt(1,reply.getPostId());
		PST.setString(2,reply.getPostReply());
		PST.setString(3,reply.getUserEmail());
		int x=PST.executeUpdate();
		System.out.println("Reply Submitted...");
		PST.close();
		if (x>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public ResultSet AllPosts() throws SQLException  //reading All Post
	{
		SQL="select * from post";	// reading all the post
		PST=Conn.prepareStatement(SQL);
		RS=PST.executeQuery();
		return RS;
	}
	
	public ResultSet SelectedPost(Integer postId) throws SQLException 	// reading selected post
	{
		SQL="select * from post where postId=?";	// reading post
		PST=Conn.prepareStatement(SQL);
		PST.setInt(1, postId);
		RS=PST.executeQuery();
		return RS;
	}

	public ResultSet SelectedPostReply(Integer postId) throws SQLException 	// reading selected post replies
	{
		SQL="select * from postRply where POSTID=?";	// reading post replies
		PST=Conn.prepareStatement(SQL);
		PST.setInt(1,postId);
		RS=PST.executeQuery();
		return RS;
	}
	
	public ResultSet CurrentUserPost(UserModel user) throws SQLException 	// Reading post for current user
	{
		SQL="select * from post where USEREMAIL=?";	// reading post replies
		PST=Conn.prepareStatement(SQL);
		PST.setString(1, user.getUserEmail());
		RS=PST.executeQuery();
		return RS;
	}
	
	public ResultSet CurrentUserPostReply(Integer postId) throws SQLException 	// Reading post's Reply for current user
	{
		SQL="select * from postRply where POSTID=?";	// reading post replies
		PST=Conn.prepareStatement(SQL);
		PST.setInt(1, postId);
		RS=PST.executeQuery();
		return RS;
	}
	
	public boolean TeacherUrlShare(UserModel user) throws SQLException //to store teacher whiteboard url
	{
		SQL="insert into whiteboard values(?,?,?,?)";
		PST=Conn.prepareStatement(SQL);
		PST.setString(1, user.getUserName());
		PST.setString(2, user.getUserEmail());
		PST.setString(3, user.getWhiteboardName());
		PST.setString(4, user.getWhiteboardtopic());
		int x=PST.executeUpdate();
		System.out.println(" teacher whiteboard url and whiteboard topic store...");
		PST.close();
		if (x>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public boolean deleteWhiteboard(UserModel user) throws SQLException  //deting whiteboard
	{
		SQL="delete from whiteboard where username=?";
		PST=Conn.prepareStatement(SQL);
		PST.setString(1, user.getUserName());
		int x=PST.executeUpdate();
		PST.close();
		if(x>0)
		{
			return true;
			
		}
		else
		{
			return false;
		}
	}
	
	public ResultSet Selfnotes(String userName) throws SQLException , ClassNotFoundException
	{
		
		String SQL="select * from Notes where userName=?";	
		PST=Conn.prepareStatement(SQL);
		PST.setString(1,userName);
		RS=PST.executeQuery();
		return RS;
	}
	
	public ResultSet Currentnotes() throws SQLException , ClassNotFoundException
			{
				
				String SQL="select * from Notes";	
				PST=Conn.prepareStatement(SQL);
				RS=PST.executeQuery();
				return RS;
			}
	
	public ResultSet Whiteboarddetail() throws SQLException , ClassNotFoundException
	{
		
		String SQL="select * from whiteboard";	
		PST=Conn.prepareStatement(SQL);
		RS=PST.executeQuery();
		return RS;
	}
}
