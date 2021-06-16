package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
public class PostDao {
	
Connection con;

public PostDao(Connection con) {
	super();
	this.con = con;
}

public ArrayList<Category> getCategories(){
	ArrayList<Category> l = new ArrayList<>();
	try {
		String query = "select * from categories";
		Statement st = this.con.createStatement();
		ResultSet set= st.executeQuery(query);
		while(set.next()) {
			int id = set.getInt("cid");
			String name = set.getString("name");
			String desc = set.getString("description");
			Category c = new Category(id , name , desc);
			l.add(c);
			
		}
		
	}
	catch(Exception e){
	e.printStackTrace();	
	}
	return l;
	
}

//to get all the posts


public List<Post> getAllPosts(){
	List<Post> list = new ArrayList<>();
	try {
		PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc");
		ResultSet r = pstmt.executeQuery();
		while(r.next()) {
			int pid = r.getInt("pid");
			String ptitle = r.getString("ptitle");
			String pcontent = r.getString("pcontent");
			String pcode = r.getString("pcode");
			String ppic = r.getString("ppic");
			Timestamp pdate = r.getTimestamp("pdate");
			int catid = r.getInt("catid");
			int userid = r.getInt("userid");
				Post p =  new Post(pid,ptitle,pcontent, pcode,ppic,pdate,catid,userid);
				list.add(p);
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return list;
	
}

public List<Post> getPostByCatId(int catId){
	List<Post> list = new ArrayList<>();
	try {
		PreparedStatement pstmt = con.prepareStatement("select * from posts where catid=?");
		pstmt.setInt(1, catId);
		ResultSet r = pstmt.executeQuery();
		while(r.next()) {
			int pid = r.getInt("pid");
			String ptitle = r.getString("ptitle");
			String pcontent = r.getString("pcontent");
			String pcode = r.getString("pcode");
			String ppic = r.getString("ppic");
			Timestamp pdate = r.getTimestamp("pdate");
			int userid = r.getInt("userid");
				Post p =  new Post(pid,ptitle,pcontent, pcode,ppic,pdate,userid);
				list.add(p);
		
		}}
	catch(Exception e) {
		e.printStackTrace();
	}
	return list;
	
}

public boolean savePost(Post p) {
	boolean f=false;
	try {
		
		String q = "insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(q);
		ps.setString(1, p.getPtitle());
		ps.setString(2, p.getPcontent());
		ps.setString(3,p.getPcode());
		ps.setString(4, p.getPpic());
		ps.setInt(5,p.getCatid());
		ps.setInt(6,p.getUserid());
		ps.executeUpdate();
		f=true;
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return f;
}

public Post getPostByPostId(int postid) {
	Post p = null;
	String query = "select * from posts where pid=?";
	try {
	PreparedStatement pstm= this.con.prepareStatement(query);
	pstm.setInt(1, postid);
	ResultSet r = pstm.executeQuery();
	if(r.next()) {
		
		int pid = r.getInt("pid");
		String ptitle = r.getString("ptitle");
		String pcontent = r.getString("pcontent");
		String pcode = r.getString("pcode");
		String ppic = r.getString("ppic");
		Timestamp pdate = r.getTimestamp("pdate");
		int catid = r.getInt("catid");
		int userid = r.getInt("userid");
		 p =  new Post(pid,ptitle,pcontent, pcode,ppic,pdate,catid,userid);
		
		
	}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return p;
}




}
